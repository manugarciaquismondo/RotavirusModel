function [ output_args ] = ExaggerationAndWarmingLambda( t, offset_value, tBuffer)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

output_args=offset_value/(47.230433+(-11.53292*sin(ZValue( t )))+(-28.22875*cos(ZValue( t ))) + 0.00027*tBuffer);

end

