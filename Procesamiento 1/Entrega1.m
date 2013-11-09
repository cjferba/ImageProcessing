function varargout = Entrega1(varargin)
% ENTREGA1 MATLAB code for Entrega1.fig
%      ENTREGA1, by itself, creates a new ENTREGA1 or raises the existing
%      singleton*.
%
%      H = ENTREGA1 returns the handle to a new ENTREGA1 or the handle to
%      the existing singleton*.
%
%      ENTREGA1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENTREGA1.M with the given input arguments.
%
%      ENTREGA1('Property','Value',...) creates a new ENTREGA1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Entrega1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Entrega1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Entrega1

% Last Modified by GUIDE v2.5 09-Nov-2013 19:09:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Entrega1_OpeningFcn, ...
                   'gui_OutputFcn',  @Entrega1_OutputFcn, ...
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


% --- Executes just before Entrega1 is made visible.
function Entrega1_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to Entrega1 (see VARARGIN)

     [a,map]=imread('file_open.jpg');
     [r,c,d]=size(a);

     x=ceil(r/38);
     y=ceil(c/51);
     g=a(1:x:end,1:y:end,:);
     g(g==255)=5.5*255;

     set(handles.Cargar,'CData',g);
     set(handles.BarraColor,'Value',255);

     [a,map]=imread('file_save.jpg');
     [r,c,d]=size(a);

     x=ceil(r/38);
     y=ceil(c/51);
     g=a(1:x:end,1:y:end,:);
     g(g==255)=5.5*255;

     set(handles.Guardar,'CData',g);

     
     [a,map]=imread('tool_plottools_hide.jpg');
     [r,c,d]=size(a);

     x=ceil(r/38);
     y=ceil(c/51);
     g=a(1:x:end,1:y:end,:);
     g(g==255)=5.5*255;

     set(handles.TamIMG1,'CData',g);
     set(handles.TamIMG2,'CData',g);
     set(handles.TamIMG3,'CData',g);
     
     handles.CargaIMG1=0;
     handles.CargaIMG2=0;
     handles.CargaIMG3=0;
     
     handles.Barra1=1;
     handles.Barra2=1;
     handles.Barra3=1;
    % Choose default command line output for Entrega1
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

% UIWAIT makes Entrega1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Entrega1_OutputFcn(hObject, eventdata, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;


% --- Executes on button press in Cargar.
function Cargar_Callback(hObject, eventdata, handles)
    % hObject    handle to Cargar (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    [FileName,PathName] = uigetfile('*.png;*.tif;*.jpg;*.jpeg;*.tiff;*.pgm;*pcx;*.bmp');

    archivo = [PathName,FileName];
    handles.ImagenOr = imread(archivo);

    [~ , ~, color]= size (handles.ImagenOr);
    if (color > 1)
        handles.ImagenOr = rgb2gray(handles.ImagenOr);
    end
    handles.TamanoOriginal= size(handles.ImagenOr);
    %se obtiene el tamaño de la imagen
    tam=size(handles.ImagenOr);
    colormap(gray(256));

    if(get(handles.OpcionIMG1,'Value') == get(handles.OpcionIMG1,'Max'))
        axes(handles.IMG1);%activo handles.IMG1
        handles.CargaIMG1=1;
        handles.ImagenOR1=handles.ImagenOr;%guardo la imagen 
        handles.ImagenRest1=handles.ImagenOr;
        imshow(handles.ImagenOR1),axis off;
        axis image;
        pri=min(min(handles.ImagenOR1));
        ult=max(max(handles.ImagenOR1));
        set(handles.Nivel1,'String', [num2str(pri),'-',num2str(ult)] );
        set(handles.Nivel1,'FontWeight','bold');
        set(handles.Size1,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
        set(handles.Size1,'FontWeight','bold');
    elseif(get(handles.OpcionIMG2,'Value') == get(handles.OpcionIMG2,'Max'))
        axes(handles.IMG2);
        handles.CargaIMG2=1;
        handles.ImagenOR2=handles.ImagenOr;%guardo la imagen
        handles.ImagenRest2=handles.ImagenOr;
        imshow(handles.ImagenOR2),axis off;
        [~,ng]=imhist(handles.ImagenOR2);
        pri=ng(1);
        ult=ng(end);
        set(handles.Nivel2,'String',[num2str(pri),',',num2str(ult)]);
        set(handles.Nivel2,'FontWeight','bold');
        set(handles.Size2,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
        set(handles.Size2,'FontWeight','bold');
    elseif(get(handles.OpcionIMG3,'Value') == get(handles.OpcionIMG3,'Max'))
        axes(handles.IMG3);
        handles.CargaIMG3=1;
        handles.ImagenOR3=handles.ImagenOr;%guardo la imagen 
        handles.ImagenRest3=handles.ImagenOr;
        imshow(handles.ImagenOR3),axis off;
        [~,ng]=imhist(handles.ImagenOR3);
        pri=ng(1);
        ult=ng(end);
        set(handles.Nivel3,'String',[num2str(pri),',',num2str(ult)]);
        set(handles.Nivel3,'FontWeight','bold');
        set(handles.Size3,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
        set(handles.Size3,'FontWeight','bold');
    end
    guidata(hObject, handles);


% --- Executes on selection change in MapColor.
function MapColor_Callback(hObject, eventdata, handles)
% hObject    handle to MapColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MapColor contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MapColor
Valor= get(hObject,'Value');
Cadena= get(hObject, 'String');
handles.MapColores=Cadena;
colormap(char(Cadena{Valor}));


% --- Executes during object creation, after setting all properties.
function MapColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MapColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Diferencia.
function Diferencia_Callback(hObject, eventdata, handles)
% hObject    handle to Diferencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%elijo imagenes para realizar la diferencia
%Origen
if(get(handles.OrigenIMG1,'Value')==get(handles.OrigenIMG1,'Max'))
    ImagenOrigen=handles.ImagenOR1;
elseif(get(handles.OrigenIMG2,'Value')==get(handles.OrigenIMG2,'Max'))
    ImagenOrigen=handles.ImagenOR2;
elseif(get(handles.OrigenIMG3,'Value')==get(handles.OrigenIMG3,'Max'))
    ImagenOrigen=handles.ImagenOR3;
end
%Destino
if(get(handles.DestinoIMG1,'Value')==get(handles.DestinoIMG1,'Max'))
    ImagenDestino=handles.ImagenOR1;
elseif(get(handles.DestinoIMG2,'Value')==get(handles.DestinoIMG2,'Max'))
    ImagenDestino=handles.ImagenOR2;
elseif(get(handles.DestinoIMG3,'Value')==get(handles.DestinoIMG3,'Max'))
    ImagenDestino=handles.ImagenOR3;
end
tam1 = size(ImagenOrigen);
tam2 = size(ImagenDestino);
if(tam1 == tam2)

   handles.ImagenDiferencia = double(ImagenOrigen) - double(ImagenDestino);
   figure('Name','Imagen Diferencia','NumberTitle','off'),imagesc(handles.ImagenDiferencia),colormap(gray(256)),handles.BarraColor,axis off;
else
    errordlg('Las imagenes deben de tener el mismo tamaño');
end
guidata(hObject, handles);


% --- Executes on button press in Interpolacion.
function Interpolacion_Callback(hObject, eventdata, handles)
% hObject    handle to Interpolacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.OrigenIMG1,'Value')==get(handles.OrigenIMG1,'Max'))
    imagen=handles.ImagenOR1;
elseif(get(handles.OrigenIMG2,'Value')==get(handles.OrigenIMG2,'Max'))
    imagen=handles.ImagenOR2;
elseif(get(handles.OrigenIMG3,'Value')==get(handles.OrigenIMG3,'Max'))
    imagen=handles.ImagenOR3;
end
valor=get(handles.MapColor,'Value');
cadena=get(handles.MapColor,'String');

%if de factor o de tamaño
if(get(handles.InterBotonF,'Value')==get(handles.InterBotonF,'Max'))
    [filas columnas]=size(imagen);
    filas=filas*str2double(get(handles.InputFactor, 'String'));
    columnas=columnas*str2double(get(handles.InputFactor, 'String'));
    valor2=get(handles.OpcionInter,'Value');
    switch valor2
        case 1
            img_interpolada=imresize(imagen,[filas columnas],'nearest');
        case 2
            img_interpolada=imresize(imagen,[filas columnas],'bilinear');
        case 3
            img_interpolada=imresize(imagen,[filas columnas],'bicubic');
    end
    
    if(get(handles.DestinoIMG1,'Value')==get(handles.DestinoIMG1,'Max'))
        axes(handles.IMG1);%activo handles.IMG1
        handles.CargaIMG1=1;
        handles.ImagenOR1=img_interpolada;
        imshow(handles.ImagenOR1),axis off;
        tam=size(handles.ImagenOR1);
        pri=min(min(handles.ImagenOR1));
        ult=max(max(handles.ImagenOR1));
        set(handles.Nivel1,'String', [num2str(pri),'-',num2str(ult)] );
        set(handles.Nivel1,'FontWeight','bold');
        set(handles.Size1,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
        set(handles.Size1,'FontWeight','bold');
    elseif(get(handles.DestinoIMG2,'Value')==get(handles.DestinoIMG2,'Max'))
        axes(handles.IMG2);%activo handles.IMG2
        handles.CargaIMG2=1;
        handles.ImagenOR2=img_interpolada;
        imshow(handles.ImagenOR2),axis off;
        tam=size(handles.ImagenOR2);
        [~,ng]=imhist(handles.ImagenOR2);
        pri=ng(1);
        ult=ng(end);
        set(handles.Nivel2,'String',[num2str(pri),',',num2str(ult)]);
        set(handles.Nivel2,'FontWeight','bold');
        set(handles.Size2,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
        set(handles.Size2,'FontWeight','bold');
    elseif(get(handles.DestinoIMG3,'Value')==get(handles.DestinoIMG3,'Max'))
        axes(handles.IMG3);%activo handles.IMG3
        handles.CargaIMG3=1;
        handles.ImagenOR3=img_interpolada;
        imshow(handles.ImagenOR3),axis off;
        [~,ng]=imhist(handles.ImagenOR3);
        tam=size(handles.ImagenOR3);
        pri=ng(1);
        ult=ng(end);
        set(handles.Nivel3,'String',[num2str(pri),',',num2str(ult)]);
        set(handles.Nivel3,'FontWeight','bold');
        set(handles.Size3,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
        set(handles.Size3,'FontWeight','bold');
    end 
elseif(get(handles.InterBotonT,'Value')==get(handles.InterBotonT,'Max'))
    filas=str2double(get(handles.InputFilas,'String'));
    columnas = str2double(get(handles.InputColumnas,'String'));
    valor2=get(handles.OpcionInter,'Value');
    
    switch valor2
        case 1
            img_interpolada=imresize(imagen,[filas columnas],'nearest');
        case 2
            img_interpolada=imresize(imagen,[filas columnas],'bilinear');
        case 3
            img_interpolada=imresize(imagen,[filas columnas],'bicubic');
    end
    
     if(get(handles.DestinoIMG1,'Value')==get(handles.DestinoIMG1,'Max'))
        axes(handles.IMG1);%activo handles.IMG1
        handles.ImagenOR1=img_interpolada;
        imshow(handles.ImagenOR1),axis off;
        tam=size(handles.ImagenOR1);
        pri=min(min(handles.ImagenOR1));
        ult=max(max(handles.ImagenOR1));
        set(handles.Nivel1,'String', [num2str(pri),'-',num2str(ult)] );
        set(handles.Nivel1,'FontWeight','bold');
        set(handles.Size1,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
        set(handles.Size1,'FontWeight','bold');
    elseif(get(handles.DestinoIMG2,'Value')==get(handles.DestinoIMG2,'Max'))
        axes(handles.IMG2);%activo handles.IMG2
        handles.ImagenOR2=img_interpolada;
        imshow(handles.ImagenOR2),axis off;
        tam=size(handles.ImagenOR2);
        [~,ng]=imhist(handles.ImagenOR2);
        pri=ng(1);
        ult=ng(end);
        set(handles.Nivel2,'String',[num2str(pri),',',num2str(ult)]);
        set(handles.Nivel2,'FontWeight','bold');
        set(handles.Size2,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
        set(handles.Size2,'FontWeight','bold');
    elseif(get(handles.DestinoIMG3,'Value')==get(handles.DestinoIMG3,'Max'))
        axes(handles.IMG3);%activo handles.IMG3
        handles.ImagenOR3=img_interpolada;
        imshow(handles.ImagenOR3),axis off;
        [~,ng]=imhist(handles.ImagenOR3);
        tam=size(handles.ImagenOR3);
        pri=ng(1);
        ult=ng(end);
        set(handles.Nivel3,'String',[num2str(pri),',',num2str(ult)]);
        set(handles.Nivel3,'FontWeight','bold');
        set(handles.Size3,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
        set(handles.Size3,'FontWeight','bold');
    end 
end

% --- Executes on button press in Submuestreo.
function Submuestreo_Callback(hObject, eventdata, handles)
% hObject    handle to Submuestreo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.OrigenIMG1,'Value')==get(handles.OrigenIMG1,'Max'))
    imagen=handles.ImagenOR1;
elseif(get(handles.OrigenIMG2,'Value')==get(handles.OrigenIMG2,'Max'))
    imagen=handles.ImagenOR2;
elseif(get(handles.OrigenIMG3,'Value')==get(handles.OrigenIMG3,'Max'))
    imagen=handles.ImagenOR3;
end

valor=get(handles.MapColor,'Value');
cadena=get(handles.MapColor,'String');
factor = str2double(get(handles.InputFactor, 'String'));

%se ve si se tiene activada la opcion de promedio
    promedio=get(handles.OpcionAVG, 'Value');
    %si el promedio esta activo
    if promedio == 1
      %se crea la mascara
      h = (ones(factor) )/ (factor^2);
      %se convoluciona
      u = imfilter(imagen,h,'replicate','same','conv');
      %se obtiene la imagen
      img_submuestreada = u(1:factor:size(u, 1), 1:factor:size(u, 2));
    else
      %si no se emborrona se tiene la imagen original
      img_submuestreada = imagen(1:factor:size(imagen,1), 1:factor:size(imagen, 2));
    end
    
if(get(handles.DestinoIMG1,'Value')==get(handles.DestinoIMG1,'Max'))
    axes(handles.IMG1);%activo handles.IMG1
    %handles.CargaIMG1=1;
    handles.ImagenOR1=img_submuestreada;
    imshow(handles.ImagenOR1),axis off;
    tam=size(handles.ImagenOR1);
    pri=min(min(handles.ImagenOR1));
    ult=max(max(handles.ImagenOR1));
    set(handles.Nivel1,'String', [num2str(pri),'-',num2str(ult)] );
    set(handles.Nivel1,'FontWeight','bold');
    set(handles.Size1,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
    set(handles.Size1,'FontWeight','bold');
elseif(get(handles.DestinoIMG2,'Value')==get(handles.DestinoIMG2,'Max'))
    axes(handles.IMG2);%activo handles.IMG2
    %handles.CargaIMG2=1;
    handles.ImagenOR2=img_submuestreada;
    imshow(handles.ImagenOR2),axis off;
    tam=size(handles.ImagenOR2);
    [~,ng]=imhist(handles.ImagenOR2);
    pri=ng(1);
    ult=ng(end);
    set(handles.Nivel2,'String',[num2str(pri),',',num2str(ult)]);
    set(handles.Nivel2,'FontWeight','bold');
    set(handles.Size2,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
    set(handles.Size2,'FontWeight','bold');
elseif(get(handles.DestinoIMG3,'Value')==get(handles.DestinoIMG3,'Max'))
    axes(handles.IMG3);%activo handles.IMG3
    %handles.CargaIMG3=1;
    handles.ImagenOR3=img_submuestreada;
    imshow(handles.ImagenOR3),axis off;
    [~,ng]=imhist(handles.ImagenOR3);
    tam=size(handles.ImagenOR3);
    pri=ng(1);
    ult=ng(end);
    set(handles.Nivel3,'String',[num2str(pri),',',num2str(ult)]);
    set(handles.Nivel3,'FontWeight','bold');
    set(handles.Size3,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
    set(handles.Size3,'FontWeight','bold');
end 
 



% --- Executes on slider movement.
function BarraColor_Callback(hObject, eventdata, handles)
% hObject    handle to BarraColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine rangeof slider
barraValor = fix(get(handles.BarraColor,'Value'));
%se muestra el valor que se escoge
set(handles.Niveles,'String', barraValor);
%se obtiene el mapa de color que se tiene
valor=get(handles.MapColor,'Value');

cadena=get(handles.MapColor,'String');
%se aplica el numero de niveles de color para el mapa que se tiene
colormap([char(cadena{valor}), '(',num2str(barraValor),')']);
% Update handles structure
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function BarraColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BarraColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in OpcionInter.
function OpcionInter_Callback(hObject, eventdata, handles)
% hObject    handle to OpcionInter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns OpcionInter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from OpcionInter


% --- Executes during object creation, after setting all properties.
function OpcionInter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OpcionInter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function InputFilas_Callback(hObject, eventdata, handles)
% hObject    handle to InputFilas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InputFilas as text
%        str2double(get(hObject,'String')) returns contents of InputFilas as a double


% --- Executes during object creation, after setting all properties.
function InputFilas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputFilas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function InputColumnas_Callback(hObject, eventdata, handles)
% hObject    handle to InputColumnas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InputColumnas as text
%        str2double(get(hObject,'String')) returns contents of InputColumnas as a double


% --- Executes during object creation, after setting all properties.
function InputColumnas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputColumnas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function InputFactor_Callback(hObject, eventdata, handles)
% hObject    handle to InputFactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InputFactor as text
%        str2double(get(hObject,'String')) returns contents of InputFactor as a double


% --- Executes during object creation, after setting all properties.
function InputFactor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputFactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OpcionAVG.
function OpcionAVG_Callback(hObject, eventdata, handles)
% hObject    handle to OpcionAVG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of OpcionAVG


% --- Executes on button press in BarraIMG1.
function BarraIMG1_Callback(hObject, eventdata, handles)
% hObject    handle to BarraIMG1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    if (handles.Barra1 == 1)
        % Mostramos la imagen
        handles.Barra1=0;
        axes(handles.IMG1);
        imagesc(handles.ImagenOR1);
        axis off;
        axis image;
        % Mostramos la barra de color abajo
        colorbar('location','southoutside');
    elseif (handles.Barra1 == 0)
        % Mostramos la imagen
        axes(handles.IMG1);
        cla(handles.IMG1,'reset')
        handles.Barra1=1;
        imagesc(handles.ImagenOR1);
        axis off;
        axis image;
        % Ocultamos la barra de color
        colorbar('hide');
    end
guidata(hObject,handles);


% --- Executes on button press in BarraIMG2.
function BarraIMG2_Callback(hObject, eventdata, handles)
% hObject    handle to BarraIMG2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    if (handles.Barra2 == 1)
        % Mostramos la imagen
        handles.Barra2=0;
        axes(handles.IMG2);
        imagesc(handles.ImagenOR2);
        axis off;
        axis image;
        % Mostramos la barra de color abajo
        colorbar('location','southoutside');
    elseif (handles.Barra2 == 0)
        % Mostramos la imagen
        axes(handles.IMG2);
        cla(handles.IMG2,'reset')
        handles.Barra2=1;
        imagesc(handles.ImagenOR2);
        axis off;
        axis image;
        % Ocultamos la barra de color
        colorbar('hide');
    end
guidata(hObject,handles);


% --- Executes on button press in BarraIMG3.
function BarraIMG3_Callback(hObject, eventdata, handles)
% hObject    handle to BarraIMG3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    if (handles.Barra3 == 1)
        % Mostramos la imagen
        handles.Barra3=0;
        axes(handles.IMG3);
        imagesc(handles.ImagenOR3);
        axis off;
        axis image;
        % Mostramos la barra de color abajo
        colorbar('location','southoutside');
    elseif (handles.Barra3 == 0)
        % Mostramos la imagen
        axes(handles.IMG3);
        cla(handles.IMG3,'reset')
        handles.Barra3=1;
        imagesc(handles.ImagenOR3);
        axis off;
        axis image;
        % Ocultamos la barra de color
        colorbar('hide');
    end
guidata(hObject,handles);

% --- Executes on button press in TamIMG1.
function TamIMG1_Callback(hObject, eventdata, handles)
% hObject    handle to TamIMG1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in tamReal1.
% Mostramos la imagen a tamaño real
figure('Name','Imagen a Tamaño Real','NumberTitle','off'), imshow(handles.ImagenOR1),axis off;


% --- Executes on button press in TamIMG2.
function TamIMG2_Callback(hObject, eventdata, handles)
% hObject    handle to TamIMG2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure('Name','Imagen a Tamaño Real','NumberTitle','off'), imshow(handles.ImagenOR2),axis off;

% --- Executes on button press in TamIMG3.
function TamIMG3_Callback(hObject, eventdata, handles)
% hObject    handle to TamIMG3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure('Name','Imagen a Tamaño Real','NumberTitle','off'), imshow(handles.ImagenOR3),axis off;


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(handles.CargaIMG1 == 1)
    axes(handles.IMG1);%activo handles.IMG1
    handles.CargaIMG1=1;
    imshow(handles.ImagenRest1),axis off;
    tam=size(handles.ImagenRest1);
    pri=min(min(handles.ImagenRest1));
    ult=max(max(handles.ImagenRest1));
    set(handles.Nivel1,'String', [num2str(pri),'-',num2str(ult)] );
    set(handles.Nivel1,'FontWeight','bold');
    set(handles.Size1,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
    set(handles.Size1,'FontWeight','bold');
end
if(handles.CargaIMG2 == 1)
    axes(handles.IMG2);
    handles.CargaIMG2=1;
    imshow(handles.ImagenRest2),axis off;
    tam=size(handles.ImagenRest1);
    pri=min(min(handles.ImagenRest2));
    ult=max(max(handles.ImagenRest2));
    set(handles.Nivel2,'String',[num2str(pri),',',num2str(ult)]);
    set(handles.Nivel2,'FontWeight','bold');
    set(handles.Size2,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
    set(handles.Size2,'FontWeight','bold');
end
%cla(ax,'reset')
if(handles.CargaIMG3 == 1)
    axes(handles.IMG3);
    handles.CargaIMG3=1;
    imshow(handles.ImagenRest3),axis off;
    tam=size(handles.ImagenRest3);
    pri=min(min(handles.ImagenRest3));
    ult=max(max(handles.ImagenRest3));
    set(handles.Nivel3,'String',[num2str(pri),',',num2str(ult)]);
    set(handles.Nivel3,'FontWeight','bold');
    set(handles.Size3,'String',[num2str(tam(1)),' x ',num2str(tam(2))]);
    set(handles.Size3,'FontWeight','bold');
end




% --- Executes on button press in Guardar.
function Guardar_Callback(hObject, eventdata, handles)
% hObject    handle to Guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
