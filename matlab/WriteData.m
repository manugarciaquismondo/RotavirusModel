 
if(not(exist('finalValues')))
    finalValues = 'data';
end
if(not(exist('seriesFileName')))
    seriesFileName = 'series';
end
savedVariables = {};
savedSeries = {};

classNames = {'s' 'r' 'i'};
for classIndex=classNames
    for classAge=0:5
        localVariable = strcat(classIndex, num2str(classAge));
        savedVariables=[savedVariables, localVariable];
        savedSeries=[savedSeries, strcat('Store_',localVariable)];
    end
    for classAge=1:5
        localVariable = strcat('v', num2str(classAge));
        savedVariables=[savedVariables, localVariable];
        savedSeries=[savedSeries, strcat('Store_',localVariable)];
    end
end

savedVariables=[savedVariables, 'm0'];
savedSeries=[savedSeries, 'Store_m0'];

save(strcat('../data/',finalValues,'.mat'),savedVariables{:})
save(strcat('../series/',seriesFileName,'Series.mat'),savedSeries{:})
