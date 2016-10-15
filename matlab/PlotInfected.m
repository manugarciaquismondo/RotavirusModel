SumTotalStore
% ylim([0 1e-6] );
scale_factor=1e6;
scale_factor=1;
all_infected = Store_i0+ Store_i1+ Store_i2+ Store_i3+ Store_i4;
all_infected_rescaled=all_infected*scale_factor/TotalStore(1);
if(not(exist('imageRoute')))
    imageRoute='image';
end
figureInfected = figure;
axes1 = axes('Parent',figureInfected);
hold(axes1,'all');
plot(all_infected_rescaled);
xlabel('Simulated day');
ylabel('Summing of infected population');
results_route = strcat('../images/',imageRoute,'.jpeg');
saveas(figureInfected,results_route)

% all_infected = Burnin_store_i0 + Burnin_store_i1 +Burnin_store_i2 +Burnin_store_i3 + Burnin_store_i4;
% RetrieveTotalStore
% all_infected_normalized=all_infected./TotalStore;
% simulated_week=1:size(all_infected,2);
% initial_time_offset=iterationsPerYear*5;
% % initial_time_offset=1;
% finalIndex=size(all_infected, 2);
% all_infected=all_infected(initial_time_offset:finalIndex);
% simulated_week=simulated_week(initial_time_offset:finalIndex);
% % plot(simulated_week(1:(finalIndex-initial_time_offset+1)),all_infected(1:(finalIndex-initial_time_offset+1)));
% % plot(simulated_week(1:(burninyears*iterationsPerYear-initial_time_offset)),all_infected(1:(burninyears*iterationsPerYear-initial_time_offset)));
% % plot(simulated_week((burninyears*iterationsPerYear-initial_time_offset-1):size(simulated_week,2)),all_infected((burninyears*iterationsPerYear-initial_time_offset-1):size(all_infected,2)));
% transitionYears=10;
% plot(simulated_week((burninyears*iterationsPerYear-initial_time_offset-iterationsPerYear*transitionYears):(burninyears*iterationsPerYear-initial_time_offset+iterationsPerYear*transitionYears)),all_infected((burninyears*iterationsPerYear-initial_time_offset-iterationsPerYear*transitionYears):(burninyears*iterationsPerYear-initial_time_offset+iterationsPerYear*transitionYears)));
% plot(simulated_week((burninyears*iterationsPerYear-initial_time_offset-1):(burninyears*iterationsPerYear-initial_time_offset+iterationsPerYear*transitionYears)),all_infected((burninyears*iterationsPerYear-initial_time_offset-1):(burninyears*iterationsPerYear-initial_time_offset+iterationsPerYear*transitionYears)));
% plot(all_infected);
% plot(all_infected(1:(preparationYears*iterationsPerYear)));
% plot(all_infected(preparationIterations:(size(all_infected,2))));
% plot(all_infected(1:(preparationIterations+600*iterationsPerYear)));
% plot(all_infected((preparationIterations):size(all_infected,2)));
% plot(all_infected((size(all_infected,2)-(burninyears-preparationYears)*iterationsPerYear):size(all_infected,2)));
% plot(all_infected((size(all_infected,2)-(burninyears-preparationYears)*iterationsPerYear-800):(size(all_infected,2)-(burninyears-preparationYears)*iterationsPerYear+2000)));
% plot(all_infected(2877520:(2877520+50*365)));
% plot(all_infected((productionOverlap+1):size(all_infected,2)));
% ylim([0 1e-5]);
% ylim([0 1e-4]);
% plot(all_infected(1:50));
% plot(all_infected);
% xlabel('Simulated day');
% ylabel('Summing of infected population');
% ylim([0 1e-5]);
% xlim([size(all_infected,2)-50000 size(all_infected,2)]);
% xlim([1 365*15]);