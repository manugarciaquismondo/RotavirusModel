classdef RotavirusPopulation
    %Population class
    properties (SetAccess = public)
        maternity
        susceptible
        infected
        recovered
        vaccinated
    end
    methods
        function obj=RotavirusPopulation(InitialTotalPop, stages)
            obj.maternity=1000/InitialTotalPop;
            obj.susceptible(1:stages)=1000/InitialTotalPop;
            obj.infected(1:stages)=1000/InitialTotalPop;
            obj.recovered(1:stages)=1000/InitialTotalPop;
            obj.vaccinated(1:stages)=1000/InitialTotalPop;
        end
    end
end