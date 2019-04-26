function [CountPerCell,FOM_Bins_PctPerBrake,FOM_Bins_TotPctCount,MilesDrivenSince,...
    VehicleNumber,TotNumOfStopsForAllPPV,CountPerDecelBin,CreateTable_UD_FOM] = ...
AnalyzeFOMdataForSelectedDir(TotFilesInFolder,myFiles,SelectedDir)

cd;
w = cd;
cd (SelectedDir);

% For all the data files in the directory, convert the data and plot data
% to understand how many stops ended up less than 0.4, how many stops ended
% up between 0.4 and 0.8, how many stops ended up higher than 0.8. 
% Loop through data files in the folder

for p=1:TotFilesInFolder
    % Select the file you want to convert into a table format in MATLAB
    FileName = myFiles(p).name;

    % Create table from csv file. 
    CreateTable_UD_FOM = readtable(FileName);
    VehicleNumber(p) = table2cell(CreateTable_UD_FOM(2,2));
    CreateTable_UD_FOM = CreateTable_UD_FOM(:,12:21);
    CreateTable_UD_FOM = CreateTable_UD_FOM(~any(ismissing(CreateTable_UD_FOM),2),:);

    % Find the size of the table. Both columns and rows
    Columns = size(CreateTable_UD_FOM);
    Columns = Columns(2);

    % Loop through all the bins to plot the data
    Miles_Odometer{p} = CreateTable_UD_FOM{:,1};
    VehicleStartMilage(1,p) = double(Miles_Odometer{1,p}(end));
    VehicleEndMilage(1,p) = Miles_Odometer{1,p}(1);

    for i=2:10
    %     figure(2*p - 1);
        MaxUD_FOM_Data{i} = CreateTable_UD_FOM{:,i};
        DiffBtwCells{i} = diff(MaxUD_FOM_Data{1,i});
    end

    %% Check for discontinuity and plot data based on percentage of each bin
    % Check for any discontinuity in the data and find the index for it
    DiffBtwCellsForReset = diff(MaxUD_FOM_Data{1,2});
    idxForResetInit = find(DiffBtwCellsForReset < 0);
    FlagForReset = isempty(idxForResetInit);
    if (FlagForReset == 1)
        idxForReset = length(MaxUD_FOM_Data{1,2});
    else
        idxForReset = [idxForResetInit;length(MaxUD_FOM_Data{1,2})];
    end

    for i=2:10
        TotalCountForBins{i} = sum(MaxUD_FOM_Data{1,i}(idxForReset));
        TotalCount{i,p} = sum(MaxUD_FOM_Data{1,i}(idxForReset));
    end

    % Sum of all the FOM count
    TotalCountForFOM1 = sum([TotalCountForBins{:}]);
    TotalCount2 = cell2mat(TotalCount);
    TotalNumOfStops(1,p) = sum(TotalCount2(:,p));

    EachStop(:,:,p) = reshape(TotalCount2(:,p),3,3);
    EachStop(:,:,p) = EachStop(:,:,p)';

        for i=1:3
            for j=1:3
            FOM_Bins_TotPctCount(i,j,p) = EachStop(i,j,p)/TotalNumOfStops(1,p) * 100;
            end
        end

    % Max count for each bin in FOM converter to matrix
    MaxOfEachBinAsMatrix = cell2mat(TotalCountForBins);
    MaxOfEachBinAsMatrix = reshape(MaxOfEachBinAsMatrix,3,3);
    MaxOfEachBinAsMatrix = MaxOfEachBinAsMatrix';

    % Create FOM bins as percent of total count
    FOM_Bins_PctTotCount = MaxOfEachBinAsMatrix./TotalCountForFOM1 * 100;

    % Create FOM bins as percent of count for each brake event. 
    % 1st col - Brake < 20% & SR < 0.4, (SR > 0.4 & SR < 0.8), SR > 0.8
    % 2nd col - (Brake > 20% & < 30%) & SR < 0.4, (SR > 0.4 & SR < 0.8), SR > 0.8
    % 3rd col - Brake > 30% & SR < 0.4, (SR > 0.4 & SR < 0.8), SR > 0.8
        for i=1:3
            for j=1:3
            FOM_Bins_PctPerBrake(i,j,p) = MaxOfEachBinAsMatrix(i,j)/sum(MaxOfEachBinAsMatrix(:,j)) * 100;
            CountPerDecelBin(p,j) = sum(MaxOfEachBinAsMatrix(:,j));
            CountPerCell(i,j,p) = MaxOfEachBinAsMatrix(i,j);
            end
        end
    end
    cd('..');
    
% Plot the milage information in each car
MilesDrivenSince = VehicleEndMilage - VehicleStartMilage;
TotNumOfStopsForAllPPV = sum(TotalNumOfStops);
end