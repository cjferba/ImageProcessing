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

% Last Modified by GUIDE v2.5 27-Nov-2013 10:55:06

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

     [a,~]=imread('file_open.jpg');
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
     
     [a,map]=imread('tool_colorbar.jpg');
     [r,c,d]=size(a);

     x=ceil(r/38);
     y=ceil(c/51);
     g=a(1:x:end,1:y:end,:);
     g(g==255)=5.5*255;

     set(handles.BarraIMG1,'CData',g);
     set(handles.BarraIMG2,'CData',g);
     set(handles.BarraIMG3,'CData',g);
     
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
    [~, c1]=size(FileName);
    [~, c2]=size([1]);
    if(c1 ~= c2)
        handles.ImagenOr = imread(archivo);

        [~ , ~, color]= size (handles.ImagenOr);
        if (color > 1)
            handles.ImagenOr = rgb2gray(handles.ImagenOr);
        end
        handles.TamanoOriginal= size(handles.ImagenOr);
        %se obtiene el tama�o de la imagen
        tam=size(handles.ImagenOr);
        colormap(gray(256));
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
% Mostramos la imagen a tama�o real
figure('Name','Imagen a Tama�o Real imagen 1','NumberTitle','off'), imshow(handles.ImagenOR1),axis off;

% --- Executes on button press in TamIMG2.
function TamIMG2_Callback(hObject, eventdata, handles)
% hObject    handle to TamIMG2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure('Name','Imagen a Tama�o Real imagen 2','NumberTitle','off'), imshow(handles.ImagenOR2),axis off;

% --- Executes on button press in TamIMG3.
function TamIMG3_Callback(hObject, eventdata, handles)
% hObject    handle to TamIMG3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure('Name','Imagen a Tama�o Real imagen 3','NumberTitle','off'), imshow(handles.ImagenOR3),axis off;


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.IMG1,'reset');
cla(handles.IMG2,'reset');
cla(handles.IMG3,'reset');

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
[FileName,PathName] = uiputfile({'*.jpg';'*.jpeg';'*.pgm';'*pcx';'*.bmp';'*.tiff';'*.tif';'*.png'}, 'Guardar imagen');

if(get(handles.OpcionIMG1,'Value') == get(handles.OpcionIMG1,'Max'))
    imwrite(handles.ImagenOR1,strcat(PathName,FileName));
end
if(get(handles.OpcionIMG2,'Value') == get(handles.OpcionIMG1,'Max'))
    imwrite(handles.ImagenOR1,strcat(PathName,FileName));
end
if(get(handles.OpcionIMG3,'Value') == get(handles.OpcionIMG1,'Max'))
    imwrite(handles.ImagenOR1,strcat(PathName,FileName));
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagen=handles.ImagenOR1;
if(get(handles.OpcionSP,'Value')==get(handles.OpcionSP,'Max'))
    salp=str2double(get(handles.Input1,'String'));
    pimientap=str2double(get(handles.Input2,'String'));
    if(salp<0 || salp>100 || pimientap < 0 || pimientap > 100 || (salp + pimientap) > 100)
        warndlg('Los valores de Sal y pimienta son porcentajes, y entre ellos no pueden sumar mas del 100%','Error');
    else
        A=double(imagen);
        sal=(100-salp-pimientap)/100;
        pimienta=(100-pimientap)/100;
        probab=rand(size(A));
        B=A;
        B(find(sal<=probab & probab<pimienta))=255;
        B(find(pimienta<=probab & probab<=1))=0;
    end
    handles.ImagenRuido = B;
    C=B;
    axes(handles.IMG2);
    handles.IMG2 = uint8(handles.ImagenRuido);
    imshow(handles.IMG2),axis off;
    [~,ng]=imhist(handles.IMG2);
     %SNR y MSE
    [FilasOr ColumOr] = size(handles.ImagenOR1);
    [FilasRu ColumRu] = size(handles.ImagenRuido);
    %MSE
    im_error = double(handles.ImagenRuido) - A;
    mse = norm(im_error(:)).^2/(FilasOr*ColumOr);
    set (handles.OutOrMSE,'String',mse);
    %SNR
    
     media=mean2(A);
    numerador=sum((A(:)-media).^2);
    denominador=sum((A(:)-C(:)).^2);
    snr=10*log10(numerador/denominador);
    set (handles.OutOrSNRdb,'String',snr);
    
    %Tama�o imagen
    pri=ng(1);
    ult=ng(end);
    set(handles.nivel2,'String',['[',num2str(pri),',',num2str(ult),']']);
    set(handles.nivel2,'FontWeight','bold');
   
    guidata(hObject, handles); 
end



function Input1_Callback(hObject, eventdata, handles)
% hObject    handle to Input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Input1 as text
%        str2double(get(hObject,'String')) returns contents of Input1 as a double


% --- Executes during object creation, after setting all properties.
function Input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Input2_Callback(hObject, eventdata, handles)
% hObject    handle to Input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Input2 as text
%        str2double(get(hObject,'String')) returns contents of Input2 as a double


% --- Executes during object creation, after setting all properties.
function Input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OutOrMSE_Callback(hObject, eventdata, handles)
% hObject    handle to OutOrMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OutOrMSE as text
%        str2double(get(hObject,'String')) returns contents of OutOrMSE as a double


% --- Executes during object creation, after setting all properties.
function OutOrMSE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OutOrMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OutOrSHRdb_Callback(hObject, eventdata, handles)
% hObject    handle to OutOrSNRdb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OutOrSNRdb as text
%        str2double(get(hObject,'String')) returns contents of OutOrSNRdb as a double


% --- Executes during object creation, after setting all properties.
function OutOrSNRdb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OutOrSNRdb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
