%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% MaxUD_FOM
% Created:  05.10.2018
% Author:   Hari Charan Perla
% Modified: 06.14.2018: Hari Charan Perla
% Company:  General Motors

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function varargout = MaxUD_FOM(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MaxUD_FOM_OpeningFcn, ...
                   'gui_OutputFcn',  @MaxUD_FOM_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before MaxUD_FOM is made visible.
function MaxUD_FOM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MaxUD_FOM (see VARARGIN)

% Choose default command line output for MaxUD_FOM
handles.output = hObject;
InitialMsg = 'Select Vehicle File to Analyze Max UD FOM';

set(handles.SelectVehFile,'string',InitialMsg);
setappdata(handles.SelectVehFile,'InitialMsg',InitialMsg);

InitMsgForDate = 'Select Vehicle Date';
set(handles.SelectDate,'string',InitMsgForDate);
setappdata(handles.SelectDate,'InitMsgForDate',InitMsgForDate);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MaxUD_FOM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MaxUD_FOM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in SelDataDir.
function SelDataDir_Callback(hObject, eventdata, handles)
% hObject    handle to SelDataDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Read all csv files inside the directory where data is present
dir1 = uigetdir();
myFiles = fullfile(dir1,'*.csv');
myFiles = dir(myFiles);
CountOfCSV = length(myFiles);

for i = 1:CountOfCSV
    filename{i} = myFiles(i).name;
end

InitMsg = getappdata(handles.SelectVehFile,'InitialMsg');
ListOfFiles = [InitMsg filename];

set(handles.SelectVehFile,'string',ListOfFiles);

SelDirButtonVal = get(handles.SelDataDir,'Value');

%   Store Data to use in a different function call  
setappdata(handles.SelDataDir,'CountOfCSV',CountOfCSV);
setappdata(handles.SelDataDir,'dir1',dir1);
setappdata(handles.SelDataDir,'myFiles',myFiles);
setappdata(handles.SelDataDir,'SelDirButtonVal',SelDirButtonVal);

    assignin('base','CountOfCSV',CountOfCSV);
    assignin('base','dir1',dir1);
    assignin('base','myFiles',myFiles);

% Folder Selection Completed
f = msgbox('Folder Selection Complete','FolderSelected');


% --- Executes on button press in AnalyzeFOM_Data.
function AnalyzeFOM_Data_Callback(hObject, eventdata, handles)
% hObject    handle to AnalyzeFOM_Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    SelDirButtonVal = getappdata(handles.SelDataDir,'SelDirButtonVal');
    AnalyzeFOM_DataVal = get(handles.AnalyzeFOM_Data,'Value');

    if isempty(SelDirButtonVal) == 1
    % Folder Selection Completed
        f = errordlg('Folder Not Selected','Select FOM Data Folder');
    else
    %%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    TotFilesInFolder = getappdata(handles.SelDataDir,'CountOfCSV');
    myFiles = getappdata(handles.SelDataDir,'myFiles');
    dir1 = getappdata(handles.SelDataDir,'dir1');

    %%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION CALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [CountPerCell,FOM_Bins_PctPerBrake,FOM_Bins_TotPctCount,MilesDrivenSince,...
        VehicleNumber,TotNumOfStopsForAllPPV,CountPerDecelBin,CreateTable_UD_FOM] = ...
    AnalyzeFOMdataForSelectedDir(TotFilesInFolder,myFiles,dir1);

    %   Store Data to use in a different function call  
    setappdata(handles.AnalyzeFOM_Data,'AnalyzeFOM_DataVal',AnalyzeFOM_DataVal);
    setappdata(handles.AnalyzeFOM_Data,'MilesDrivenSince',MilesDrivenSince);
    setappdata(handles.AnalyzeFOM_Data,'VehicleNumber',VehicleNumber);
    setappdata(handles.AnalyzeFOM_Data,'FOM_Bins_PctPerBrake',FOM_Bins_PctPerBrake);
    setappdata(handles.AnalyzeFOM_Data,'FOM_Bins_TotPctCount',FOM_Bins_TotPctCount);
    setappdata(handles.AnalyzeFOM_Data,'TotNumOfStopsForAllPPV',TotNumOfStopsForAllPPV);
    setappdata(handles.AnalyzeFOM_Data,'CountPerDecelBin',CountPerDecelBin);
    setappdata(handles.AnalyzeFOM_Data,'CountPerCell',CountPerCell);
    
    assignin('base','CreateTable_UD_FOM',CreateTable_UD_FOM);
    assignin('base','CountPerCell',CountPerCell);
    assignin('base','CountPerDecelBin',CountPerDecelBin);
    assignin('base','FOM_Bins_PctPerBrake',FOM_Bins_PctPerBrake);
    assignin('base','MilesDrivenSince',MilesDrivenSince);
    
    % Dialog pop to show operation complete
    f = msgbox('ScriptComplete');
    end


% --- Executes on button press in VehicleMilage.
function VehicleMilage_Callback(hObject, eventdata, handles)
% hObject    handle to VehicleMilage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

SelDirButtonVal = getappdata(handles.SelDataDir,'SelDirButtonVal');
AnalyzeFOM_DataVal = getappdata(handles.AnalyzeFOM_Data,'AnalyzeFOM_DataVal');
FileCount = getappdata(handles.SelDataDir,'CountOfCSV');

    % Better Error handling capability
    if isempty(SelDirButtonVal) == 1 && isempty(AnalyzeFOM_DataVal) == 1
        % Folder Selection Completed
        f = errordlg('Folder Not Selected & Data Not Analyzed','Select FOM Data Folder');
    elseif isempty(SelDirButtonVal) == 0 && isempty(AnalyzeFOM_DataVal) == 1
        % Folder Selection Completed But Data not analyzed
        f = errordlg('Folder Selected But Data Not Analyzed','Press Analyze FOM Data');
    else
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        MilesDrivenSince1 = getappdata(handles.AnalyzeFOM_Data,'MilesDrivenSince');
        MaxOfOdoMiles = round(max(MilesDrivenSince1),3,'significant');
        Thrsh = round(MaxOfOdoMiles/FileCount);
        MaxOfOdoMilesThrsh = MaxOfOdoMiles+Thrsh;
        VehOdoMiles = 0:Thrsh:MaxOfOdoMilesThrsh;
        VehOdoMilesStr = num2cell(VehOdoMiles);
        VehicleNumberPPV = getappdata(handles.AnalyzeFOM_Data,'VehicleNumber');
        figure('Name','Mileage Info Per Vehicle','NumberTitle','off');
        VehicleNumbers = 1:FileCount;
        bar (VehicleNumbers,MilesDrivenSince1,'grouped');
        set(gca,'xtick',VehicleNumbers,'xticklabel',VehicleNumberPPV);
        set(gca,'ytick',VehOdoMiles,'yticklabel',VehOdoMilesStr');
        ylim([0 MaxOfOdoMilesThrsh]);
        xlabel('Vehicles');
        ylabel('Milage');
        text(1:length(VehicleNumbers),MilesDrivenSince1,num2str(round(MilesDrivenSince1')),'vert','bottom','horiz','center'); 
        title('Mileage Info Per Vehicle','FontSize',20);
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on button press in FOM_BrakeBins.
function FOM_BrakeBins_Callback(hObject, eventdata, handles)
% hObject    handle to FOM_BrakeBins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

SelDirButtonVal = getappdata(handles.SelDataDir,'SelDirButtonVal');
AnalyzeFOM_DataVal = getappdata(handles.AnalyzeFOM_Data,'AnalyzeFOM_DataVal');
TotNumOfStopsForAllPPV = getappdata(handles.AnalyzeFOM_Data,'TotNumOfStopsForAllPPV');
CountPerDecelBin = getappdata(handles.AnalyzeFOM_Data,'CountPerDecelBin');
CountPerCell = getappdata(handles.AnalyzeFOM_Data,'CountPerCell');

    % Better Error handling capability
    if isempty(SelDirButtonVal) == 1 && isempty(AnalyzeFOM_DataVal) == 1
        % Folder Selection Completed
        f = errordlg('Folder Not Selected & Data Not Analyzed','Select FOM Data Folder');
    elseif isempty(SelDirButtonVal) == 0 && isempty(AnalyzeFOM_DataVal) == 1
        % Folder Selection Completed But Data not analyzed
        f = errordlg('Folder Selected But Data Not Analyzed','Press Analyze FOM Data');
    else
        %%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        BrakeBins = {'LightBrake - Decel < -4 ',...
            'Medium Brake - -4 <= Decel >= -9','Heavy Brake - Decel < -9'};
        SpeedRatioBins = {'SR < 0.4'; '0.4 > SR > 0.8'; 'SR > 0.8'};
        FOM_Bins_PctPerBrake1 = getappdata(handles.AnalyzeFOM_Data,'FOM_Bins_PctPerBrake');
        yLabel = 'PercentOverTotalStops';
        VehicleNumberPPV = getappdata(handles.AnalyzeFOM_Data,'VehicleNumber');

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Plot FOM data for all the vehicles as a percent of stops in that brake
        % divided by total number of stops for that brake bin
        if (get(handles.PlotByCount,'Value') == 1)
            SumCount_MaxUD_FOM_AllPPV(CountPerCell,CountPerDecelBin,TotNumOfStopsForAllPPV);
        else
            Mean_MaxUD_FOM_AllPPV(FOM_Bins_PctPerBrake1,CountPerDecelBin,TotNumOfStopsForAllPPV);
        end
        %   Store Data to use in a different function call
        setappdata(handles.FOM_BrakeBins,'BrakeBins',BrakeBins);
        setappdata(handles.FOM_BrakeBins,'SpeedRatioBins',SpeedRatioBins);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end

% --- Executes on button press in FOM_TotCnt.
function FOM_TotCnt_Callback(hObject, eventdata, handles)
% hObject    handle to FOM_TotCnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

SelDirButtonVal = getappdata(handles.SelDataDir,'SelDirButtonVal');
AnalyzeFOM_DataVal = getappdata(handles.AnalyzeFOM_Data,'AnalyzeFOM_DataVal');
TotNumOfStopsForAllPPV = getappdata(handles.AnalyzeFOM_Data,'TotNumOfStopsForAllPPV');
CountPerDecelBin = getappdata(handles.AnalyzeFOM_Data,'CountPerDecelBin');

    % Better Error handling capability
    if isempty(SelDirButtonVal) == 1 && isempty(AnalyzeFOM_DataVal) == 1
        % Folder Selection Completed
        f = errordlg('Folder Not Selected & Data Not Analyzed','Select FOM Data Folder');
    elseif isempty(SelDirButtonVal) == 0 && isempty(AnalyzeFOM_DataVal) == 1
        % Folder Selection Completed But Data not analyzed
        f = errordlg('Folder Selected But Data Not Analyzed','Press Analyze FOM Data');
    else
        %%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        BrakeBins = getappdata(handles.FOM_BrakeBins,'BrakeBins');
        SpeedRatioBins = getappdata(handles.FOM_BrakeBins,'SpeedRatioBins');
        FOM_Bins_TotPctCount1 = getappdata(handles.AnalyzeFOM_Data,'FOM_Bins_TotPctCount');
        VehicleNumber = getappdata(handles.AnalyzeFOM_Data,'VehicleNumber');
        yLabel = 'PercentOverTotalStops';

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Plot FOM data for all vehicles as a percent of stops in that brake
        % divided by Total stops in the vehicle
%         MyBarPlotForFOM(FOM_Bins_TotPctCount1,BrakeBins,SpeedRatioBins,yLabel,VehicleNumber);
        Mean_MaxUD_FOM_AllPPV(FOM_Bins_TotPctCount1,CountPerDecelBin,TotNumOfStopsForAllPPV);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end


% --- Executes on selection change in SelectVehFile.
function SelectVehFile_Callback(hObject, eventdata, handles)
% hObject    handle to SelectVehFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SelectVehFile contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectVehFile

% Determine the popup menu selection
SelectionList = get(hObject,'String');
SelectionVal = get(hObject,'Value');
FileNameInPopUpMenu = SelectionList{SelectionVal};

setappdata(handles.SelectVehFile,'FileNameInPopUpMenu',FileNameInPopUpMenu);

%%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
myFile = getappdata(handles.SelectVehFile,'FileNameInPopUpMenu');
Loc = getappdata(handles.SelDataDir,'dir1');

%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION CALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[DateStamp,DateStampIdx] = SelectDate(myFile,Loc);
setappdata(handles.SelectVehFile,'DateStampIdx',DateStampIdx);

InitMsgForDate = getappdata(handles.SelectVehFile,'InitMsgForDate');
ListOfDates = [InitMsgForDate DateStamp];

set(handles.SelectDate,'string',ListOfDates);


% --- Executes during object creation, after setting all properties.
function SelectVehFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectVehFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DisplayFOMDataForVeh.
function DisplayFOMDataForVeh_Callback(hObject, eventdata, handles)
% hObject    handle to DisplayFOMDataForVeh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
myFile = getappdata(handles.SelectVehFile,'FileNameInPopUpMenu');
Loc = getappdata(handles.SelDataDir,'dir1');

if (get(handles.PlotByBrakeBins,'Value') == 1)
    RadButtonSel = 1;
elseif (get(handles.PlotByBrakeBins,'Value') == 0 && get(handles.PlotByTotStops,'Value') == 1)
    RadButtonSel = 2;
elseif (get(handles.PlotByBrakeBins,'Value') == 0 && get(handles.PlotByTotStops,'Value') == 0 && get(handles.PlotByCount,'Value') == 1)
    RadButtonSel = 3;
else
    f = errordlg('Folder Not Selected','Select FOM Data Folder');
end

[FOM_Data,TotCntPerBrkBin,TotStpCnt,VehicleNumber] = DispUD_FOM_OnePPV(myFile,Loc,RadButtonSel);

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

Bin1Val = num2str(FOM_Data(1,1));
Bin2Val = num2str(FOM_Data(1,2));
Bin3Val = num2str(FOM_Data(1,3));
Bin4Val = num2str(FOM_Data(2,1));
Bin5Val = num2str(FOM_Data(2,2));
Bin6Val = num2str(FOM_Data(2,3));
Bin7Val = num2str(FOM_Data(3,1));
Bin8Val = num2str(FOM_Data(3,2));
Bin9Val = num2str(FOM_Data(3,3));

CntPerBrkBin1Val = num2str(TotCntPerBrkBin(1,1));
CntPerBrkBin2Val = num2str(TotCntPerBrkBin(1,2));
CntPerBrkBin3Val = num2str(TotCntPerBrkBin(1,3));

TotStopsVal = num2str(TotStpCnt);

%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION CALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DispFOM(Bin1FromDispFOM, Bin1Val, ...
        Bin2FromDispFOM, Bin2Val, ...
        Bin3FromDispFOM, Bin3Val, ...
        Bin4FromDispFOM, Bin4Val, ...
        Bin5FromDispFOM, Bin5Val, ...
        Bin6FromDispFOM, Bin6Val, ...
        Bin7FromDispFOM, Bin7Val, ...
        Bin8FromDispFOM, Bin8Val, ...
        Bin9FromDispFOM, Bin9Val, ...
        CntPerBrkBin1FromDispFOM, CntPerBrkBin1Val, ...
        CntPerBrkBin2FromDispFOM, CntPerBrkBin2Val, ...
        CntPerBrkBin3FromDispFOM, CntPerBrkBin3Val, ...
        TotalStopsFromDispFOM, TotStopsVal, ...
        VehNumFromDispFOM, VehicleNumber);



% --- Executes on button press in PlotCntForVeh.
function PlotCntForVeh_Callback(hObject, eventdata, handles)
% hObject    handle to PlotCntForVeh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
myFile = getappdata(handles.SelectVehFile,'FileNameInPopUpMenu');
Loc = getappdata(handles.SelDataDir,'dir1');

%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION CALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[FOM_Data,TotCntPerBrkBin,TotStpCnt] = MaxUD_FOM_OnePPV(myFile,Loc);


% --- Executes on selection change in SelectDate.
function SelectDate_Callback(hObject, eventdata, handles)
% hObject    handle to SelectDate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SelectDate contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectDate

% Determine the popup menu selection
SelectionList = get(hObject,'String');
DateSelIdx = get(hObject,'Value');
SelDateInMenu = SelectionList{DateSelIdx};

setappdata(handles.SelectDate,'SelDateInMenu',SelDateInMenu);

setappdata(handles.SelectDate,'DateSelIdx',DateSelIdx);


% --- Executes during object creation, after setting all properties.
function SelectDate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectDate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FOM_Data_ForDate.
function FOM_Data_ForDate_Callback(hObject, eventdata, handles)
% hObject    handle to FOM_Data_ForDate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
myFile = getappdata(handles.SelectVehFile,'FileNameInPopUpMenu');
Loc = getappdata(handles.SelDataDir,'dir1');
DateSelIdx = getappdata(handles.SelectDate,'DateSelIdx');
DateStampIdx = getappdata(handles.SelectVehFile,'DateStampIdx');
DateSel = getappdata(handles.SelectDate,'SelDateInMenu');

if (get(handles.PlotByBrakeBins,'Value') == 1)
    RadButtonSel = 1;
elseif (get(handles.PlotByBrakeBins,'Value') == 0 && get(handles.PlotByTotStops,'Value') == 1)
    RadButtonSel = 2;
elseif (get(handles.PlotByBrakeBins,'Value') == 0 && get(handles.PlotByTotStops,'Value') == 0 && get(handles.PlotByCount,'Value') == 1)
    RadButtonSel = 3;
else
    f = errordlg('Folder Not Selected','Select FOM Data Folder');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION CALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[FOM_Data,TotCntPerBrkBin,TotStpCnt,VehicleNumber,StpsForDate] = DispUD_FOM_ForDate(myFile,Loc,DateSelIdx,DateStampIdx,RadButtonSel);

VehNumAndDate = [VehicleNumber ' '  DateSel];

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

Bin1Val = num2str(FOM_Data(1,1));
Bin2Val = num2str(FOM_Data(1,2));
Bin3Val = num2str(FOM_Data(1,3));
Bin4Val = num2str(FOM_Data(2,1));
Bin5Val = num2str(FOM_Data(2,2));
Bin6Val = num2str(FOM_Data(2,3));
Bin7Val = num2str(FOM_Data(3,1));
Bin8Val = num2str(FOM_Data(3,2));
Bin9Val = num2str(FOM_Data(3,3));

CntPerBrkBin1Val = num2str(TotCntPerBrkBin(1,1));
CntPerBrkBin2Val = num2str(TotCntPerBrkBin(1,2));
CntPerBrkBin3Val = num2str(TotCntPerBrkBin(1,3));

TotStopsVal = num2str(TotStpCnt);

%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION CALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DispFOM(Bin1FromDispFOM, Bin1Val, ...
        Bin2FromDispFOM, Bin2Val, ...
        Bin3FromDispFOM, Bin3Val, ...
        Bin4FromDispFOM, Bin4Val, ...
        Bin5FromDispFOM, Bin5Val, ...
        Bin6FromDispFOM, Bin6Val, ...
        Bin7FromDispFOM, Bin7Val, ...
        Bin8FromDispFOM, Bin8Val, ...
        Bin9FromDispFOM, Bin9Val, ...
        CntPerBrkBin1FromDispFOM, CntPerBrkBin1Val, ...
        CntPerBrkBin2FromDispFOM, CntPerBrkBin2Val, ...
        CntPerBrkBin3FromDispFOM, CntPerBrkBin3Val, ...
        TotalStopsFromDispFOM, TotStopsVal, ...
        VehNumFromDispFOM, VehNumAndDate);


% --- Executes on button press in Plot_FOM_RatBins.
function Plot_FOM_RatBins_Callback(hObject, eventdata, handles)
% hObject    handle to Plot_FOM_RatBins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

SelDirButtonVal = getappdata(handles.SelDataDir,'SelDirButtonVal');
AnalyzeFOM_DataVal = getappdata(handles.AnalyzeFOM_Data,'AnalyzeFOM_DataVal');
TotNumOfStopsForAllPPV = getappdata(handles.AnalyzeFOM_Data,'TotNumOfStopsForAllPPV');
CountPerDecelBin = getappdata(handles.AnalyzeFOM_Data,'CountPerDecelBin');
CountPerCell = getappdata(handles.AnalyzeFOM_Data,'CountPerCell');

    % Better Error handling capability
    if isempty(SelDirButtonVal) == 1 && isempty(AnalyzeFOM_DataVal) == 1
        % Folder Selection Completed
        f = errordlg('Folder Not Selected & Data Not Analyzed','Select FOM Data Folder');
    elseif isempty(SelDirButtonVal) == 0 && isempty(AnalyzeFOM_DataVal) == 1
        % Folder Selection Completed But Data not analyzed
        f = errordlg('Folder Selected But Data Not Analyzed','Press Analyze FOM Data');
    else
        % Plot FOM data for all the vehicles as a percent of stops in that brake
        % divided by total number of stops for that brake bin
        if (get(handles.PlotByCount,'Value') == 1)
            SumCountPerRatBin_MaxUD_FOM_AllPPV(CountPerCell,TotNumOfStopsForAllPPV);
        else
            Mean_MaxUD_FOM_AllPPV(FOM_Bins_PctPerBrake1,CountPerDecelBin,TotNumOfStopsForAllPPV);
        end
    end