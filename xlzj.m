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

set(handles.axes1,'visible','off');   %在界面不显示边框
set(handles.axes2,'visible','off');
set(handles.axes3,'visible','off');


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%选取视频1
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname] =uigetfile({'*.avi';'*.mp4';'*.*'},'打开视频'); %打开文件中视频
global str4;     %全局变量在定义和使用时都要先说
str4=[pathname filename];

video1=VideoReader(str4);   %读出在str4中的视频

%%在上面显示第一帧
image_name1=strcat('E:\SP1\',num2str(1));
image_name1=strcat(image_name1,'.jpg');   %这两句说明了存储的第一帧照片的位置名字和格式
I=read(video1,1);  %读出图片 的第一帧
I=imresize(I,[196,228]); %说明图像分辨率
    
imwrite(I,image_name1,'jpg');                   %写图片
    
axes(handles.axes1);
imshow(I); 



% --- Executes on button press in pushbutton2.%选取视频2
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname] =uigetfile({'*.avi';'*.mp4';'*.*'},'打开视频');

global str5;      %中全局变量的定义前要先说
str5=[pathname filename];
%% 读取视频2
video=VideoReader(str5);
%% 在上面显示视频第一帧
    image_name=strcat('E:\SP2\',num2str(1));
    image_name=strcat(image_name,'.jpg');
    T=read(video,1);  %读出图片
    T=imresize(T,[196,228]);                       %把图像大小确定
    
    imwrite(T,image_name,'jpg');                   %写图片
    
axes(handles.axes2);
imshow(T); 



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)%拉普拉斯金字塔
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2='E:\SP3\';
str='E:\SP1\';   %str中存了SP1的图像
str1='E:\SP2\';  %str1中存了SP2的图像
global str4;
global str5;
%%选取视频一，判断视频帧数
video1=VideoReader(str4);
frame_number=video1.NumberOfFrames;
%% 读取视频2
video=VideoReader(str5);
%% 分离图片1到SP1，分离图片2到SP2
for i=1:frame_number
    I=imread([str,num2str(i),'.jpg']); %依次读取每一幅图像
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
    str='E:\SP1\';   %str中存了SP1的图像
    str1='E:\SP2\';  %str1中存了SP2的图像
var=get(handles.popupmenu1,'value');
switch var
    case 2
       %%选取视频一，判断视频帧数
       video1=VideoReader(str4);
       frame_number=video1.NumberOfFrames;
       %% 读取视频2
       video=VideoReader(str5);
       %% 分离图片1到SP1，分离图片2到SP2
       for i=1:(frame_number-10)
           image_name1=strcat('E:\SP1\',num2str(i));
           image_name1=strcat(image_name1,'.jpg');
           I=read(video1,i);  %读出图片
           I=imresize(I,[196,228]);
    
           imwrite(I,image_name1,'jpg');                   %写图片
           I=[];
           image_name=strcat('E:\SP2\',num2str(i));
           image_name=strcat(image_name,'.jpg');
           T=read(video,i);  %读出图片
           T=imresize(T,[196,228]);                       %把图像大小确定
    
           imwrite(T,image_name,'jpg');                   %写图片
           T=[];
           I=imread([str,num2str(i),'.jpg']); %依次读取每一幅图像
           T=imread([str1,num2str(i),'.jpg']);
           im=I;
           [m,n]=size(im);
       %im=im2double(im);
       %I=im2double(I);
       %T=im2double(T);
           I = double(rgb2gray(I))/255; 
           T = double(rgb2gray(T))/255; 
       %普拉斯金塔变换参数 
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
       h=dialog('name','提示','position',[600 300 300 150]); %代码使用普通对话框，提示框[位置x，位置y，宽度，长度]
       uicontrol('parent',h,'style','text','string','视频已经播放完毕','position',[40 25 220 100],'fontsize',20); 
       uicontrol('parent',h,'style','pushbutton','position',[80 20 120 30],'string','确定','callback','delete(gcbf)');  %确定按键[左右，上下，宽度，长度]
       clear all;
        
    case 3
        str2='E:\SP3\';
        str='E:\SP1\';   %str中存了SP1的图像
        str1='E:\SP2\';  %str1中存了SP2的图像
        %video_file1='str4';
        video1=VideoReader(str4);
        frame_number=video1.NumberOfFrames;
        %% 读取视频2
        %video_file='str5';
        video=VideoReader(str5);
        %% 分离图片1到SP1，分离图片2到SP2
        for i=1:(frame_number-10)
            image_name1=strcat('E:\SP1\',num2str(i));
            image_name1=strcat(image_name1,'.jpg');
            I=read(video1,i);  %读出图片
            I=imresize(I,[196,228]);
    
            imwrite(I,image_name1,'jpg');                   %写图片
            I=[];
            image_name=strcat('E:\SP2\',num2str(i));
            image_name=strcat(image_name,'.jpg');
            T=read(video,i);  %读出图片
            T=imresize(T,[196,228]);                       %把图像大小确定
    
            imwrite(T,image_name,'jpg');                   %写图片
            T=[];
            I=imread([str,num2str(i),'.jpg']); %依次读取每一幅图像
            T=imread([str1,num2str(i),'.jpg']);
            im=I;
            [m,n]=size(im);
        %im=im2double(im);
        %I=im2double(I);
        %T=im2double(T);
            I = double(rgb2gray(I))/255;     %为什么是这个
            T = double(rgb2gray(T))/255;     %为什么是这个
        %对比金塔变换参数 
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
        h=dialog('name','提示','position',[600 300 300 150]); %代码使用普通对话框，提示框[位置x，位置y，宽度，长度]
        uicontrol('parent',h,'style','text','string','视频已经播放完毕','position',[40 25 220 100],'fontsize',20); 
        uicontrol('parent',h,'style','pushbutton','position',[80 20 120 30],'string','确定','callback','delete(gcbf)');  %确定按键[左右，上下，宽度，长度]
        clear all;
    case 4
        video1=VideoReader(str4);
        frame_number=video1.NumberOfFrames;
        % 读取视频2
        %video_file='str5';
        video=VideoReader(str5);
        %% 分离图片1到SP1，分离图片2到SP2
        for i=1:(frame_number-10)
            image_name1=strcat('E:\SP1\',num2str(i));
            image_name1=strcat(image_name1,'.jpg');
            I=read(video1,i);  %读出图片
            I=imresize(I,[196,228]);
    
            imwrite(I,image_name1,'jpg');                   %写图片
            I=[];
            image_name=strcat('E:\SP2\',num2str(i));
            image_name=strcat(image_name,'.jpg');
            T=read(video,i);  %读出图片
            T=imresize(T,[196,228]);                       %把图像大小确定
    
            imwrite(T,image_name,'jpg');                   %写图片
            T=[];
            I=imread([str,num2str(i),'.jpg']); %依次读取每一幅图像
            T=imread([str1,num2str(i),'.jpg']);
            im=I;
            [m,n]=size(im);
        %im=im2double(im);
        %I=im2double(I);
        %T=im2double(T);
            I = double(rgb2gray(I))/255;         %小波需要这个吗
            T = double(rgb2gray(T))/255;         %小波需要这个吗

            Y_wt=wtfusion(I,T,2,'db1'); 
            imwrite(Y_wt,[str2,num2str(i),'.jpg']);
            axes(handles.axes1);
            imshow(I);
            axes(handles.axes2);
            imshow(T);
            axes(handles.axes3);
            imshow(Y_wt);
        end;
        h=dialog('name','提示','position',[600 300 300 150]); %代码使用普通对话框，提示框[位置x，位置y，宽度，长度]
        uicontrol('parent',h,'style','text','string','视频已经播放完毕','position',[40 25 220 100],'fontsize',20); 
        uicontrol('parent',h,'style','pushbutton','position',[80 20 120 30],'string','确定','callback','delete(gcbf)');  %确定按键[左右，上下，宽度，长度]
        clear all;
    case 5
        str2='E:\SP3\';
        str='E:\SP1\';   %str中存了SP1的图像
        str1='E:\SP2\';  %str1中存了SP2的图像
        video1=VideoReader(str4);
        frame_number=video1.NumberOfFrames;
        %% 读取视频2
        video=VideoReader(str5);
        %% 分离图片1到SP1，分离图片2到SP2
        for i=1:(frame_number-10)
            image_name1=strcat('E:\SP1\',num2str(i));
            image_name1=strcat(image_name1,'.jpg');
            I=read(video1,i);  %读出图片
            I=imresize(I,[196,228]);
    
            imwrite(I,image_name1,'jpg');                   %写图片
            I=[];
            image_name=strcat('E:\SP2\',num2str(i));
            image_name=strcat(image_name,'.jpg');
            T=read(video,i);  %读出图片
            T=imresize(T,[196,228]);                       %把图像大小确定
    
            imwrite(T,image_name,'jpg');                   %写图片
            T=[];
            I=imread([str,num2str(i),'.jpg']); %依次读取每一幅图像
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
        h=dialog('name','提示','position',[600 300 300 150]); %代码使用普通对话框，提示框[位置x，位置y，宽度，长度]
        uicontrol('parent',h,'style','text','string','视频已经播放完毕','position',[40 25 220 100],'fontsize',20); 
        uicontrol('parent',h,'style','pushbutton','position',[80 20 120 30],'string','确定','callback','delete(gcbf)');  %确定按键[左右，上下，宽度，长度]
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
function figure1_CreateFcn(hObject, eventdata, handles)   %背景图片
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down')
II=imread('111.jpg');
image(II)
colormap gray
set(ha,'handlevisibility','off','visible','on');
