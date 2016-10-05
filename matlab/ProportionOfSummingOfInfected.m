age0_infected=sum(Store_i0)/sum(Store_m0+Store_s0+Store_i0+Store_r0);
age1_infected=    sum(Store_i1)/sum(Store_s1+Store_i1+Store_r1+Store_v1);
age2_infected=   sum(Store_i2)/sum(Store_s2+Store_i2+Store_r2+Store_v2);
age3_infected=   sum(Store_i3)/sum(Store_s3+Store_i3+Store_r3+Store_v3);
age4_infected=   sum(Store_i4)/sum(Store_s4+Store_i4+Store_r4+Store_v4);

age0_infected_vector=mean(Store_i0./(Store_m0+Store_s0+Store_i0+Store_r0));
age1_infected_vector=mean(Store_i1./(Store_s1+Store_i1+Store_r1+Store_v1));
age2_infected_vector=mean(Store_i2./(Store_s2+Store_i2+Store_r2+Store_v2));
age3_infected_vector=mean(Store_i3./(Store_s3+Store_i3+Store_r3+Store_v3));
age4_infected_vector=mean(Store_i4./(Store_s4+Store_i4+Store_r4+Store_v4));

sum_infections=sum(Store_i0+Store_i1+Store_i2+Store_i3+Store_i4);

Sum_0=(Store_m0+Store_s0+Store_i0+Store_r0);

age_infected_proportions=[age0_infected age1_infected age2_infected age3_infected age4_infected];
age_infected_proportions_vector=[age0_infected_vector age1_infected_vector age2_infected_vector age3_infected_vector age4_infected_vector];
age_infected_proportions_infections=[sum(Store_i0) sum(Store_i1) sum(Store_i2) sum(Store_i3) sum(Store_i4)]/sum_infections;

all_populations = ...
Store_m0 + ...
Store_s0 + ...
Store_i0 + ...
Store_r0 + ...
Store_v1 + ...
Store_s1 + ...
Store_i1 + ...
Store_r1 + ...
Store_v2 + ...
Store_s2 + ...
Store_i2 + ...
Store_r2 + ...
Store_v3 + ...
Store_s3 + ...
Store_i3 + ...
Store_r3 + ...
Store_v4 + ...
Store_s4 + ...
Store_i4 + ...
Store_r4;

productionIterationFunctionName=func2str(productionIterationFunction);

if(strcmp(productionIterationFunctionName,'BaselineLambda'))
   all_populations_baseline=all_populations;
   age_infected_proportions_baseline=age_infected_proportions;
   age_infected_proportions_vector_baseline=age_infected_proportions_vector;
end
if(strcmp(productionIterationFunctionName,'WarmingLambda'))
   all_populations_warming=all_populations;
   age_infected_proportions_warming=age_infected_proportions;
   age_infected_proportions_vector_warming=age_infected_proportions_vector;
end
if(strcmp(productionIterationFunctionName,'ExternalAndWarmingLambda'))
   all_populations_external=all_populations;
   age_infected_proportions_external=age_infected_proportions;
   age_infected_proportions_vector_external=age_infected_proportions_vector;
end
if(strcmp(productionIterationFunctionName,'ExaggerationAndWarmingLambda'))
   all_populations_exaggeration=all_populations;
   age_infected_proportions_exaggeration=age_infected_proportions;
   age_infected_proportions_vector_exaggeration=age_infected_proportions_vector;
end

if(strcmp(productionIterationFunctionName,'BaselineLambda'))
   if(base_nu==0)
       infection_baseline_no_vaccination=age_infected_proportions_infections;
   end
   if(base_nu==0.0001)
       infection_baseline_standard_vaccination=age_infected_proportions_infections;
   end
   if(base_nu==0.0002)
       infection_baseline_double_vaccination=age_infected_proportions_infections;
   end
end
if(strcmp(productionIterationFunctionName,'WarmingLambda'))
   if(base_nu==0)
       infection_warming_no_vaccination=age_infected_proportions_infections;
   end
   if(base_nu==0.0001)
       infection_warming_standard_vaccination=age_infected_proportions_infections;
   end
   if(base_nu==0.0002)
       infection_warming_double_vaccination=age_infected_proportions_infections;
   end
end
if(strcmp(productionIterationFunctionName,'ExternalAndWarmingLambda'))
   if(base_nu==0)
       infection_external_no_vaccination=age_infected_proportions_infections;
   end
   if(base_nu==0.0001)
       infection_external_standard_vaccination=age_infected_proportions_infections;
   end
   if(base_nu==0.0002)
       infection_external_double_vaccination=age_infected_proportions_infections;
   end
end
if(strcmp(productionIterationFunctionName,'ExaggerationAndWarmingLambda'))
   if(base_nu==0)
       infection_exaggeration_no_vaccination=age_infected_proportions_infections;
   end
   if(base_nu==0.0001)
       infection_exaggeration_standard_vaccination=age_infected_proportions_infections;
   end
   if(base_nu==0.0002)
       infection_exaggeration_double_vaccination=age_infected_proportions_infections;
   end
end