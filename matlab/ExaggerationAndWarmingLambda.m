function [ output_args ] = ExaggerationAndWarmingLambda( t, tBuffer )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

global offset_value
output_args=offset_value/(47.230433+(-11.53292*sin(ZValue( t )))+(-28.22875*cos(ZValue( t ))) + 0.00027*tBuffer);

end

