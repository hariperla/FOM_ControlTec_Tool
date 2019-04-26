function [FOM_Data,TotCntPerBrkBin,TotStpCnt,VehicleNumber] = DispUD_FOM_OnePPV(myFile,Loc,RadButtonSel)
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
    
    for i=1:3
        for j=1:3
            FOM_Bins_PctPerBrake(i,j) = MaxOfEachBinAsMatrix(i,j)/sum(MaxOfEachBinAsMatrix(:,j)) * 100;
        end
    end
    
    for i=1:3
        for j=1:3
            FOM_Bins_PctTotStops(i,j) = MaxOfEachBinAsMatrix(i,j)/sum(TotCntForBrkBins) * 100;
        end
    end

% Create FOM bins as percent of total count   
    if RadButtonSel == 1
        FOM_Data = FOM_Bins_PctPerBrake;
    elseif RadButtonSel == 2
        FOM_Data = FOM_Bins_PctTotStops;
    else
        FOM_Data = MaxOfEachBinAsMatrix;
    end
TotCntPerBrkBin = TotCntForBrkBins;
TotStpCnt = sum([TotalCount{:}]);

cd('..');
end