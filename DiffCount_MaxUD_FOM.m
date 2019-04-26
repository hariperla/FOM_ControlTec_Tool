clear;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read the folder containing Max UD FOM data for Old Data
dir1 = uigetdir();
myFiles1 = fullfile(dir1,'*.csv');
myFiles1 = dir(myFiles1);
CountOfCSV1 = length(myFiles1);

% Analyze FOM data inside the directory for all vehicles
[CountPerCell_Old,FOM_Bins_PctPerBrake,FOM_Bins_TotPctCount,MilesDrivenSince,VehicleNumber,TotNumOfStopsForAllPPV_Old,CountPerDecelBin] = ...
AnalyzeFOMdataForSelectedDir(CountOfCSV1,myFiles1,dir1);

% Count number of stops for each bin/cell for all vehicles
[MaxUD_FOM_Count_Old] = SumCountPerRatBin_MaxUD_FOM_AllPPV(CountPerCell_Old,TotNumOfStopsForAllPPV_Old);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read the folder containing Max UD FOM data for New Data
dir2 = uigetdir();
myFiles2 = fullfile(dir2,'*.csv');
myFiles2 = dir(myFiles2);
CountOfCSV2 = length(myFiles2);

% Analyze FOM data inside the directory for all vehicles
[CountPerCell_New,FOM_Bins_PctPerBrake,FOM_Bins_TotPctCount,MilesDrivenSince,VehicleNumber,TotNumOfStopsForAllPPV_New,CountPerDecelBin] = ...
AnalyzeFOMdataForSelectedDir(CountOfCSV2,myFiles2,dir2);

% Count number of stops for each bin/cell for all vehicles
[MaxUD_FOM_Count_New] = SumCountPerRatBin_MaxUD_FOM_AllPPV(CountPerCell_New,TotNumOfStopsForAllPPV_New);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find just the new stops and discard older count
MaxUD_FOM_Count_Diff = MaxUD_FOM_Count_New - MaxUD_FOM_Count_Old;

TotNumOfStopsForAllPPV_Diff = TotNumOfStopsForAllPPV_New - TotNumOfStopsForAllPPV_Old;

CountPerRatBin(1,1) = sum(MaxUD_FOM_Count_Diff(1,:));
CountPerRatBin(1,2) = sum(MaxUD_FOM_Count_Diff(2,:));
CountPerRatBin(1,3) = sum(MaxUD_FOM_Count_Diff(3,:));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Assign the bins
Bin1FromDispFOM = findobj('Type','edit','Tag','Bin1');
Bin2FromDispFOM = findobj('Type','edit','Tag','Bin2');
Bin3FromDispFOM = findobj('Type','edit','Tag','Bin3');
Bin4FromDispFOM = findobj('Type','edit','Tag','Bin4');
Bin5FromDispFOM = findobj('Type','edit','Tag','Bin5');
Bin6FromDispFOM = findobj('Type','edit','Tag','Bin6');
Bin7FromDispFOM = findobj('Type','edit','Tag','Bin7');
Bin8FromDispFOM = findobj('Type','edit','Tag','Bin8');
Bin9FromDispFOM = findobj('Type','edit','Tag','Bin9');

CntPerBrkBin1FromDispFOM = findobj('Type','edit','Tag','CountPerBrkBin1');
CntPerBrkBin2FromDispFOM = findobj('Type','edit','Tag','CountPerBrkBin2');
CntPerBrkBin3FromDispFOM = findobj('Type','edit','Tag','CountPerBrkBin3');

TotalStopsFromDispFOM = findobj('Type','edit','Tag','TotalStops');

VehNumFromDispFOM = findobj('Type','edit','Tag','DispVehNumber');

%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION CALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DispCountFOM(Bin1FromDispFOM, MaxUD_FOM_Count_Diff(1,1), ...
            Bin2FromDispFOM, MaxUD_FOM_Count_Diff(1,2), ...
            Bin3FromDispFOM, MaxUD_FOM_Count_Diff(1,3), ...
            Bin4FromDispFOM, MaxUD_FOM_Count_Diff(2,1), ...
            Bin5FromDispFOM, MaxUD_FOM_Count_Diff(2,2), ...
            Bin6FromDispFOM, MaxUD_FOM_Count_Diff(2,3), ...
            Bin7FromDispFOM, MaxUD_FOM_Count_Diff(3,1), ...
            Bin8FromDispFOM, MaxUD_FOM_Count_Diff(3,2), ...
            Bin9FromDispFOM, MaxUD_FOM_Count_Diff(3,3), ...
            CntPerBrkBin1FromDispFOM, sprintf('%d',CountPerRatBin(1,1)), ...
            CntPerBrkBin2FromDispFOM, sprintf('%d',CountPerRatBin(1,2)), ...
            CntPerBrkBin3FromDispFOM, sprintf('%d',CountPerRatBin(1,3)), ...
            TotalStopsFromDispFOM, sprintf('%d',TotNumOfStopsForAllPPV_Diff), ...
            VehNumFromDispFOM, 'Count of UD FOM for PPV Fleet');