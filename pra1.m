function varargout = pra1(varargin)
% PRA1 MATLAB code for pra1.fig
%      PRA1, by itself, creates a new PRA1 or raises the existing
%      singleton*.
%
%      H = PRA1 returns the handle to a new PRA1 or the handle to
%      the existing singleton*.
%
%      PRA1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRA1.M with the given input arguments.
%
%      PRA1('Property','Value',...) creates a new PRA1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pra1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pra1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pra1

% Last Modified by GUIDE v2.5 03-Sep-2022 20:52:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pra1_OpeningFcn, ...
                   'gui_OutputFcn',  @pra1_OutputFcn, ...
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


% --- Executes just before pra1 is made visible.
function pra1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pra1 (see VARARGIN)

% Choose default command line output for pra1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pra1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
[a,map] = imread('llamar.png');
[r,c,d] = size(a);
x = ceil(r/50);
y = ceil(c/100);
g = a(1:x:end,1:y:end,:);

set(handles.llamada,"CData",g);

% --- Outputs from this function are returned to the command line.
function varargout = pra1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Menujrb_Callback(hObject, eventdata, handles)
% hObject    handle to Menujrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Submenu1jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu1jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=2300; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:1]; %vector de tiempo para las señales numéricas
 
    %Se define la señal de cada dígito
 
    % tecla uno
    s1 = 0.5*[sin(2*pi*filaf(1)*tn)+sin(2*pi*coluf(1)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma); % etiqueta del primer eje
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "1"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1209 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "1"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);


% --------------------------------------------------------------------
function Submenu2jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu2jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(1)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);


% --------------------------------------------------------------------
function Submenu3jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu3jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(1)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "3"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "3"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --------------------------------------------------------------------
function Submenu4jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu4jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(2)*tn)+sin(2*pi*coluf(1)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --------------------------------------------------------------------
function Submenu5jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu5jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(2)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --------------------------------------------------------------------
function Submenu6jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu6jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(2)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --------------------------------------------------------------------
function Submenu7jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu7jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(3)*tn)+sin(2*pi*coluf(1)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --------------------------------------------------------------------
function Submenu8jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu8jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(3)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --------------------------------------------------------------------
function Submenu9jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu9jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(3)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --------------------------------------------------------------------
function Submenu10jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu10jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(4)*tn)+sin(2*pi*coluf(1)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --------------------------------------------------------------------
function Submenu11jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu11jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(4)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --------------------------------------------------------------------
function Submenu12jrb_Callback(hObject, eventdata, handles)
% hObject    handle to Submenu12jrb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(4)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);


% --- Executes on button press in tecla4.
function tecla4_Callback(hObject, eventdata, handles)
% hObject    handle to tecla4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(2)*tn)+sin(2*pi*coluf(1)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --- Executes on button press in tecla2.
function tecla2_Callback(hObject, eventdata, handles)
% hObject    handle to tecla2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=100000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(1)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
     axis([0.41,0.45,-1,1]);
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --- Executes on button press in teclaGato.
function teclaGato_Callback(hObject, eventdata, handles)
% hObject    handle to teclaGato (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(4)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --- Executes on button press in tecla0.
function tecla0_Callback(hObject, eventdata, handles)
% hObject    handle to tecla0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(4)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --- Executes on button press in teclaAst.
function teclaAst_Callback(hObject, eventdata, handles)
% hObject    handle to teclaAst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(4)*tn)+sin(2*pi*coluf(1)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --- Executes on button press in tecla9.
function tecla9_Callback(hObject, eventdata, handles)
% hObject    handle to tecla9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(3)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --- Executes on button press in tecla8.
function tecla8_Callback(hObject, eventdata, handles)
% hObject    handle to tecla8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(3)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --- Executes on button press in tecla7.
function tecla7_Callback(hObject, eventdata, handles)
% hObject    handle to tecla7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(3)*tn)+sin(2*pi*coluf(1)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --- Executes on button press in tecla6.
function tecla6_Callback(hObject, eventdata, handles)
% hObject    handle to tecla6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(2)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --- Executes on button press in tecla5.
function tecla5_Callback(hObject, eventdata, handles)
% hObject    handle to tecla5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(2)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --- Executes on button press in tecla3.
function tecla3_Callback(hObject, eventdata, handles)
% hObject    handle to tecla3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=8000; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:0.8]; %vector de tiempo para las señales numéricas
 
    %Definimos la señal de cada dígito
   
    % tecla dos
    s1 = 0.5*[sin(2*pi*filaf(1)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma);% etiqueta del primer eje 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "3"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "3"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);

% --- Executes on button press in tecla1.
function tecla1_Callback(hObject, eventdata, handles)
% hObject    handle to tecla1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
   coluf = [1209,1336,1447];
 
     fs=2300; %frecuencia de muestreo (operación -->gráfica y sound)
     tn=[0:1/fs:1]; %vector de tiempo para las señales numéricas
 
    %Se define la señal de cada dígito
 
    % tecla uno
    s1 = 0.5*[sin(2*pi*filaf(1)*tn)+sin(2*pi*coluf(1)*tn)];
    % oscilograma
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma); % etiqueta del primer eje
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    axis([0.3,0.4,-1,1]);
    title('Oscilograma de la señal numérica al teclear "1"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1209 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectograma); % etiqueta del segundo eje
    cla; 
    plot(frec,abs((ffts1)/max(ffts1)),'m'); %espectro normalizado
    title('Espectro de la señal numérica al teclear "1"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);


% --- Executes on button press in llamada.
function llamada_Callback(hObject, eventdata, handles)
% hObject    handle to llamada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

