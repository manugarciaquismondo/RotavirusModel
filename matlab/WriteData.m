 
if(not(exist('dataFilename')))
    dataFilename = 'data';
end
savedVariables = {};

classNames = {'s' 'r' 'i'};
for classIndex=classNames
    for classAge=0:5
        savedVariables=[savedVariables, strcat(classIndex, num2str(classAge))];
    end
    for classAge=1:5
        savedVariables=[savedVariables, strcat('v', num2str(classAge))];
    end
end
savedVariables=[savedVariables, 'm0'];
save(strcat('../data/',dataFilename,'.mat'),savedVariables{:})
