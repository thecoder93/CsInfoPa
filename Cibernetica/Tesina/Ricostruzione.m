function varargout = Ricostruzione(varargin)
% RICOSTRUZIONE M-file for Ricostruzione.fig
%      RICOSTRUZIONE, by itself, creates a new RICOSTRUZIONE or raises the existing
%      singleton*.
%
%      H = RICOSTRUZIONE returns the handle to a new RICOSTRUZIONE or the handle to
%      the existing singleton*.
%
%      RICOSTRUZIONE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RICOSTRUZIONE.M with the given input arguments.
%
%      RICOSTRUZIONE('Property','Value',...) creates a new RICOSTRUZIONE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Ricostruzione_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Ricostruzione_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help Ricostruzione

% Last Modified by GUIDE v2.5 08-Apr-2006 02:28:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ricostruzione_OpeningFcn, ...
                   'gui_OutputFcn',  @Ricostruzione_OutputFcn, ...
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


% --- Executes just before Ricostruzione is made visible.
function Ricostruzione_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Ricostruzione (see VARARGIN)

% Choose default command line output for Ricostruzione
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Ricostruzione wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Ricostruzione_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global immagine

nomefile = uigetfile({'*.png;*.jpg;*.jpeg;*.tif','Tutti i file immagine (*.png;*.jpg;*.jpeg;*.tif)'; ...
   '*.png','Immagini Portable Network Graphic (*.png)'; ...
   '*.jpg;*.jpeg','Immagini JPEG (*.jpg;*.jpeg)'; ...
   '*.tif','Immagini TIFF (*.tif)'; ...
   '*','Tutti i file (*)'}, ...
   'Scegli immagine');
if isequal(nomefile, 0)
    return
end

immagine=imread(nomefile);
set(gcf,'CurrentAxes',handles.axes1);
axes1=imshow(immagine);
set(handles.pushbutton2, 'Enable', 'on');
set(handles.pushbutton3, 'Enable', 'on');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global immagine
global immagine2

algo = get(handles.popupmenu1, 'Value');
min_area = get(handles.edit1, 'String');
immagine2 = Main(immagine, str2double(min_area), algo);
set(gcf,'CurrentAxes',handles.axes2);
axes2=imshow(immagine2);
set(handles.pushbutton4, 'Enable', 'on');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global immagine
figure(1);
imshow(immagine);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global immagine2
figure(2);
imshow(immagine2);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

