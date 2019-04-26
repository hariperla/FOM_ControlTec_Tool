%% Generic Bar plot function to use in FOM plotting
function MaxUD_FOM_Count = SumCountPerRatBin_MaxUD_FOM_AllPPV(CountPerCell,TotalNumOfStopsForAllPPV)

% Plot percent of stops less than 0.4 across the fleet for different brake
% events
StopsLessThan0p4 = squeeze(CountPerCell(1,:,:));
StopsLessThan0p4Val = sum(sum(StopsLessThan0p4));
StopLessThan0p4ForLightBrake = sprintf('%d',sum(StopsLessThan0p4(1,:)));
StopLessThan0p4ForMediumBrake = sprintf('%d',sum(StopsLessThan0p4(2,:)));
StopLessThan0p4ForHeavyBrake = sprintf('%d',sum(StopsLessThan0p4(3,:)));

% Plot percent of stops between 0.4 & 0.8 across the fleet for different brake
% events
StopsBtw0p4And0p8 = squeeze(CountPerCell(2,:,:));
StopsBtw0p4And0p8Val = sum(sum(StopsBtw0p4And0p8));
StopBtw0p4And0p8ForLightBrake = sprintf('%d',sum(StopsBtw0p4And0p8(1,:)));
StopBtw0p4And0p8ForMediumBrake = sprintf('%d',sum(StopsBtw0p4And0p8(2,:)));
StopBtw0p4And0p8ForHeavyBrake = sprintf('%d',sum(StopsBtw0p4And0p8(3,:)));

% Plot percent of stops more than 0.8 across the fleet for different brake
% events
StopsMoreThan0p8 = squeeze(CountPerCell(3,:,:));
StopsMoreThan0p8Val = sum(sum(StopsMoreThan0p8));
StopMoreThan0p8ForLightBrake = sprintf('%d',sum(StopsMoreThan0p8(1,:)));
StopMoreThan0p8ForMediumBrake = sprintf('%d',sum(StopsMoreThan0p8(2,:)));
StopMoreThan0p8ForHeavyBrake = sprintf('%d',sum(StopsMoreThan0p8(3,:)));

% Create the MaxUD FOM Table
MaxUD_FOM_Count = [sum(StopsLessThan0p4(1,:)) sum(StopsLessThan0p4(2,:)) sum(StopsLessThan0p4(3,:)); sum(StopsBtw0p4And0p8(1,:)) sum(StopsBtw0p4And0p8(2,:)) sum(StopsBtw0p4And0p8(3,:)); ...
                    sum(StopsMoreThan0p8(1,:)) sum(StopsMoreThan0p8(2,:)) sum(StopsMoreThan0p8(3,:))];

% Percent of event for decel events
CountPer0p4RatBinForAllPPV = sprintf('%d',StopsLessThan0p4Val);
CountPer0p4And0p8ForAllPPV = sprintf('%d',StopsBtw0p4And0p8Val);
CountPer0p8RatBinForAllPPV = sprintf('%d',StopsMoreThan0p8Val);

% Assign the bins
% Bin1FromDispFOM = findobj('Type','edit','Tag','Bin1');
% Bin2FromDispFOM = findobj('Type','edit','Tag','Bin2');
% Bin3FromDispFOM = findobj('Type','edit','Tag','Bin3');
% Bin4FromDispFOM = findobj('Type','edit','Tag','Bin4');
% Bin5FromDispFOM = findobj('Type','edit','Tag','Bin5');
% Bin6FromDispFOM = findobj('Type','edit','Tag','Bin6');
% Bin7FromDispFOM = findobj('Type','edit','Tag','Bin7');
% Bin8FromDispFOM = findobj('Type','edit','Tag','Bin8');
% Bin9FromDispFOM = findobj('Type','edit','Tag','Bin9');
% 
% CntPerBrkBin1FromDispFOM = findobj('Type','edit','Tag','CountPerBrkBin1');
% CntPerBrkBin2FromDispFOM = findobj('Type','edit','Tag','CountPerBrkBin2');
% CntPerBrkBin3FromDispFOM = findobj('Type','edit','Tag','CountPerBrkBin3');
% 
% TotalStopsFromDispFOM = findobj('Type','edit','Tag','TotalStops');
% 
% VehNumFromDispFOM = findobj('Type','edit','Tag','DispVehNumber');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION CALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DispFOM_RatBin(Bin1FromDispFOM, StopLessThan0p4ForLightBrake, ...
%                 Bin2FromDispFOM, StopLessThan0p4ForMediumBrake, ...
%                 Bin3FromDispFOM, StopLessThan0p4ForHeavyBrake, ...
%                 Bin4FromDispFOM, StopBtw0p4And0p8ForLightBrake, ...
%                 Bin5FromDispFOM, StopBtw0p4And0p8ForMediumBrake, ...
%                 Bin6FromDispFOM, StopBtw0p4And0p8ForHeavyBrake, ...
%                 Bin7FromDispFOM, StopMoreThan0p8ForLightBrake, ...
%                 Bin8FromDispFOM, StopMoreThan0p8ForMediumBrake, ...
%                 Bin9FromDispFOM, StopMoreThan0p8ForHeavyBrake, ...
%                 CntPerBrkBin1FromDispFOM, CountPer0p4RatBinForAllPPV, ...
%                 CntPerBrkBin2FromDispFOM, CountPer0p4And0p8ForAllPPV, ...
%                 CntPerBrkBin3FromDispFOM, CountPer0p8RatBinForAllPPV, ...
%                 TotalStopsFromDispFOM, sprintf('%d',TotalNumOfStopsForAllPPV), ...
%                 VehNumFromDispFOM, 'Count of UD FOM for PPV Fleet');
end