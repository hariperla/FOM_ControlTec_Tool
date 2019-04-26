%% Generic Bar plot function to use in FOM plotting
function SumCount_MaxUD_FOM_AllPPV(CountPerCell,CountPerDecelBin,TotalNumOfStopsForAllPPV)

% Plot percent of stops less than 0.4 across the fleet for different brake
% events
StopsLessThan0p4 = squeeze(CountPerCell(1,:,:));
StopLessThan0p4ForLightBrake = sprintf('%d',sum(StopsLessThan0p4(1,:)));
StopLessThan0p4ForMediumBrake = sprintf('%d',sum(StopsLessThan0p4(2,:)));
StopLessThan0p4ForHeavyBrake = sprintf('%d',sum(StopsLessThan0p4(3,:)));

% Plot percent of stops between 0.4 & 0.8 across the fleet for different brake
% events
StopsBtw0p4And0p8 = squeeze(CountPerCell(2,:,:));
StopBtw0p4And0p8ForLightBrake = sprintf('%d',sum(StopsBtw0p4And0p8(1,:)));
StopBtw0p4And0p8ForMediumBrake = sprintf('%d',sum(StopsBtw0p4And0p8(2,:)));
StopBtw0p4And0p8ForHeavyBrake = sprintf('%d',sum(StopsBtw0p4And0p8(3,:)));

% Plot percent of stops more than 0.8 across the fleet for different brake
% events
StopsMoreThan0p8 = squeeze(CountPerCell(3,:,:));
StopMoreThan0p8ForLightBrake = sprintf('%d',sum(StopsMoreThan0p8(1,:)));
StopMoreThan0p8ForMediumBrake = sprintf('%d',sum(StopsMoreThan0p8(2,:)));
StopMoreThan0p8ForHeavyBrake = sprintf('%d',sum(StopsMoreThan0p8(3,:)));

% Count of event for each ratio bin
% CountFor0p4RatForAllPPV = StopLessThan0p4ForLightBrake + StopLessThan0p4ForMediumBrake + StopLessThan0p4ForHeavyBrake;
% CountFor0p4And0p8ForAllPPV = StopBtw0p4And0p8ForLightBrake + StopBtw0p4And0p8ForMediumBrake + StopBtw0p4And0p8ForHeavyBrake;
% CountFor0p8RatForAllPPV = StopMoreThan0p8ForLightBrake + StopMoreThan0p8ForMediumBrake + StopMoreThan0p8ForHeavyBrake;

% MaxUD_FOM_Count = [StopLessThan0p4ForLightBrake,StopLessThan0p4ForMediumBrake,StopLessThan0p4ForHeavyBrake;...
%     StopBtw0p4And0p8ForLightBrake,StopBtw0p4And0p8ForMediumBrake,StopBtw0p4And0p8ForHeavyBrake;...
%     StopMoreThan0p8ForLightBrake,StopMoreThan0p8ForMediumBrake,StopMoreThan0p8ForHeavyBrake];

% Percent of event for decel events
CountPerLightDecelForAllPPV = sprintf('%d',sum(CountPerDecelBin(:,1)));
CountPerMediumDecelForAllPPV = sprintf('%d',sum(CountPerDecelBin(:,2)));
CountPerHeavyDecelForAllPPV = sprintf('%d',sum(CountPerDecelBin(:,3)));

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
DispFOM(Bin1FromDispFOM, StopLessThan0p4ForLightBrake, ...
        Bin2FromDispFOM, StopLessThan0p4ForMediumBrake, ...
        Bin3FromDispFOM, StopLessThan0p4ForHeavyBrake, ...
        Bin4FromDispFOM, StopBtw0p4And0p8ForLightBrake, ...
        Bin5FromDispFOM, StopBtw0p4And0p8ForMediumBrake, ...
        Bin6FromDispFOM, StopBtw0p4And0p8ForHeavyBrake, ...
        Bin7FromDispFOM, StopMoreThan0p8ForLightBrake, ...
        Bin8FromDispFOM, StopMoreThan0p8ForMediumBrake, ...
        Bin9FromDispFOM, StopMoreThan0p8ForHeavyBrake, ...
        CntPerBrkBin1FromDispFOM, CountPerLightDecelForAllPPV, ...
        CntPerBrkBin2FromDispFOM, CountPerMediumDecelForAllPPV, ...
        CntPerBrkBin3FromDispFOM, CountPerHeavyDecelForAllPPV, ...
        TotalStopsFromDispFOM, sprintf('%d',TotalNumOfStopsForAllPPV), ...
        VehNumFromDispFOM, 'Count of UD FOM for PPV Fleet');
end