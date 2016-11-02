

fileID = fopen(strcat('../results/',parametersFileName,'.txt'),'w');
fprintf(fileID, 'daily vaccination coverage = %f\n',base_nu); 
fprintf(fileID, 'reproductive number = %f\n',offset_value);
fprintf(fileID, 'simulated years = %i\n',simulatedYears);
fprintf(fileID, 'results image = ../images/%s.jpeg\n', imageFileName);
fclose(fileID);