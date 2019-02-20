function varargout = Final_Robot(varargin)
% FINAL_ROBOT MATLAB code for Final_Robot.fig
%      FINAL_ROBOT, by itself, creates a new FINAL_ROBOT or raises the existing
%      singleton*.
%
%      H = FINAL_ROBOT returns the handle to a new FINAL_ROBOT or the handle to
%      the existing singleton*.
%
%      FINAL_ROBOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_ROBOT.M with the given input arguments.
%
%      FINAL_ROBOT('Property','Value',...) creates a new FINAL_ROBOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Final_Robot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Final_Robot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Final_Robot

% Last Modified by GUIDE v2.5 26-Dec-2017 14:45:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Final_Robot_OpeningFcn, ...
                   'gui_OutputFcn',  @Final_Robot_OutputFcn, ...
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


% --- Executes just before Final_Robot is made visible.
function Final_Robot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Final_Robot (see VARARGIN)

% Choose default command line output for Final_Robot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Final_Robot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Final_Robot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tbt1.

delete(instrfind({'port'},{'COM9'}));
global ar;
ar=arduino('COM9');
function tbt1_Callback(hObject, eventdata, handles)
% hObject    handle to tbt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ar;
% Hint: get(hObject,'Value') returns toggle state of tbt1



%ar=arduino('COM9');
ar.pinMode(36,'OUTPUT');
ar.pinMode(37,'OUTPUT');
ar.pinMode(41,'OUTPUT');
ar.pinMode(38,'OUTPUT');
ar.pinMode(42,'OUTPUT');
ar.pinMode(43,'OUTPUT');
ar.pinMode(47,'OUTPUT');
ar.pinMode(44,'OUTPUT');
ar.pinMode(48,'OUTPUT');
ar.pinMode(49,'OUTPUT');
ar.pinMode(53,'OUTPUT');
ar.pinMode(50,'OUTPUT');


% Direction

if(get(handles.Man_btn, 'Value')==1)
    

dir=1;
 
ar.digitalWrite(37,dir); %Direction
 ar.digitalWrite(38,dir); % Direction
ar.digitalWrite(43,dir); % Direction
ar.digitalWrite(44,dir); %Direction
ar.digitalWrite(49,dir); %Direction
ar.digitalWrite(50,dir);  %Direction

% Up Move=1
% Down Move=0


Speed1=str2double(get(handles.edit7,'String'));
if (Speed1>100 || Speed1<0)
        set(handles.text6,'Visible','On');
        if(Speed1>100)
        Speed1=100;
        set(handles.edit7,'String',100);
        end
        if(Speed1<0)
          set(handles.edit7,'String',1);
          Speed1=1;
        end
end
load q;
if(get(handles.Motor1,'Value')==1)
while(get(handles.tbt1,'Value')==1)
    ar.digitalWrite(36,1);
  set(handles.edit1,'String',q(1));
    pause(0.125/(Speed1+1));
    ar.digitalWrite(36,0);
    pause(0.125/(Speed1+1));
    
end
end


if(get(handles.Motor2,'Value')==1)
while(get(handles.tbt1,'Value')==1)

    ar.digitalWrite(41,1);
  
      pause(0.125/(Speed1+1));
    ar.digitalWrite(41,0);
    pause(0.125/(Speed1+1));
    
end
end

if(get(handles.Motor3,'Value')==1)
while(get(handles.tbt1,'Value')==1)

    ar.digitalWrite(42,1);
   pause(0.125/(Speed1+1));
    ar.digitalWrite(42,0);
    pause(0.125/(Speed1+1));
    
end
end

if(get(handles.Motor4,'Value')==1)
while(get(handles.tbt1,'Value')==1)

    ar.digitalWrite(47,1);
    pause(0.125/(Speed1+1));
    ar.digitalWrite(47,0);
    pause(0.125/(Speed1+1));
    
end
end

if(get(handles.Motor5,'Value')==1)
while(get(handles.tbt1,'Value')==1)
    ar.digitalWrite(48,1);
    pause(0.125/(Speed1+1));
    ar.digitalWrite(48,0);
    pause(0.125/(Speed1+1));
    
end
end

if(get(handles.Gripper,'Value')==1)
while(get(handles.tbt1,'Value')==1)
    ar.digitalWrite(53,1);
    pause(0.125/(Speed1+1));
    ar.digitalWrite(53,0);
    pause(0.125/(Speed1+1));
    
end

end

end

% --- Executes on button press in tbt2.
function tbt2_Callback(hObject, eventdata, handles)
% hObject    handle to tbt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tbt2

global ar;
ar.pinMode(36,'OUTPUT');
ar.pinMode(37,'OUTPUT');
ar.pinMode(41,'OUTPUT');
ar.pinMode(38,'OUTPUT');
ar.pinMode(42,'OUTPUT');
ar.pinMode(43,'OUTPUT');
ar.pinMode(47,'OUTPUT');
ar.pinMode(44,'OUTPUT');
ar.pinMode(48,'OUTPUT');
ar.pinMode(49,'OUTPUT');
ar.pinMode(53,'OUTPUT');
ar.pinMode(50,'OUTPUT');


% Direction
if(get(handles.Man_btn, 'Value')==1)

dir=0;
 
ar.digitalWrite(37,dir); %Direction
 ar.digitalWrite(38,dir); % Direction
ar.digitalWrite(43,dir); % Direction
ar.digitalWrite(44,dir); %Direction
ar.digitalWrite(49,dir); %Direction
ar.digitalWrite(50,dir);  %Direction

% Up Move=1
% Down Move=0

    Speed1=str2double(get(handles.edit7,'String'));
    if (Speed1>100 || Speed1<0)
        set(handles.text6,'Visible','On');
        if(Speed1>100)
        Speed1=100;
        set(handles.edit7,'String',100);
        end
        if(Speed1<0)
          set(handles.edit7,'String',1);
         Speed1=1;

        end
    end
    
    
if(get(handles.Motor1,'Value')==1)
%for i=1:200
while(get(handles.tbt2,'Value')==1)
    ar.digitalWrite(36,1);
  
    pause(0.125/(Speed1+1));
    ar.digitalWrite(36,0);
    pause(0.125/(Speed1+1));
    
end
end


if(get(handles.Motor2,'Value')==1)
    while(get(handles.tbt2,'Value')==1)
    ar.digitalWrite(41,1);
     pause(0.125/(Speed1+1));
    ar.digitalWrite(41,0);
    pause(0.125/(Speed1+1));
    
end
end

if(get(handles.Motor3,'Value')==1)
while(get(handles.tbt2,'Value')==1)
   ar.digitalWrite(42,1);
   pause(0.125/(Speed1+1));
    ar.digitalWrite(42,0);
    pause(0.125/(Speed1+1));
    
end
end

if(get(handles.Motor4,'Value')==1)
while(get(handles.tbt2,'Value')==1)
    ar.digitalWrite(47,1);
      pause(0.125/(Speed1+1));
    ar.digitalWrite(47,0);
    pause(0.125/(Speed1+1));
    
end
end

if(get(handles.Motor5,'Value')==1)
while(get(handles.tbt2,'Value')==1)
    ar.digitalWrite(48,1);
     pause(0.125/(Speed1+1));
    ar.digitalWrite(48,0);
    pause(0.125/(Speed1+1));
    
end
end

if(get(handles.Gripper,'Value')==1)
while(get(handles.tbt2,'Value')==1)
    ar.digitalWrite(53,1);
      pause(0.125/(Speed1+1));
    ar.digitalWrite(53,0);
    pause(0.125/(Speed1+1));
    
end
end



end





% --- Executes on button press in Auto_btn.
function Auto_btn_Callback(hObject, eventdata, handles)
% hObject    handle to Auto_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Auto_btn



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
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt.



% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton3


% --- Executes on button press in togglebutton4.
function togglebutton4_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton4


% --- Executes on button press in togglebutton5.
function togglebutton5_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton5



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Cal_btn.
function Cal_btn_Callback(hObject, eventdata, handles)
% hObject    handle to Cal_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
q=[0;0;0;0;0;0];
save q,q





