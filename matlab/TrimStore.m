% Store_m0 = Store_m0(2877520:(2877520+50*365));
% Store_s0 = Store_s0(2877520:(2877520+50*365));
% Store_i0 = Store_i0(2877520:(2877520+50*365));
% Store_r0 = Store_r0(2877520:(2877520+50*365));
% Store_v1 = Store_v1(2877520:(2877520+50*365));
% Store_s1 = Store_s1(2877520:(2877520+50*365));
% Store_i1 = Store_i1(2877520:(2877520+50*365));
% Store_r1 = Store_r1(2877520:(2877520+50*365));
% Store_v2 = Store_v2(2877520:(2877520+50*365));
% Store_s2 = Store_s2(2877520:(2877520+50*365));
% Store_i2 = Store_i2(2877520:(2877520+50*365));
% Store_r2 = Store_r2(2877520:(2877520+50*365));
% Store_v3 = Store_v3(2877520:(2877520+50*365));
% Store_s3 = Store_s3(2877520:(2877520+50*365));
% Store_i3 = Store_i3(2877520:(2877520+50*365));
% Store_r3 = Store_r3(2877520:(2877520+50*365));
% Store_v4 = Store_v4(2877520:(2877520+50*365));
% Store_s4 = Store_s4(2877520:(2877520+50*365));
% Store_i4 = Store_i4(2877520:(2877520+50*365));
% Store_r4 = Store_r4(2877520:(2877520+50*365));
if(size(Store_v5,2)>(productionYears*iterationsPerYear))
    Store_v5 = Store_v5((productionOverlap+1):size(Store_v5,2));
    Store_s5 = Store_s5((productionOverlap+1):size(Store_s5,2));
    Store_i5 = Store_i5((productionOverlap+1):size(Store_i5,2));
    Store_r5 = Store_r5((productionOverlap+1):size(Store_r5,2));
end
sum(Store_s5)/(sum(Store_v5)+sum(Store_s5)+sum(Store_i5)+sum(Store_r5))
sum(Store_s5)/(sum(Store_s0)+sum(Store_s1)+sum(Store_s2)+sum(Store_s3)+sum(Store_s4)+sum(Store_s5))