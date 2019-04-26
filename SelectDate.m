function [DateStamp,DateStampIdx,TimeStamp] = SelectDate(myFile,Loc)

% Changing directory to where the file exists
cd;
w = cd;
cd (Loc);

% Create table from csv file. 
CreateTable_UD_FOM = readtable(myFile);

% Find the time stamp index to get the date stamp
TimeStamp = table2cell(CreateTable_UD_FOM(:,3));
    for Tm = 1:length(TimeStamp)
        cellContents = TimeStamp{Tm};
        if length(cellContents) == 19
            DateStamp{Tm,1} = cellContents(1:end-9);
            TimeStamp{Tm,1} = cellContents(1:end-9);
        else
            DateStamp{Tm,1} = cellContents(1:end-5);
            TimeStamp{Tm,1} = cellContents(1:end-9);
        end
        DateStamp{Tm,1} = strrep(DateStamp{Tm,1},' ','');
        TimeStamp{Tm,1} = strrep(DateStamp{Tm,1},' ','');
    end

% Find the unique Date stamps for the vehicle
[DateStamp,DateStampIdx,RowsWithDateStamp] = unique(DateStamp,'rows','stable');

cd('..');
end