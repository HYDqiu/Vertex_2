classdef SynapseModel_g_stdp_delays < SynapseModel
  %SynapseModel_g_exp Conductance-based single exponential synapses
  %   Parameters to set in ConnectionParams:
  %   - E_reversal, the reversal potential (in mV)
  %   - tau, the synaptic decay time constant (in ms)

  properties (SetAccess = protected)

    tPre
    tPost
    wmin
    wmax
    Apre
    Apost
    E_reversal
    tau
    g_exp
    g_expEventBuffer
    bufferCount
    bufferMax
    preBoundaryArr
    preGroupIDs
    preBoundaryArrPerN
    preABSID
  end
  
  properties (SetAccess=public)
    preGroups
    preRate
    postRate
    spikeArrLogicInd
  end
  
  methods
      % Synapse model will be a cell array containing a struct for each
      % connection type indexed by the post synaptic group then the
      % presynaptic synapse group(may contain multiple neuron groups). The struct contains variables for all
      % neurons in the presynatpic synapse group and all neurons in the post
      % synaptic group. Or all post synaptic neurons on the lab and all
      % presynaptic neurons regardless of lab, if using parallel mode. 
    function SM = SynapseModel_g_stdp_delays(Neuron, CP, SimulationSettings, ...
                                     postID, number_in_post,number_in_pre,pre_group_ids, group_boundary)
                                 
      SM = SM@SynapseModel(Neuron, number_in_post);
      SM.E_reversal = CP.E_reversal{postID};
      SM.tPre = CP.tPre{postID};
      SM.tPost = CP.tPost{postID};
      SM.preRate = CP.rate{postID};
      SM.postRate = -CP.rate{postID};
      SM.wmin = CP.wmin{postID};
      SM.wmax = CP.wmax{postID};
      SM.tau = CP.tau{postID};
      SM.bufferCount = 1;
      SM.preBoundaryArr = [0; cumsum(number_in_pre)];
      
      SM.preGroupIDs = pre_group_ids;
      SM.preBoundaryArrPerN = zeros(sum(number_in_pre),2,'uint16');
      SM.preABSID = zeros(sum(number_in_pre),1, 'uint16');

      for iB = 2:length(SM.preBoundaryArr)
          
          SM.preBoundaryArrPerN(SM.preBoundaryArr(iB-1)+1:SM.preBoundaryArr(iB),1 ) = SM.preBoundaryArr(iB-1);
          SM.preBoundaryArrPerN(SM.preBoundaryArr(iB-1)+1:SM.preBoundaryArr(iB),2 ) = SM.preGroupIDs(iB-1);
          SM.preABSID(SM.preBoundaryArr(iB-1)+1:SM.preBoundaryArr(iB),1 ) = ...
              (SM.preBoundaryArr(iB-1)+1:SM.preBoundaryArr(iB))-SM.preBoundaryArr(iB-1) ...
              +group_boundary(SM.preGroupIDs(iB-1));
      end
      
      
      maxDelaySteps = SimulationSettings.maxDelaySteps;
      numComparts = Neuron.numCompartments;
      SM.g_exp = zeros(number_in_post, numComparts);
      SM.spikeArrLogicInd = cell(maxDelaySteps,1);
      
      for i = 1:length(SM.spikeArrLogicInd)
          SM.spikeArrLogicInd{i} = speye(number_in_post,sum(number_in_pre));
          SM.spikeArrLogicInd{i}(:) = false;
      end
      %trace variable for presynaptic neurons, contains an entry for each
      %neuron in the presynaptic group of the connection.
      SM.Apre = zeros(maxDelaySteps,sum(number_in_pre));

      %trace variable for postsynaptic neurons, contains an entry for each
      %neuron in the post synaptic group of the connection.
      SM.Apost = zeros(1,number_in_post);
      

      SM.g_expEventBuffer = zeros(number_in_post, numComparts, maxDelaySteps);
      SM.bufferMax = maxDelaySteps;

      if SM.tau <= 0
        error('vertex:SynapseModel_g_exp', ...
           'tau must be greater than zero');
      end
    end

    
    function SM = updateBuffer(SM)
       %Extract spike acumulator value at current buffer location
      SM.g_exp = SM.g_exp + SM.g_expEventBuffer(:, :, SM.bufferCount);
      
      SM.g_expEventBuffer(:, :, SM.bufferCount) = 0;
      
      %SM.Apre(SM.bufferCount,:) = 0;
      SM.Apre(SM.bufferCount+1,:) = SM.Apre(SM.bufferCount,:);
      SM.spikeArrLogicInd{SM.bufferCount}(:) = false;
      
      SM.bufferCount = SM.bufferCount + 1;
      
      if SM.bufferCount > SM.bufferMax
        SM.bufferCount = 1;
        SM.Apre(SM.bufferCount,:) = SM.Apre(SM.bufferMax,:);
      end
    end
    
    function SM = updateSynapses(SM, NM, dt)
        
      % update synaptic currents
      
      SM.I_syn = SM.g_exp .* (NM.v() - SM.E_reversal);
      
      % update synaptic conductances
      kg = - SM.g_exp ./ SM.tau;
      k2g_in = SM.g_exp + 0.5 .* dt .* kg;
      kg = - k2g_in ./ SM.tau;
      SM.g_exp = SM.g_exp + dt .* kg;
      SM.Apre(SM.bufferCount,:) = SM.Apre(SM.bufferCount,:) + (( - SM.Apre(SM.bufferCount,:))./SM.tPre).*dt;
      SM.Apost = SM.Apost + ((-  SM.Apost)./SM.tPost).*dt;
      
    end
    
    function weightsArr = updateWeights(SM,weightsArr,IDMap,postGroup, synArr)
        %Retreive relative pre and post synaptic IDs of arriving spikes
        [post, pre] = find(SM.spikeArrLogicInd{SM.bufferCount});
        %Convert to absolute IDs for accessing weights array.
        postAbs = IDMap.cellIDToModelIDMap{postGroup}(post);
        pre = SM.preABSID(pre);
        for i = find(SM.Apost(post)<0)
            postLoc = (synArr{pre(i), 1}== postAbs(i));
            weightsArr{pre(i)}(postLoc) = weightsArr{pre(i)}(postLoc) + SM.Apost(post(i));
        end
    end

    
    %This is called when spikes are generated in a neuron of the presynatpic group of this SynapseModel object.
    %WeightsArr contains weights for connections from the spiking neuron
    % to the postsynaptic neurons that it connects to. postInd is refers to
    % the neurons (of this connection group) that the spiking neuron
    % synapses on to.
    function weightsArr = updateweightsaspresynspike(SM, weightsArr, postInd)
        %update the weight array for all connections from spiking neuron to
        %all post synaptic neurons.
        weightsArr = weightsArr + SM.Apost(postInd);
        weightsArr(weightsArr<SM.wmin) = SM.wmin;
        weightsArr(weightsArr>SM.wmax) = SM.wmax;
    end
    
    % Called when spike has been generated by a post synaptic neuron in this group 
    function weightsArr = updateweightsaspostsynspike(SM, weightsArr, preInd,groupID, delay)
        %update the weight array for all connections from spiking neuron to
        %all pre synaptic neurons.

        preInd = preInd + SM.preBoundaryArr(ismember(SM.preGroupIDs,groupID));
        ind = sub2ind(size(SM.Apre), delay, preInd);

        weightsArr = weightsArr + SM.Apre(ind)';

        
           % preInd = preInd + SM.preBoundaryArr(SM.preGroupIDs==groupID);
%        weightsArr = weightsArr +SM.Apre(delay, preInd);

        weightsArr(weightsArr<SM.wmin) = SM.wmin;
        weightsArr(weightsArr>SM.wmax) = SM.wmax;
    end
    
    %spikeInd are the indices of presynaptic neurons fromt this group
    %that have spiked during this cycle
    function SM = processAsPreSynSpike(SM, preSpikeInd,groupID, postInd,bufferLoc)
        %update presynaptic trace variable Apre, should be same for all
        %presynaptic connections because the synapse parameters should be
        %the same for all group to group defined connections. 
        
        preSpikeInd = preSpikeInd + SM.preBoundaryArr(SM.preGroupIDs==groupID); % convert from neuron group relative ID to synapse group relative ID

        %for each post synaptic neuron
        for i = 1:length(bufferLoc)
            SM.spikeArrLogicInd{bufferLoc(i)}(postInd(i),preSpikeInd) = true;
        end% place into the spike buffer at the buffer location (the current time + delay)
        
        SM.Apre(SM.bufferCount,preSpikeInd) = SM.Apre(SM.bufferCount,preSpikeInd) + SM.preRate; % Increment Apre at the current position. 
    end
    
    %spikeInd are the indices of postsynaptic neurons from this group that
    %have spiked in this cycle
    function SM = processAsPostSynSpike(SM, spikeInd)
        
        SM.Apost(spikeInd) = SM.Apost(spikeInd) + SM.postRate;
    end


    %The is called when spikes are generated in neurons specified by preInd
    %the postsynaptic neurons (as well as its compartment and the time at
    %which the spike should arrive) are specified by the synIndeces
    %parameter. This is a reduction of a 3 dimensional index, details of its
    %calculation are in the simulate function.
    function SM = bufferIncomingSpikes(SM, synIndeces, weightsToAdd)

      SM.g_expEventBuffer(synIndeces) = ...
                            SM.g_expEventBuffer(synIndeces) + ((weightsToAdd));
      
    end
    
    function Apost = get.Apost(SM)
        Apost=SM.Apost;
    end
    
    function Apre = get.Apre(SM)
        Apre=SM.Apre;
    end
    
    function check = hasArrivingSpikes(SM)
        check = nnz(SM.spikeArrLogicInd{SM.bufferCount})>1;
    end
    
    function SM = randomInit(SM, g_mean, g_std)
      SM.g_exp = g_std .* randn(size(SM.g_exp)) + g_mean;
      SM.g_exp(SM.g_exp < 0) = 0;
    end
    
    function g = get.g_exp(SM)
      g = SM.g_exp;
    end
    function [Apre] = getApre(SM, preInd, groupID)

        preInd = preInd + SM.preBoundaryArr(SM.preGroupIDs==groupID);
        Apre = SM.Apre(SM.bufferCount,preInd);
    end
    function [Apost] = getApost(SM, postInd)
        Apost = SM.Apost(postInd);
    end

  end % methods
  
  methods(Static)
      function params = getRequiredParams()
          params = {'tau', 'E_reversal', 'tPre','tPost','wmin','wmax', 'rate'};
      end
  end

end % classdef