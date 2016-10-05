globalStoreLegacyMaternity=Store_m0;
    
    globalStoreLegacySusceptible=[Store_s0; Store_s1; Store_s2; Store_s3; Store_s4];
    globalStoreLegacyInfected=[Store_i0; Store_i1; Store_i2; Store_s3; Store_i4];
    globalStoreLegacyRecovered=[Store_r0; Store_r1; Store_r2; Store_r3; Store_r4];
    globalStoreLegacyVaccinated=[zeros(1,totalIterations); Store_v1; Store_v2; Store_v3; Store_v4];

localeSumming=0;
for summingIteration=1:totalIterations
    localeSumming(summingIteration)=sum(globalStoreLegacySusceptible(:,summingIteration)) + ...
    sum(globalStoreLegacyInfected(:,summingIteration)) + ...
    sum(globalStoreLegacyRecovered(:,summingIteration)) + ...
    sum(globalStoreLegacyVaccinated(:,summingIteration));
end

localeSumming = localeSumming +globalStoreLegacyMaternity;