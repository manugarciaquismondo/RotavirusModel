function [ output_args ] = BaselineLambda( t, offset_value, ~ )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


output_args=offset_value/(45.552468-9.312496*sin(ZValue(t))-23.16327*cos(ZValue(t)));
% output_args=lambda_factor*((offset_value-first_amplitude*cos(ZValue(t))).^-1);
end

