function varargout = xlzj(varargin)
% XLZJ MATLAB code for xlzj.fig
%      XLZJ, by itself, creates a new XLZJ or raises the existing
%      singleton*.
%
%      H = XLZJ returns the handle to a new XLZJ or the handle to
%      the existing singleton*.
%
%      XLZJ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in XLZJ.M with the given input arguments.
%
%      XLZJ('Property','Value',...) creates a new XLZJ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before xlzj_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to xlzj_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help xlzj

% Last Modified by GUIDE v2.5 29-Apr-2019 11:24:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @xlzj_OpeningFcn, ...
                   'gui_OutputFcn',  @xlzj_OutputFcn, ...
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





% --- Executes just before xlzj is made visible.
function xlzj_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to xlzj (see VARARGIN)

% Choose default command line output for xlzj
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes xlzj wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = xlzj_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

set(handles.axes1,'visible','off');   %�ڽ��治��ʾ�߿�
set(handles.axes2,'visible','off');
set(handles.axes3,'visible','off');


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%ѡȡ��Ƶ1
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname] =uigetfile({'*.avi';'*.mp4';'*.*'},'����Ƶ'); %���ļ�����Ƶ
global str4;     %ȫ�ֱ����ڶ����ʹ��ʱ��Ҫ��˵
str4=[pathname filename];

video1=VideoReader(str4);   %������str4�е���Ƶ

%%��������ʾ��һ֡
image_name1=strcat('E:\SP1\',num2str(1));
image_name1=strcat(image_name1,'.jpg');   %������˵���˴洢�ĵ�һ֡��Ƭ��λ�����ֺ͸�ʽ
I=read(video1,1);  %����ͼƬ �ĵ�һ֡
I=imresize(I,[196,228]); %˵��ͼ��ֱ���
    
imwrite(I,image_name1,'jpg');                   %дͼƬ
    
axes(handles.axes1);
imshow(I); 



% --- Executes on button press in pushbutton2.%ѡȡ��Ƶ2
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname] =uigetfile({'*.avi';'*.mp4';'*.*'},'����Ƶ');

global str5;      %��ȫ�ֱ����Ķ���ǰҪ��˵
str5=[pathname filename];
%% ��ȡ��Ƶ2
video=VideoReader(str5);
%% ��������ʾ��Ƶ��һ֡
    image_name=strcat('E:\SP2\',num2str(1));
    image_name=strcat(image_name,'.jpg');
    T=read(video,1);  %����ͼƬ
    T=imresize(T,[196,228]);                       %��ͼ���Сȷ��
    
    imwrite(T,image_name,'jpg');                   %дͼƬ
    
axes(handles.axes2);
imshow(T); 



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)%������˹������
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2='E:\SP3\';
str='E:\SP1\';   %str�д���SP1��ͼ��
str1='E:\SP2\';  %str1�д���SP2��ͼ��
global str4;
global str5;
%%ѡȡ��Ƶһ���ж���Ƶ֡��
video1=VideoReader(str4);
frame_number=video1.NumberOfFrames;
%% ��ȡ��Ƶ2
video=VideoReader(str5);
%% ����ͼƬ1��SP1������ͼƬ2��SP2
for i=1:frame_number
    I=imread([str,num2str(i),'.jpg']); %���ζ�ȡÿһ��ͼ��
    T=imread([str1,num2str(i),'.jpg']);
    M=imread([str2,num2str(i),'.jpg']);
    axes(handles.axes1);
    imshow(I);
    axes(handles.axes2);
    imshow(T);
    axes(handles.axes3);
    imshow(M);
end
clear all;




% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global str4;
global str5;
    str2='E:\SP3\';
    str='E:\SP1\';   %str�д���SP1��ͼ��
    str1='E:\SP2\';  %str1�д���SP2��ͼ��
var=get(handles.popupmenu1,'value');
switch var
    case 2
       %%ѡȡ��Ƶһ���ж���Ƶ֡��
       video1=VideoReader(str4);
       frame_number=video1.NumberOfFrames;
       %% ��ȡ��Ƶ2
       video=VideoReader(str5);
       %% ����ͼƬ1��SP1������ͼƬ2��SP2
       for i=1:(frame_number-10)
           image_name1=strcat('E:\SP1\',num2str(i));
           image_name1=strcat(image_name1,'.jpg');
           I=read(video1,i);  %����ͼƬ
           I=imresize(I,[196,228]);
    
           imwrite(I,image_name1,'jpg');                   %дͼƬ
           I=[];
           image_name=strcat('E:\SP2\',num2str(i));
           image_name=strcat(image_name,'.jpg');
           T=read(video,i);  %����ͼƬ
           T=imresize(T,[196,228]);                       %��ͼ���Сȷ��
    
           imwrite(T,image_name,'jpg');                   %дͼƬ
           T=[];
           I=imread([str,num2str(i),'.jpg']); %���ζ�ȡÿһ��ͼ��
           T=imread([str1,num2str(i),'.jpg']);
           im=I;
           [m,n]=size(im);
       %im=im2double(im);
       %I=im2double(I);
       %T=im2double(T);
           I = double(rgb2gray(I))/255; 
           T = double(rgb2gray(T))/255; 
       %����˹�����任���� 
           mp = 1;zt =4; cf =1;ar = 1; cc = [cf ar]; 

           Y_lap = fuse_lap(I,T,zt,cc,mp); 
           imwrite(Y_lap,[str2,num2str(i),'.jpg']);
           axes(handles.axes1);
           imshow(I);
           axes(handles.axes2);
           imshow(T);
           axes(handles.axes3);
           imshow(Y_lap);
       end
       h=dialog('name','��ʾ','position',[600 300 300 150]); %����ʹ����ͨ�Ի�����ʾ��[λ��x��λ��y����ȣ�����]
       uicontrol('parent',h,'style','text','string','��Ƶ�Ѿ��������','position',[40 25 220 100],'fontsize',20); 
       uicontrol('parent',h,'style','pushbutton','position',[80 20 120 30],'string','ȷ��','callback','delete(gcbf)');  %ȷ������[���ң����£���ȣ�����]
       clear all;
        
    case 3
        str2='E:\SP3\';
        str='E:\SP1\';   %str�д���SP1��ͼ��
        str1='E:\SP2\';  %str1�д���SP2��ͼ��
        %video_file1='str4';
        video1=VideoReader(str4);
        frame_number=video1.NumberOfFrames;
        %% ��ȡ��Ƶ2
        %video_file='str5';
        video=VideoReader(str5);
        %% ����ͼƬ1��SP1������ͼƬ2��SP2
        for i=1:(frame_number-10)
            image_name1=strcat('E:\SP1\',num2str(i));
            image_name1=strcat(image_name1,'.jpg');
            I=read(video1,i);  %����ͼƬ
            I=imresize(I,[196,228]);
    
            imwrite(I,image_name1,'jpg');                   %дͼƬ
            I=[];
            image_name=strcat('E:\SP2\',num2str(i));
            image_name=strcat(image_name,'.jpg');
            T=read(video,i);  %����ͼƬ
            T=imresize(T,[196,228]);                       %��ͼ���Сȷ��
    
            imwrite(T,image_name,'jpg');                   %дͼƬ
            T=[];
            I=imread([str,num2str(i),'.jpg']); %���ζ�ȡÿһ��ͼ��
            T=imread([str1,num2str(i),'.jpg']);
            im=I;
            [m,n]=size(im);
        %im=im2double(im);
        %I=im2double(I);
        %T=im2double(T);
            I = double(rgb2gray(I))/255;     %Ϊʲô�����
            T = double(rgb2gray(T))/255;     %Ϊʲô�����
        %�ԱȽ����任���� 
            mp = 1;zt =4; cf =1;ar = 1; cc = [cf ar]; 

            Y_con=fuse_con(I,T,zt,cc,mp); 
            imwrite(Y_con,[str2,num2str(i),'.jpg']);
            axes(handles.axes1);
            imshow(I);
            axes(handles.axes2);
            imshow(T);
            axes(handles.axes3);
            imshow(Y_con);
        end;
        h=dialog('name','��ʾ','position',[600 300 300 150]); %����ʹ����ͨ�Ի�����ʾ��[λ��x��λ��y����ȣ�����]
        uicontrol('parent',h,'style','text','string','��Ƶ�Ѿ��������','position',[40 25 220 100],'fontsize',20); 
        uicontrol('parent',h,'style','pushbutton','position',[80 20 120 30],'string','ȷ��','callback','delete(gcbf)');  %ȷ������[���ң����£���ȣ�����]
        clear all;
    case 4
        video1=VideoReader(str4);
        frame_number=video1.NumberOfFrames;
        % ��ȡ��Ƶ2
        %video_file='str5';
        video=VideoReader(str5);
        %% ����ͼƬ1��SP1������ͼƬ2��SP2
        for i=1:(frame_number-10)
            image_name1=strcat('E:\SP1\',num2str(i));
            image_name1=strcat(image_name1,'.jpg');
            I=read(video1,i);  %����ͼƬ
            I=imresize(I,[196,228]);
    
            imwrite(I,image_name1,'jpg');                   %дͼƬ
            I=[];
            image_name=strcat('E:\SP2\',num2str(i));
            image_name=strcat(image_name,'.jpg');
            T=read(video,i);  %����ͼƬ
            T=imresize(T,[196,228]);                       %��ͼ���Сȷ��
    
            imwrite(T,image_name,'jpg');                   %дͼƬ
            T=[];
            I=imread([str,num2str(i),'.jpg']); %���ζ�ȡÿһ��ͼ��
            T=imread([str1,num2str(i),'.jpg']);
            im=I;
            [m,n]=size(im);
        %im=im2double(im);
        %I=im2double(I);
        %T=im2double(T);
            I = double(rgb2gray(I))/255;         %С����Ҫ�����
            T = double(rgb2gray(T))/255;         %С����Ҫ�����

            Y_wt=wtfusion(I,T,2,'db1'); 
            imwrite(Y_wt,[str2,num2str(i),'.jpg']);
            axes(handles.axes1);
            imshow(I);
            axes(handles.axes2);
            imshow(T);
            axes(handles.axes3);
            imshow(Y_wt);
        end;
        h=dialog('name','��ʾ','position',[600 300 300 150]); %����ʹ����ͨ�Ի�����ʾ��[λ��x��λ��y����ȣ�����]
        uicontrol('parent',h,'style','text','string','��Ƶ�Ѿ��������','position',[40 25 220 100],'fontsize',20); 
        uicontrol('parent',h,'style','pushbutton','position',[80 20 120 30],'string','ȷ��','callback','delete(gcbf)');  %ȷ������[���ң����£���ȣ�����]
        clear all;
    case 5
        str2='E:\SP3\';
        str='E:\SP1\';   %str�д���SP1��ͼ��
        str1='E:\SP2\';  %str1�д���SP2��ͼ��
        video1=VideoReader(str4);
        frame_number=video1.NumberOfFrames;
        %% ��ȡ��Ƶ2
        video=VideoReader(str5);
        %% ����ͼƬ1��SP1������ͼƬ2��SP2
        for i=1:(frame_number-10)
            image_name1=strcat('E:\SP1\',num2str(i));
            image_name1=strcat(image_name1,'.jpg');
            I=read(video1,i);  %����ͼƬ
            I=imresize(I,[196,228]);
    
            imwrite(I,image_name1,'jpg');                   %дͼƬ
            I=[];
            image_name=strcat('E:\SP2\',num2str(i));
            image_name=strcat(image_name,'.jpg');
            T=read(video,i);  %����ͼƬ
            T=imresize(T,[196,228]);                       %��ͼ���Сȷ��
    
            imwrite(T,image_name,'jpg');                   %дͼƬ
            T=[];
            I=imread([str,num2str(i),'.jpg']); %���ζ�ȡÿһ��ͼ��
            T=imread([str1,num2str(i),'.jpg']);
            im=I;
            [m,n]=size(im);
            im=im2double(im);
            I=im2double(I);
            T=im2double(T);
            for p=1:m
               for j=1:n
                  im(p,j)=(I(p,j)+T(p,j))/2;
               end
            end
            imwrite(im,[str2,num2str(i),'.jpg']);
            axes(handles.axes1);
            imshow(I);
            axes(handles.axes2);
            imshow(T);
            axes(handles.axes3);
            imshow(im);
        end;
        h=dialog('name','��ʾ','position',[600 300 300 150]); %����ʹ����ͨ�Ի�����ʾ��[λ��x��λ��y����ȣ�����]
        uicontrol('parent',h,'style','text','string','��Ƶ�Ѿ��������','position',[40 25 220 100],'fontsize',20); 
        uicontrol('parent',h,'style','pushbutton','position',[80 20 120 30],'string','ȷ��','callback','delete(gcbf)');  %ȷ������[���ң����£���ȣ�����]
        clear all;
end;
        


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)   %����ͼƬ
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down')
II=imread('111.jpg');
image(II)
colormap gray
set(ha,'handlevisibility','off','visible','on');
