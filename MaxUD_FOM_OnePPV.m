function [FOM_Data,TotCntPerBrkBin,TotStpCnt,VehicleNumber] = MaxUD_FOM_OnePPV(myFile,Loc)
%% Select one file and plot relevant stop information

% Changing directory to where the file exists
cd;
w = cd;
cd (Loc);

% Create table from csv file. 
CreateTable_UD_FOM = readtable(myFile);
VehicleNumber = table2cell(CreateTable_UD_FOM(2,2));
VehicleNumber = char(VehicleNumber);
CreateTable_UD_FOM = CreateTable_UD_FOM(:,12:21);

% Find the size of the table. Both columns and rows
Columns = size(CreateTable_UD_FOM);
Columns = Columns(2);

% Loop through all the bins to plot the data
Miles_Odometer = CreateTable_UD_FOM{:,1};
TotalMilesForFOM = Miles_Odometer(end) - Miles_Odometer(1);

    for i=2:10
        MaxUD_FOM_Data{i} = CreateTable_UD_FOM{:,i};
        DiffBtwCells{i} = diff(MaxUD_FOM_Data{1,i});
        figure(2);
        subplot(3,3,i-1);
        plot(Miles_Odometer,MaxUD_FOM_Data{1,i});
        xlabel(['Miles']);
        ylabel('Count');
        title(['MaxUD FOM Bin' num2str(i-1)]);
    end
    
% Check for any discontinuity in the data and find the index for it
    DiffBtwCellsForReset = diff(MaxUD_FOM_Data{1,2});
    idxForResetInit = find(DiffBtwCellsForReset < 0);
    FlagForReset = isempty(idxForResetInit);
    if (FlagForReset == 1)
        idxForReset = length(MaxUD_FOM_Data{1,2});
    else
        idxForReset = [idxForResetInit;length(MaxUD_FOM_Data{1,2})];
    end
    
% Calculate the sum of all stops for particular brake bin and total number
% of stops
    for i=2:10
        TotalCountForBins{i} = sum(MaxUD_FOM_Data{1,i}(idxForReset));
        TotalCount{i} = sum(MaxUD_FOM_Data{1,i}(idxForReset));
    end

% Max count for each bin in FOM converter to matrix
MaxOfEachBinAsMatrix = cell2mat(TotalCountForBins);
MaxOfEachBinAsMatrix = reshape(MaxOfEachBinAsMatrix,3,3);
MaxOfEachBinAsMatrix = MaxOfEachBinAsMatrix';

    for k = 1:3
        TotCntForBrkBins(1,k) = sum(MaxOfEachBinAsMatrix(:,k));
    end

% Create FOM bins as percent of total count
% FOM_Bins_PctTotCount = MaxOfEachBinAsMatrix./TotCntForBrkBins * 100;
    
FOM_Data = MaxOfEachBinAsMatrix;
TotCntPerBrkBin = TotCntForBrkBins;
TotStpCnt = sum([TotalCount{:}]);

cd('..');
end