function [ result ] = updateRecovered(rotavirusPop, inputStage, firstDivisor, secondDivisor)
global nu kappa lambda omega_R iota gamma
multiplierSwitch=getMultiplierSwitcher(inputStage);
result = rotavirusPop.recovered(inputStage)  + (1-secondDivisor)*iota*gamma*rotavirusPop.infected(inputStage) + (1-nu)*firstDivisor*rotavirusPop.recovered(inputStage-1) + firstDivisor*iota*gamma*rotavirusPop.infected(inputStage-1)...
    - multiplierSwitch*secondDivisor*rotavirusPop.recovered(inputStage) - (1-secondDivisor)*kappa*omega_R*(1-lambda)*rotavirusPop.recovered(inputStage)*sum(rotavirusPop.infected(:))...
    - (1-secondDivisor)*nu*rotavirusPop.recovered(inputStage);

end

