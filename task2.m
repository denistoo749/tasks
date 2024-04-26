warning('off', 'all')

%Read data from dat file
table = readtable('/home/kiprotich/Downloads/Documents/Tasks/ZTD_mayg.dat', 'Delimiter', '\t');
%opens a file ZTD_daily_mayg.dat to write to
file = fopen('/home/kiprotich/Downloads/Documents/Tasks/ZTD_mayg.dat', 'w');
%checks if the file is open
if file == -1
    error('Error opening file for writing');
end
%meanforcolumns;
%col is the columns whose mean are to be found
col = string(table.Properties.VariableNames(4:end));
%looping through rows
for i=1:size(table, 1)
    for j=1:330
        if table{i, table{:, 2}} == j
            %looping through column
            for k=1:length(col)
                meanforcolumns += mean(table{:,k}, 1)
            end
        fprintf(file, '%d', meanforcolumns);
        end
    end
end
fclose(file);