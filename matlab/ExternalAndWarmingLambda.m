function [ output_args ] = ExternalAndWarmingLambda( t, ~ )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
global offset_value
output_args=offset_value/(47.230433+(-11.53292*sin(ZValue( t )))+(-28.22875*cos(ZValue( t ))));
end

