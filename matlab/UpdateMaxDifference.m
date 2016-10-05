function [ output_args ] = UpdateMaxDifference( diffValue, globalStoreVector, betaIndex1, betaIndex2, dataName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
diffBuffer= max(abs(globalStoreVector(betaIndex1,:)-globalStoreVector(betaIndex2,:)));
if(diffBuffer==0)
    fprintf('Versions %d and %d do not differ for %s data\n', betaIndex1, betaIndex2, dataName);
end
output_args=max(diffValue,diffBuffer); 

end

