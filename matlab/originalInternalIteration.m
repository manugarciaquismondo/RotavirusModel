% Comment inserted again

Store_m0=zeros(1,storedIterations);
Store_s0=zeros(1,storedIterations);
Store_i0=zeros(1,storedIterations);
Store_r0=zeros(1,storedIterations);
Store_v1=zeros(1,storedIterations);
Store_s1=zeros(1,storedIterations);
Store_i1=zeros(1,storedIterations);
Store_r1=zeros(1,storedIterations);
Store_v2=zeros(1,storedIterations);
Store_s2=zeros(1,storedIterations);
Store_i2=zeros(1,storedIterations);
Store_r2=zeros(1,storedIterations);
Store_v3=zeros(1,storedIterations);
Store_s3=zeros(1,storedIterations);
Store_i3=zeros(1,storedIterations);
Store_r3=zeros(1,storedIterations);
Store_v4=zeros(1,storedIterations);
Store_s4=zeros(1,storedIterations);
Store_i4=zeros(1,storedIterations);
Store_r4=zeros(1,storedIterations);
Store_v5=zeros(1,storedIterations);
Store_s5=zeros(1,storedIterations);
Store_i5=zeros(1,storedIterations);
Store_r5=zeros(1,storedIterations);


totalIterations=(simulatedYears*iterationsPerYear);
preparationIterations=preparationYears*iterationsPerYear;
firstIndexStoredValues=totalIterations-storedIterations;
h = waitbar(0, 'Simulation started');
tBuffer=0;
for t=1:totalIterations;
ModelEquations
end