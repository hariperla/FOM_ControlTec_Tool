function [FOM_Data,TotCntPerBrkBin,TotStpCnt,VehicleNumber,StpsForDate] = DispUD_FOM_ForDate(myFile,Loc,DateSelIdx, ...
                                                                          DateStampIdx, RadButtonSel)

% Changing directory to where the file exists
cd;
w = cd;
cd (Loc);

% Create table from csv file. 
CreateTable_UD_FOM = readtable(myFile);
VehicleNumber = table2cell(CreateTable_UD_FOM(2,2));
VehicleNumber = char(VehicleNumber);

% Loop through all the bins to plot the data
CreateTable_UD_FOM = CreateTable_UD_FOM(:,12:21);

% Calculate number of stops for each bin on a date
    for i=2:10
        MaxUD_FOM_Data{i} = CreateTable_UD_FOM{:,i};
        StpsForDate{i} = MaxUD_FOM_Data{1,i}(DateStampIdx);
        NoOfStpEachDay{i} = [StpsForDate{1,i}(1);diff(StpsForDate{1,i})]; 
        TotalCount{i} = sum(MaxUD_FOM_Data{1,i}(DateSelIdx));
    end

% Find the stop information for the date

% Max count for each bin in FOM converter to matrix
BinCountPerDay = cell2mat(NoOfStpEachDay(1,:));
BinCountPerDate = BinCountPerDay(DateSelIdx,:);
BinCountPerDate1 = reshape(BinCountPerDate,[3 3]);
BinCountPerDate1 = BinCountPerDate1';

    for k = 1:3
        TotCntForBrkBinsOnDate(1,k) = sum(BinCountPerDate1(:,k));
    end
    
    for i=1:3
        for j=1:3
            FOM_Bins_PctPerBrake(i,j) = BinCountPerDate1(i,j)/sum(BinCountPerDate1(:,j)) * 100;
        end
    end
    
    for i=1:3
        for j=1:3
            FOM_Bins_PctTotStops(i,j) = BinCountPerDate1(i,j)/sum(TotCntForBrkBinsOnDate) * 100;
        end
    end

% Create FOM bins as percent of total count   
    if RadButtonSel == 1
        FOM_Data = FOM_Bins_PctPerBrake;
    elseif RadButtonSel == 2
        FOM_Data = FOM_Bins_PctTotStops;
    else
        FOM_Data = BinCountPerDate1;
    end

TotCntPerBrkBin = TotCntForBrkBinsOnDate;
TotStpCnt = sum(TotCntForBrkBinsOnDate);

% Change back to working directory
cd('..');
end