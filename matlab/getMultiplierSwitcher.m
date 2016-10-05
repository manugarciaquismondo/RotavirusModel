function [ switchMultiplier ] = getMultiplierSwitcher( inputStage )
    global stages multiplier4
    if inputStage==stages
        switchMultiplier=multiplier4;
    else
        switchMultiplier=1;
    %UNTITLED7 Summary of this function goes here
    %   Detailed explanation goes here
    end
end

