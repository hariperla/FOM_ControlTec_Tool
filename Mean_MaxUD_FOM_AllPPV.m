%% Generic Bar plot function to use in FOM plotting
function Mean_MaxUD_FOM_AllPPV(FOM_Bins_PctPerBrake,CountPerDecelBin,TotalNumOfStopsForAllPPV)

% Plot percent of stops less than 0.4 across the fleet for different brake
% events
StopsLessThan0p4 = squeeze(FOM_Bins_PctPerBrake(1,:,:));
PctStopLessThan0p4ForLightBrake = sprintf('%0.2f',mean(StopsLessThan0p4(1,:)));
PctStopLessThan0p4ForMediumBrake = sprintf('%0.2f',mean(StopsLessThan0p4(2,:)));
PctStopLessThan0p4ForHeavyBrake = sprintf('%0.2f',mean(StopsLessThan0p4(3,:)));

% Plot percent of stops between 0.4 & 0.8 across the fleet for different brake
% events
StopsBtw0p4And0p8 = squeeze(FOM_Bins_PctPerBrake(2,:,:));
PctStopBtw0p4And0p8ForLightBrake = sprintf('%0.2f',mean(StopsBtw0p4And0p8(1,:)));
PctStopBtw0p4And0p8ForMediumBrake = sprintf('%0.2f',mean(StopsBtw0p4And0p8(2,:)));
PctStopBtw0p4And0p8ForHeavyBrake = sprintf('%0.2f',mean(StopsBtw0p4And0p8(3,:)));

% Plot percent of stops more than 0.8 across the fleet for different brake
% events
StopsMoreThan0p8 = squeeze(FOM_Bins_PctPerBrake(3,:,:));
PctStopMoreThan0p8ForLightBrake = sprintf('%0.2f',mean(StopsMoreThan0p8(1,:)));
PctStopMoreThan0p8ForMediumBrake = sprintf('%0.2f',mean(StopsMoreThan0p8(2,:)));
PctStopMoreThan0p8ForHeavyBrake = sprintf('%0.2f',mean(StopsMoreThan0p8(3,:)));

% Percent of event for decel events
CountPerLightDecelForAllPPV = sum(CountPerDecelBin(:,1));
CountPerMediumDecelForAllPPV = sum(CountPerDecelBin(:,2));
CountPerHeavyDecelForAllPPV = sum(CountPerDecelBin(:,3));

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
DispFOM(Bin1FromDispFOM, PctStopLessThan0p4ForLightBrake, ...
        Bin2FromDispFOM, PctStopLessThan0p4ForMediumBrake, ...
        Bin3FromDispFOM, PctStopLessThan0p4ForHeavyBrake, ...
        Bin4FromDispFOM, PctStopBtw0p4And0p8ForLightBrake, ...
        Bin5FromDispFOM, PctStopBtw0p4And0p8ForMediumBrake, ...
        Bin6FromDispFOM, PctStopBtw0p4And0p8ForHeavyBrake, ...
        Bin7FromDispFOM, PctStopMoreThan0p8ForLightBrake, ...
        Bin8FromDispFOM, PctStopMoreThan0p8ForMediumBrake, ...
        Bin9FromDispFOM, PctStopMoreThan0p8ForHeavyBrake, ...
        CntPerBrkBin1FromDispFOM, CountPerLightDecelForAllPPV, ...
        CntPerBrkBin2FromDispFOM, CountPerMediumDecelForAllPPV, ...
        CntPerBrkBin3FromDispFOM, CountPerHeavyDecelForAllPPV, ...
        TotalStopsFromDispFOM, TotalNumOfStopsForAllPPV, ...
        VehNumFromDispFOM, 'Mean of UD FOM for PPV Fleet');

end