function [ output_args ] = FindMaxIndex( inputStoreVector )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    maxValues= max(inputStoreVector');
    minValues= min(inputStoreVector');
    for sizeIterator=1:size(inputStoreVector,1)
        output_args(1,sizeIterator)=find(inputStoreVector(sizeIterator,:)==maxValues(sizeIterator),1);
        output_args(2,sizeIterator)=find(inputStoreVector(sizeIterator,:)==minValues(sizeIterator),1);
    end
end

