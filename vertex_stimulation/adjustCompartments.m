function [ NeuronParams ] = adjustCompartments( NeuronParams, tp )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
tp.numGroups = 1;
NParams = calculatePassiveProperties(NeuronParams, tp);
[l,d] = getDimensionsInCentimetres(NParams);
% space constant determines how many we have and their size. 
% default is sqrt(d./4.*(NParams.R_A/1000).*(NParams.g_l))*100
% according to Rattay this would be better divided by 4!
NParams.spaceconstant = (sqrt(d./4.*(NParams.R_A/1000).*(NParams.g_l))*100)*2; %multiplying by 2 to reduce compartments. 
NeuronParams.spaceconstant = NParams.spaceconstant;
while sum(NeuronParams.compartmentLengthArr > NeuronParams.spaceconstant)>0
    NeuronParams = decreaseCompartmentLength(NeuronParams);
    NParams = calculatePassiveProperties(NeuronParams, tp);
    [l,d] = getDimensionsInCentimetres(NParams);
    NParams.spaceconstant =(4.*(NParams.R_A).*(NParams.g_l.*10^-9).^(1/2))*10000;
    NParams.spacecounstant =  d./NParams.spaceconstant;
    NeuronParams.spaceconstant = NParams.spaceconstant;
end

end

