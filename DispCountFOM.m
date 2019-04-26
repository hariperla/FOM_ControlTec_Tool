function varargout = DispFOM(varargin)
% DISPFOM MATLAB code for DispFOM.fig
%      DISPFOM, by itself, creates a new DISPFOM or raises the existing
%      singleton*.
%
%      H = DISPFOM returns the handle to a new DISPFOM or the handle to
%      the existing singleton*.
%
%      DISPFOM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISPFOM.M with the given input arguments.
%
%      DISPFOM('Property','Value',...) creates a new DISPFOM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DispFOM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DispFOM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DispFOM

% Last Modified by GUIDE v2.5 28-Mar-2018 16:00:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DispFOM_OpeningFcn, ...
                   'gui_OutputFcn',  @DispFOM_OutputFcn, ...
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


% --- Executes just before DispFOM is made visible.
function DispFOM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DispFOM (see VARARGIN)

% Choose default command line output for DispFOM
handles.output = hObject;

set(handles.Bin1,'String',varargin(2));
set(handles.Bin2,'String',varargin(4));
set(handles.Bin3,'String',varargin(6));
set(handles.Bin4,'String',varargin(8));
set(handles.Bin5,'String',varargin(10));
set(handles.Bin6,'String',varargin(12));
set(handles.Bin7,'String',varargin(14));
set(handles.Bin8,'String',varargin(16));
set(handles.Bin9,'String',varargin(18));

set(handles.CountPerBrkBin1,'String',varargin(20));
set(handles.CountPerBrkBin2,'String',varargin(22));
set(handles.CountPerBrkBin3,'String',varargin(24));

set(handles.TotalStops,'String',varargin(26));

set(handles.DispVehNumber,'String',varargin(28));

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DispFOM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DispFOM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function DispVehNumber_Callback(hObject, eventdata, handles)
% hObject    handle to DispVehNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DispVehNumber as text
%        str2double(get(hObject,'String')) returns contents of DispVehNumber as a double


% --- Executes during object creation, after setting all properties.
function DispVehNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DispVehNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[0.94 0.94 0.94]);
end



function Bin1_Callback(hObject, eventdata, handles)
% hObject    handle to Bin1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bin1 as text
%        str2double(get(hObject,'String')) returns contents of Bin1 as a double


% --- Executes during object creation, after setting all properties.
function Bin1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin2_Callback(hObject, eventdata, handles)
% hObject    handle to Bin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bin2 as text
%        str2double(get(hObject,'String')) returns contents of Bin2 as a double


% --- Executes during object creation, after setting all properties.
function Bin2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin3_Callback(hObject, eventdata, handles)
% hObject    handle to Bin3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bin3 as text
%        str2double(get(hObject,'String')) returns contents of Bin3 as a double


% --- Executes during object creation, after setting all properties.
function Bin3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin4_Callback(hObject, eventdata, handles)
% hObject    handle to Bin4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bin4 as text
%        str2double(get(hObject,'String')) returns contents of Bin4 as a double


% --- Executes during object creation, after setting all properties.
function Bin4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin5_Callback(hObject, eventdata, handles)
% hObject    handle to Bin5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bin5 as text
%        str2double(get(hObject,'String')) returns contents of Bin5 as a double


% --- Executes during object creation, after setting all properties.
function Bin5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin6_Callback(hObject, eventdata, handles)
% hObject    handle to Bin6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bin6 as text
%        str2double(get(hObject,'String')) returns contents of Bin6 as a double


% --- Executes during object creation, after setting all properties.
function Bin6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin7_Callback(hObject, eventdata, handles)
% hObject    handle to Bin7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bin7 as text
%        str2double(get(hObject,'String')) returns contents of Bin7 as a double


% --- Executes during object creation, after setting all properties.
function Bin7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin8_Callback(hObject, eventdata, handles)
% hObject    handle to Bin8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bin8 as text
%        str2double(get(hObject,'String')) returns contents of Bin8 as a double


% --- Executes during object creation, after setting all properties.
function Bin8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin9_Callback(hObject, eventdata, handles)
% hObject    handle to Bin9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bin9 as text
%        str2double(get(hObject,'String')) returns contents of Bin9 as a double
set(handles.Bin9,'String',num2str(varargin(2)));


% --- Executes during object creation, after setting all properties.
function Bin9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CountPerBrkBin1_Callback(hObject, eventdata, handles)
% hObject    handle to CountPerBrkBin1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CountPerBrkBin1 as text
%        str2double(get(hObject,'String')) returns contents of CountPerBrkBin1 as a double


% --- Executes during object creation, after setting all properties.
function CountPerBrkBin1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CountPerBrkBin1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CountPerBrkBin2_Callback(hObject, eventdata, handles)
% hObject    handle to CountPerBrkBin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CountPerBrkBin2 as text
%        str2double(get(hObject,'String')) returns contents of CountPerBrkBin2 as a double


% --- Executes during object creation, after setting all properties.
function CountPerBrkBin2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CountPerBrkBin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CountPerBrkBin3_Callback(hObject, eventdata, handles)
% hObject    handle to CountPerBrkBin3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CountPerBrkBin3 as text
%        str2double(get(hObject,'String')) returns contents of CountPerBrkBin3 as a double


% --- Executes during object creation, after setting all properties.
function CountPerBrkBin3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CountPerBrkBin3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TotalStops_Callback(hObject, eventdata, handles)
% hObject    handle to TotalStops (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TotalStops as text
%        str2double(get(hObject,'String')) returns contents of TotalStops as a double


% --- Executes during object creation, after setting all properties.
function TotalStops_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TotalStops (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
