numGroups = 15;
numLayers = 5;
popProportion = [NP.modelProportion];
ConnectivityData = struct();

% Calculate the number of connections from each individual presynaptic
% neuron to all postsynaptic neurons based on the connectivity data in
% Binzegger et al. 2004 (adjusted to remove thalamic connections and
% connections to/from unmodelled neuron groups)

ConnectivityData(1).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(2).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(3).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(4).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(5).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(6).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(7).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(8).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(9).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(10).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(11).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(12).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(13).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(14).incomingSynapses = [0; 0; 0; 0; 0];
ConnectivityData(15).incomingSynapses = [0; 0; 0; 0; 0];

ConnectivityData(1).preConnectionProportionArr = ...
    [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    [0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0,0, 0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ConnectivityData(2).preConnectionProportionArr = ...
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ConnectivityData(3).preConnectionProportionArr = ...
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 1 0 0 0];
ConnectivityData(4).preConnectionProportionArr = ...
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ConnectivityData(5).preConnectionProportionArr = ...
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ConnectivityData(6).preConnectionProportionArr = ...
    [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ConnectivityData(7).preConnectionProportionArr = ...
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ConnectivityData(8).preConnectionProportionArr = ...
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ConnectivityData(9).preConnectionProportionArr = ...
    [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ConnectivityData(10).preConnectionProportionArr = ...
    [ [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ConnectivityData(11).preConnectionProportionArr = ...
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ConnectivityData(12).preConnectionProportionArr = ...
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ConnectivityData(13).preConnectionProportionArr = ...
    [0.0  0.0  0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];];
ConnectivityData(14).preConnectionProportionArr = ...
    [ [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; ...
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;]];
ConnectivityData(15).preConnectionProportionArr = ...
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; ...
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;]];


invertingRatioArr = ...
    {ConnectivityData.preConnectionProportionArr};
for iPost=1:numGroups
  for iPre=1:numGroups
    invertingRatioArr{iPost}(:,iPre) = ...
        ones(numLayers,1) ...
        .* (popProportion(iPost)...
            / popProportion(iPre));
  end
end

% Calculate the absolute number of synapses (all:one) from the
% preConnectionProportionArr and the total number of synapses received in
% each layer
for iPost = 1:numGroups
  ConnectivityData(iPost).numConnectionsToOneFromAll = ...
  round(ConnectivityData(iPost).preConnectionProportionArr ...
   .* repmat(ConnectivityData(iPost).incomingSynapses, ...
                                        1,numGroups));
end

% Calculate the absolute number of synapses (one:all) from the already
% established number of all:one connections and the invertingRatioArr
CP = struct();
for iPost = 1:numGroups
  CP(iPost).numConnectionsToAllFromOne = cell(1,numLayers);
  for iPre = 1:numGroups
    CP(iPost).numConnectionsToAllFromOne{iPre} = ...
         (round(ConnectivityData(iPre).numConnectionsToOneFromAll(:,iPost) ...
         .* invertingRatioArr{iPre}(:,iPost)))';
  end
end

clear ConnectivityData popProportion numLayers;
%%
% Patterns of connectivity for each cell type. Rows: post, cols: pre.
% Based on Traub et al. 2005 J. Neurophysiol.

for iPre = 1:numGroups
  CP(iPre).targetCompartments = cell(1,numGroups);
end

CP(1).targetCompartments{1} = {'obliqueID', 'basalID'};
CP(1).targetCompartments{2} = {'distalID'};
CP(1).targetCompartments{3} = {'distalID'};
CP(1).targetCompartments{4} = {'distalID'};
CP(1).targetCompartments{5} = {'distalID'};
CP(1).targetCompartments{6} = {'obliqueID', 'basalID'};
CP(1).targetCompartments{7} = {'distalID'};
CP(1).targetCompartments{8} = {'distalID'};
CP(1).targetCompartments{9} = ...
              unique({'basalID', 'apicalID', ...
                      'proximalID','obliqueID'});
CP(1).targetCompartments{10} = ...
            unique({'basalID', 'apicalID', ...
                      'proximalID','obliqueID'});
CP(1).targetCompartments{11} = {'distalID'};
CP(1).targetCompartments{12} = {'distalID'};
CP(1).targetCompartments{13} = ...
            unique({'basalID', 'apicalID', ...
                    'tuftID', ...
                    'proximalID', 'obliqueID'});
CP(1).targetCompartments{14} = ...
            unique({'basalID', 'apicalID', ...
                    'tuftID', ...
                    'proximalID', 'obliqueID'});
CP(1).targetCompartments{15} = {'distalID'};
                                                
CP(2).targetCompartments{1} = unique({'somaID', 'proximalID'});
CP(2).targetCompartments{2} = {'distalID'};
CP(2).targetCompartments{3} = {'distalID'};
CP(2).targetCompartments{4} = unique({'somaID', 'proximalID'});
CP(2).targetCompartments{5} = unique({'somaID', 'proximalID'});
CP(2).targetCompartments{6} = unique({'somaID', 'proximalID'});
CP(2).targetCompartments{7} = {'distalID'};
CP(2).targetCompartments{8} = {'distalID'};
CP(2).targetCompartments{9} = unique({'somaID', 'proximalID'});
CP(2).targetCompartments{10} = unique({'somaID', 'proximalID'});
CP(2).targetCompartments{11} = {'distalID'};
CP(2).targetCompartments{12} = {'distalID'};
CP(2).targetCompartments{13} = unique({'somaID', 'proximalID'});
CP(2).targetCompartments{14} = unique({'somaID', 'proximalID'});
CP(2).targetCompartments{15} = {'distalID'};
                                                
                                                
CP(3).targetCompartments{1} = ...
                 unique({'obliqueID', 'tuftID', ...
                         'apicalID', 'distalID'});
CP(3).targetCompartments{2} = {'distalID'};
CP(3).targetCompartments{3} = {'distalID'};
CP(3).targetCompartments{4} = {'distalID'};
CP(3).targetCompartments{5} = {'distalID'};
CP(3).targetCompartments{6} = ...
                 unique({'obliqueID', 'tuftID', ...
                         'apicalID', 'distalID'});
CP(3).targetCompartments{7} = {'distalID'};
CP(3).targetCompartments{8} = {'distalID'};
CP(3).targetCompartments{9} = ...
               unique({'obliqueID', 'distalID', ...
                           'tuftID', 'apicalID'});
CP(3).targetCompartments{10} = ...
               unique({'obliqueID', 'distalID', ...
                           'tuftID', 'apicalID'});
CP(3).targetCompartments{11} = {'distalID'};
CP(3).targetCompartments{12} = {'distalID'};
CP(3).targetCompartments{13} = ...
               unique({'obliqueID', 'distalID', ...
                           'tuftID', 'apicalID'});
CP(3).targetCompartments{14} = ...
               unique({'obliqueID', 'distalID', ...
                           'tuftID', 'apicalID'});
CP(3).targetCompartments{15} = {'distalID'};

                                                
CP(4).targetCompartments{1} = {'basalID'};
CP(4).targetCompartments{2} = {'distalID'};
CP(4).targetCompartments{3} = {'distalID'};
CP(4).targetCompartments{4} = {'distalID'};
CP(4).targetCompartments{5} = {'distalID'};
CP(4).targetCompartments{6} = {'basalID'};
CP(4).targetCompartments{7} = {'distalID'};
CP(4).targetCompartments{8} = {'distalID'};
CP(4).targetCompartments{9} = ...
                unique({'obliqueID', 'trunkID', 'apicalID'});
CP(4).targetCompartments{10} = ...
                unique({'obliqueID', 'trunkID', 'apicalID'});
CP(4).targetCompartments{11} = {'distalID'};
CP(4).targetCompartments{12} = {'distalID'};
CP(4).targetCompartments{13} = ...
                unique({'apicalID', 'trunkID'});
CP(4).targetCompartments{14} = ...
                unique({'apicalID', 'trunkID'});
CP(4).targetCompartments{15} = {'distalID'};
                          
CP(5).targetCompartments = CP(4).targetCompartments;
CP(6).targetCompartments = CP(1).targetCompartments;

CP(7).targetCompartments = CP(2).targetCompartments;
CP(8).targetCompartments = CP(3).targetCompartments;

CP(9).targetCompartments{1} = {'apicalID', 'tuftID'};
CP(9).targetCompartments{2} = {'distalID'};
CP(9).targetCompartments{3} = {'distalID'};
CP(9).targetCompartments{4} = {'distalID'};
CP(9).targetCompartments{5} = {'distalID'};
CP(9).targetCompartments{6} = {'apicalID', 'tuftID'};
CP(9).targetCompartments{7} = {'distalID'};
CP(9).targetCompartments{8} = {'distalID'};
CP(9).targetCompartments{9} = ...
               unique({'obliqueID', 'apicalID', ...
                           'trunkID', 'basalID'});
CP(9).targetCompartments{10} = ...
               unique({'obliqueID', 'apicalID', ...
                         'trunkID', 'basalID'});
CP(9).targetCompartments{11} = {'distalID'};
CP(9).targetCompartments{12} = {'distalID'};
CP(9).targetCompartments{13} = ...
             unique({'obliqueID', 'apicalID', ...
                     'trunkID', 'basalID', ...
                     'tuftID'});
CP(9).targetCompartments{14} = ...
             unique({'obliqueID', 'apicalID', ...
                     'trunkID', 'basalID', ...
                     'tuftID'});
CP(9).targetCompartments{15} = {'distalID'};
                         
CP(10).targetCompartments = CP(9).targetCompartments;
CP(11).targetCompartments = CP(2).targetCompartments;
CP(12).targetCompartments = CP(3).targetCompartments;
                                                
CP(13).targetCompartments{1} = {'apicalID'};
CP(13).targetCompartments{2} = {'distalID'};
CP(13).targetCompartments{3} = {'distalID'};
CP(13).targetCompartments{4} = {'distalID'};
CP(13).targetCompartments{5} = {'distalID'};
CP(13).targetCompartments{6} = {'apicalID'};
CP(13).targetCompartments{7} = {'distalID'};
CP(13).targetCompartments{8} = {'distalID'};
CP(13).targetCompartments{9} = ...
               unique({'obliqueID', 'apicalID', ...
                           'trunkID', 'basalID'});
CP(13).targetCompartments{10} = ...
             unique({'obliqueID', 'apicalID', ...
                         'trunkID', 'basalID'});
CP(13).targetCompartments{11} = {'distalID'};
CP(13).targetCompartments{12} = {'distalID'};
CP(13).targetCompartments{13} = ...
             unique({'obliqueID', 'apicalID', ...
                     'trunkID', 'basalID', ...
                     'tuftID'});
CP(13).targetCompartments{14} = ...
             unique({'obliqueID', 'apicalID', ...
                     'trunkID', 'basalID', ...
                     'tuftID'});
CP(13).targetCompartments{15} = {'distalID'};

CP(14).targetCompartments = CP(13).targetCompartments;
CP(15).targetCompartments = CP(2).targetCompartments;

groupWeightMat =  0.*[ ...
0.020 0.101 0.001 0.889/2.5 0.090/2.5 0.182/2.5 0.864 0.000 0.004 0.000 0.000 0.000 0.047 0.000 0.000;...
0.560 0.021 0.001 1.401/2 0.156/2 0.321/2 0.182 0.000 0.074 0.000 0.000 0.000 0.159 0.000 0.000;...
0.408 0.055 0.011 1.743/2 0.169/2 0.346/2 0.465 0.000 0.159 0.000 0.000 0.000 0.178 0.000 0.000;...
0.001 0.034 0.000 0.067 0.092 0.061 0.008 0.002 0.069 0.069 0.000 0.000 0.004 0.000 0.000;...
0.001 0.034 0.000 0.067 0.092 0.061 0.009 0.002 0.069 0.069 0.000 0.000 0.004 0.000 0.000;...
0.001 0.034 0.006 0.067 0.092 0.061 0.011 0.001 0.069 0.069 0.000 0.000 0.004 0.004 0.000;...
0.507/5 0.078 0.000 0.358*1.75 0.358*1.75 0.358*1.75 0.020 0.002 0.841 0.841 0.000 0.000 0.062 0.062 0.000;...
0.696/5 0.195 0.000 0.318 0.318 0.318 0.054 0.010 1.058 1.058 0.000 0.000 0.052 0.000 0.000;...
0.037 0.150 0.003 0.091 0.082 0.050 0.273 0.004 0.079 0.471 0.367 0.002 0.032 0.093 0.000;...
0.037 0.150 0.003 0.091 0.082 0.050 0.231 0.004 0.062 0.335 0.333 0.002 0.032 0.093 0.000;...
0.208/2.5 0.078 0.000 0.274 0.273 0.151 0.153 0.000 0.364*2.5 3.966 0.133 0.002 0.342 0.207 0.000;...
0.160/2.5 0.195 0.000 0.331 0.422 0.196 0.417 0.000 0.241*2.5 2.596 0.133 0.011 0.359 0.657 0.000;...
0.003 0.836 0.012 0.137 0.145 0.095 0.181 0.001 0.253/3 0.164/3 0.704/3 0.003 0.064 0.062 0.060;...
0.003 0.836 0.012 0.137 0.145 0.095 0.782 0.013 0.604/3 0.164/3 0.704/3 0.003 0.064 0.062 0.038;...
0.493/4 0.112 0.000 0.274 0.273 0.151 0.154 0.000 0.362/4 0.362/4 0.017 0.000 0.442*2.5 0.307*2.5 0.012]; % temp adding the *2 as test

ex = [1 4 5 6 9 10 13 14];
in = [2 3 7 8 11 12 15];

for iGroup = 1:numGroups
  CP(iGroup).weights = cell(1,numGroups);
end

arborRadii = [ ...
  0.55	1.12	0.15	1.00	0.15;
  0.05	0.50	0.15	0.15	0.05;
  0.20	0.20	0.20	0.20	0.20;
  0.05	0.30	1.12	0.40	0.15;
  0.15	0.40	0.50	0.15	0.15;
  0.15	1.12	0.15	0.55	0.15;
  0.05	0.05	0.50	0.05	0.05;
  0.20	0.20	0.20	0.20	0.20;
  0.15	0.40	0.30	0.50	0.25;
  0.05	0.05	0.15	0.50	1.00;
  0.05	0.05	0.05	0.50	0.05;
  0.20	0.20	0.20	0.20	0.20;
  0.05	0.15	1.00	0.15	0.15;
  0.05	0.05	0.15	0.50	1.00;
  0.05	0.05	0.05	0.05	0.50].*0.5.*1000;

for iPre = 1:numGroups
  CP(iPre).axonArborSpatialModel = 'gaussian';
  CP(iPre).sliceSynapses = true;
  CP(iPre).axonArborRadius = arborRadii(iPre, :);
  CP(iPre).axonConductionSpeed = 0.3;
  CP(iPre).synapseReleaseDelay = 1.0;
  for iPost = 1:numGroups
    CP(iPre).synapseType{iPost} = 'g_exp';
    if ismember(iPre,ex) && ismember(iPost,ex)
      CP(iPre).tau{iPost} = 60;
      CP(iPre).E_reversal{iPost} = 0;
      CP(iPre).weights{iPost} = groupWeightMat(iPost, iPre)*1.25;
    elseif ismember(iPre,ex) && ismember(iPost,in)
      CP(iPre).tau{iPost} = 150;
      CP(iPre).E_reversal{iPost} = 0;
      CP(iPre).weights{iPost} = groupWeightMat(iPost, iPre)*0.75;
    elseif ismember(iPre,in) && ismember(iPost,ex)
      CP(iPre).tau{iPost} = 280;
      CP(iPre).E_reversal{iPost} = -75;
      CP(iPre).weights{iPost} = groupWeightMat(iPost, iPre).*1.25; % was multiplied by 1.25
    elseif ismember(iPre,in) && ismember(iPost,in)
      CP(iPre).tau{iPost} = 380;
      CP(iPre).E_reversal{iPost} = -75;
      CP(iPre).weights{iPost} = groupWeightMat(iPost, iPre).*0.75; % was multiplied by 1.25
    else
      disp('WTF?!')
    end
  end
end

clear numGroups arborRadii ex in groupWeightMat iPre iPost;
