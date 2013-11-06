function varargout = Practica1MIA(varargin)
% PRACTICA1MIA MATLAB code for Practica1MIA.fig
%      PRACTICA1MIA, by itself, creates a new PRACTICA1MIA or raises the existing
%      singleton*.
%
%      H = PRACTICA1MIA returns the handle to a new PRACTICA1MIA or the handle to
%      the existing singleton*.
%
%      PRACTICA1MIA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACTICA1MIA.M with the given input arguments.
%
%      PRACTICA1MIA('Property','Value',...) creates a new PRACTICA1MIA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Practica1MIA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Practica1MIA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Practica1MIA

% Last Modified by GUIDE v2.5 30-Oct-2013 10:20:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Practica1MIA_OpeningFcn, ...
                   'gui_OutputFcn',  @Practica1MIA_OutputFcn, ...
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


% --- Executes just before Practica1MIA is made visible.
function Practica1MIA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Practica1MIA (see VARARGIN)

% Choose default command line output for Practica1MIA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Practica1MIA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Practica1MIA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Hints: contents = cellstr(get(hObject,'String')) returns Menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Menu


% --- Executes during object creation, after setting all properties.
function Menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Emborronar.
function Emborronar_Callback(hObject, eventdata, handles)
mascara(1:3,1:3)=1;
handles.Imagen1= filter2(mascara, handles.Imagen1);
%imagesc(handles.Imagen1),axis off
imshow(handles.Imagen1),axis off;
guidata(hObject,handles);
% hObject    handle to Emborronar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in Rotar.
function Rotar_Callback(hObject, eventdata, handles)
handles.ImRotar=handles.Imagen1;
handles.Imagen1 = imrotate(handles.ImRotar,90,'bicubic');
axes(handles.Imagen1);
%imagesc(handle.Imagen1),axis off;
imshow(handles.Imagen1),axis off;
    [~,ng]=imhist(handles.Imagen1);
    pri=ng(1);
    ult=ng(end);
    set(handles.nivel1,'String',[num2str(pri),',',num2str(ult)]);
    set(handles.nivel1,'FontWeight','bold');
    set(handles.dim1,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
    set(handles.dim1,'FontWeight','bold');
guidata(hObjects,handles);
% hObject    handle to Rotar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in CargaImagen.
function CargaImagen_Callback(hObject, eventdata, handles)
[FileName,PathName] = uigetfile('*.png;*.tif;*.jpg;*.jpeg;*.tiff;*.pgm;*pcx;*.bmp');

archivo = [PathName,FileName];
handles.ImagenOr = imread(archivo);
[~ , ~, color]= size (handles.ImagenOr);
if (color > 1)
    handles.ImagenOr = rgb2gray(handles.ImagenOr);
end
handles.TamanoOriginal= size(handles.ImagenOr);
%se obtiene el tamaño de la imagen
%tam=size(handles.ImagenOr);
colormap(gray(256));
%if(get(handles.Radiob_Imagen1,'Value') == get(handles.Radiob_Imagen1,'Max'))
    axes(handles.Imagen1);
    handles.Imagen1=handles.ImagenOr;
    imshow(handles.Imagen1),axis off;
    [~,ng]=imhist(handles.Imagen1);
    pri=ng(1);
    ult=ng(end);
    set(handles.nivel1,'String',[num2str(pri),',',num2str(ult)]);
    set(handles.nivel1,'FontWeight','bold');
    set(handles.dim1,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
    set(handles.dim1,'FontWeight','bold');
%end
guidata(hObject, handles);
    
    
% hObject    handle to CargaImagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in Menu.
function Menu_Callback(hObject, eventdata, handles)
valor=get(hObject,'Value');
cadena=get(hObject,'String');
colormap(char(cadena{valor}));
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Menu
