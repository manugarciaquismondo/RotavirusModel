function [ output_args ] = WarmingLambda( t, offset_value, tBuffer)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
output_args= offset_value/(45.552468+(-9.312496*sin(ZValue( t )))+(-23.16327*cos(ZValue( t ))) + 0.00027*tBuffer);

end

