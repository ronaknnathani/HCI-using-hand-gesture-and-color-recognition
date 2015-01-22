while(1)

% interfacing webcam and setting input properties
clc;
clear all;
close all;
global xb;
global xr;
global xg;
global yb;
global yg;
global yr;
global statsr;
global statsg;
global statsb;
pause on;
cap=videoinput('winvideo',1,'YUY2_640x480');
set(cap,'ReturnedColorSpace','rgb');
set(cap,'FramesPerTrigger',Inf);
cap.FrameGrabInterval=1;

%grabbing continuous frames, colour extraction, binary conversion,
%display, region properties, centroid, bounding box and various     function
%calls
s=listdlg('PromptString','Select a mode:','SelectionMode','single','ListString',{'Simple Mouse Operations','Toggle Windows, Minimize & Close','VLC Player Cotrol','Copy, Paste & Delete','Take Snapshot','Open Various Applications','Power Point Presentation','Exit'},'Name','Available Modes','ListSize',[500 500]);

switch s
    case 1
 % MODE 1_Simple Mouse Operations
start(cap);
while(1)
    flushdata(cap);

    im=getsnapshot(cap);
    im=flipdim(im,2);
    imgr=rgb2gray(im);
    imgray=imadjust(imgr);
    imgray=imadjust(imgr);
    imr=imsubtract(im(:,:,1),imgray);
    imb=imsubtract(im(:,:,3),imgray);
    img=imsubtract(im(:,:,2),imgray);
    imrbw=im2bw(imr,0.25);
    imbbw=im2bw(imb,0.25);
    imgbw=im2bw(img,0.10);
    imrbwfilt=medfilt2(imrbw,[5,5]);
    imgbwfilt=medfilt2(imgbw,[5,5]);
    imbbwfilt=medfilt2(imbbw,[5,5]);
    imrbwpx=bwareaopen(imrbwfilt,900);
    imgbwpx=bwareaopen(imgbwfilt,900);
    imbbwpx=bwareaopen(imbbwfilt,900);
    
    [bwconr numr]= bwlabel(imrbwpx, 8);
    [bwcong numg]= bwlabel(imgbwpx, 8);
    [bwconb numb]= bwlabel(imbbwpx, 8);
    statsr=regionprops(bwconr,'BoundingBox','Centroid');
    statsg=regionprops(bwcong,'BoundingBox','Centroid');
    statsb=regionprops(bwconb,'BoundingBox','Centroid');
    
    for i=1:length(statsr)
        br=statsr(i).BoundingBox;
        cr=statsr(i).Centroid;
        xr=cr(1); yr=cr(2);
        
        
        xi=cr(1);yi=cr(2);
        
        xs=xi*(1366/640);
        ys=yi*(768/480);
        import java.awt.Robot;
        
        cursor=Robot;
        cursor.mouseMove(xs,ys);
       
    end
    
    for i=1:length(statsb)
        bb=statsb(i).BoundingBox;
        cb=statsb(i).Centroid;
        xb=cb(1); yb=cb(2);
        
    end
    
    for i=1:length(statsg)
        bg=statsg(i).BoundingBox;
        cg=statsg(i).Centroid;
        xg=cg(1); yg=cg(2);
        
   
    end
    
      % minimize threshold
   dxmin1=10, dxmin2=110;
   dymin1=130, dymin2=260;
      
   % calling minimize function
   dxmin=abs(xb-xr);
   dymin=abs(yb-yr);
   if numr==1 && numb==1
       if xb>xr && yb<yr
            if dxmin<dxmin2 && dxmin>dxmin1 && dymin<dymin2 && dymin>dymin1
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_WINDOWS);
                 pause(1);
            end
       end
   end
  
       
        if numr==1 && numb==1
            if xr>xb
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON1_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK);
           pause(1)
            end
        end
        
        if numr==1 && numb==1
            if xb>xr
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON3_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON3_MASK);
           pause(1)
            end
        end
        
 % Threshold Exit
  dxexit1=80; dxexit2=220;
  dyexit1=250; dyexit2=380;
  
  % Trigger
  dxexit=abs(xb-xr);
  dyexit=abs(yb-yr);
  if numb==1 && numr==1 && numg==1
      if xr>xb && yb>yr && yb>yg && xg>xb && xg>xr && yr>yg 
          if dxexit>dxexit1 && dxexit<dxexit2 && dyexit>dyexit1 && dyexit<dyexit2
              break;
          end
      end
  end
        
       hold off
     
end
stop(cap);
flushdata(cap);

    case 2

% MODE 2_Windows Toggle, Minimize & Close operations

start(cap);
while(1)
    flushdata(cap);

    im=getsnapshot(cap);
    im=flipdim(im,2);
    imgr=rgb2gray(im);
    imgray=imadjust(imgr);
    imgray=imadjust(imgr);
    imr=imsubtract(im(:,:,1),imgray);
    imb=imsubtract(im(:,:,3),imgray);
    img=imsubtract(im(:,:,2),imgray);
    imrbw=im2bw(imr,0.25);
    imbbw=im2bw(imb,0.25);
    imgbw=im2bw(img,0.10);
    imrbwfilt=medfilt2(imrbw,[5,5]);
    imgbwfilt=medfilt2(imgbw,[5,5]);
    imbbwfilt=medfilt2(imbbw,[5,5]);
    imrbwpx=bwareaopen(imrbwfilt,900);
    imgbwpx=bwareaopen(imgbwfilt,900);
    imbbwpx=bwareaopen(imbbwfilt,900);
    
    [bwconr numr]= bwlabel(imrbwpx, 8);
    [bwcong numg]= bwlabel(imgbwpx, 8);
    [bwconb numb]= bwlabel(imbbwpx, 8);
    statsr=regionprops(bwconr,'BoundingBox','Centroid');
    statsg=regionprops(bwcong,'BoundingBox','Centroid');
    statsb=regionprops(bwconb,'BoundingBox','Centroid');
    
    for i=1:length(statsr)
        br=statsr(i).BoundingBox;
        cr=statsr(i).Centroid;
        xr=cr(1); yr=cr(2);
        
        
        xi=cr(1);yi=cr(2);
        
        xs=xi*(1366/1028);
        ys=yi;
        import java.awt.Robot;
        
        cursor=Robot;
        cursor.mouseMove(xs,ys);
       
    end
    
    for i=1:length(statsb)
        bb=statsb(i).BoundingBox;
        cb=statsb(i).Centroid;
        xb=cb(1); yb=cb(2);
        
    end
    
    for i=1:length(statsg)
        bg=statsg(i).BoundingBox;
        cg=statsg(i).Centroid;
        xg=cg(1); yg=cg(2);
        
   
    end
    
   % minimize threshold
   dxmin1=10, dxmin2=110;
   dymin1=130, dymin2=260;
      
   % calling minimize function
   dxmin=abs(xb-xr);
   dymin=abs(yb-yr);
   if numr==1 && numb==1
       if xb>xr && yb<yr
            if dxmin<dxmin2 && dxmin>dxmin1 && dymin<dymin2 && dymin>dymin1
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_WINDOWS);
                 pause(1);
            end
       end
   end
           
   % close threshold   
   dxcloserb1=150; dxcloserb2=300;
   dycloserb1=20; dycloserb2=140;
%    dxcloserg1=75; dxcloserg2=125;
%    dycloserg1=25; dycloserg2=75;
%    dxclosebg1=280; dxclosebg2=330;
%    dyclosebg1=70; dyclosebg2=130;
   
   %calling close
   dxcloserb=abs(xb-xr);
%    dxcloserg=abs(xr-xg);
%    dxclosebg=abs(xb-xg);
   dycloserb=abs(yr-yb);
%    dycloserg=abs(yr-yg);
%    dyclosebg=abs(yb-yg);
   if numb==1 && numr==1
       if xr>xb && yr>yb 
           if dxcloserb>dxcloserb1 && dxcloserb<dxcloserb2 && dycloserb>dycloserb1 && dycloserb<dycloserb2 
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_ALT);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_SPACE);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_ALT);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_SPACE);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_C);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_C);
                 pause(1);
           end
       end
   end
   
  
    
   % Shuffle Threshold
   dxwin1=80; dxwin2=250;
   dywin1=250; dywin2=400;   
   
   % Trigger
   dxwine=abs(xb-xr);
   dywine=abs(yb-yr);
   if numr==1 && numb==1
        if xb>xr && yb>yr
                 if dxwine>dxwin1 && dxwine<dxwin2 && dywine>dywin1 && dywine<dywin2
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_TAB);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_TAB);
                 pause(0.3);
                 end
        end
   end
   
   % Threshold release windows
    dxcopy1=0; dxcopy2=100;
    dycopy1=0; dycopy2=100;
    % Trigger
    dxcopy=abs(xb-xr);
    dycopy=abs(yb-yr);
    if numb==1 && numr==1
        if xr>xb yr>yb
            if dxcopy>dxcopy1 && dxcopy<dxcopy2
             
                import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_WINDOWS);
                 pause(0.5);
            end
        end
    end
    
     
       
        if numr==2
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON1_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK);
        end
        if numb==2
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON3_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON3_MASK);
        end
        
     % Threshold Exit
 dxexit1=80; dxexit2=220;
  dyexit1=250; dyexit2=380;
  
  % Trigger
  dxexit=abs(xb-xr);
  dyexit=abs(yb-yr);
  if numb==1 && numr==1 && numg==1
      if xr>xb && yb>yr && yb>yg && xg>xb && xg>xr && yr>yg 
          if dxexit>dxexit1 && dxexit<dxexit2 && dyexit>dyexit1 && dyexit<dyexit2
              break;
          end
      end
  end
        
       
     
end
stop(cap);
flushdata(cap);

    case 3
        
% MODE 3_VLC control

start(cap);
while(1)
    flushdata(cap);

    im=getsnapshot(cap);
    im=flipdim(im,2);
    imgr=rgb2gray(im);
    imgray=imadjust(imgr);
    imgray=imadjust(imgr);
    imr=imsubtract(im(:,:,1),imgray);
    imb=imsubtract(im(:,:,3),imgray);
    img=imsubtract(im(:,:,2),imgray);
    imrbw=im2bw(imr,0.25);
    imbbw=im2bw(imb,0.25);
    imgbw=im2bw(img,0.10);
    imrbwfilt=medfilt2(imrbw,[5,5]);
    imgbwfilt=medfilt2(imgbw,[5,5]);
    imbbwfilt=medfilt2(imbbw,[5,5]);
    imrbwpx=bwareaopen(imrbwfilt,900);
    imgbwpx=bwareaopen(imgbwfilt,900);
    imbbwpx=bwareaopen(imbbwfilt,900);
    
    
    [bwconr numr]= bwlabel(imrbwpx, 8);
    [bwcong numg]= bwlabel(imgbwpx, 8);
    [bwconb numb]= bwlabel(imbbwpx, 8);
    statsr=regionprops(bwconr,'BoundingBox','Centroid');
    statsg=regionprops(bwcong,'BoundingBox','Centroid');
    statsb=regionprops(bwconb,'BoundingBox','Centroid');
    
    for i=1:length(statsr)
        br=statsr(i).BoundingBox;
        cr=statsr(i).Centroid;
        xr=cr(1); yr=cr(2);
       
        
        xi=cr(1);yi=cr(2);
        
        xs=xi*(1366/1028);
        ys=yi;
        import java.awt.Robot;
        
        cursor=Robot;
        cursor.mouseMove(xs,ys);
       
    end
    
    for i=1:length(statsb)
        bb=statsb(i).BoundingBox;
        cb=statsb(i).Centroid;
        xb=cb(1); yb=cb(2);
        
   
    end
    
    for i=1:length(statsg)
        bg=statsg(i).BoundingBox;
        cg=statsg(i).Centroid;
        xg=cg(1); yg=cg(2);
       
    end
    
   % Decrease Volume Threshold
   dxvoldec1=20, dxvoldec2=170;
   dyvoldec1=70, dyvoldec2=230;
      
   % Trigger Decrease
   dxvoldec=abs(xb-xr);
   dyvoldec=abs(yb-yr);
   if numr==1 && numb==1
       if xb<xr && yb<yr
            if dxvoldec<dxvoldec2 && dxvoldec>dxvoldec1 && dyvoldec<dyvoldec2 && dyvoldec>dyvoldec1
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_CONTROL);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_DOWN);
                 pause(0.25);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_DOWN);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_CONTROL);
                 pause(0.25);
            end
       end
   end
   
   % Increase Volume
   dxvolinc1=20; dxvolinc2=170;
   dyvolinc1=70; dyvolinc2=230;
   %trigger increase
   dxvolinc=abs(xb-xr);
   dyvolinc=abs(yb-yr);
   if numb==1 && numr==1
       if xr<xb && yb>yr
           if dxvolinc>dxvolinc1 && dxvolinc<dxvolinc2 && dyvolinc>dyvolinc1 && dyvolinc<dyvolinc2
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_CONTROL);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_UP);
                 pause(0.25);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_UP);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_CONTROL);
                 pause(0.25);
           end
       end
   end
   
           
   % VLC Open Threshold   
   dxvlcrg1=100; dxvlcrg2=200;
   dyvlcrg1=90; dyvlcrg2=190;
%    dxcloserg1=75; dxcloserg2=125;
%    dycloserg1=25; dycloserg2=75;
%    dxclosebg1=280; dxclosebg2=330;
%    dyclosebg1=70; dyclosebg2=130;
   
   % VLC open Trigger
   dxvlcrg=abs(xg-xr);
%    dxcloserg=abs(xr-xg);
%    dxclosebg=abs(xb-xg);
   dyvlcrg=abs(yr-yg);
%    dycloserg=abs(yr-yg);
%    dyclosebg=abs(yb-yg);
   if numg==1 && numr==1
       if xr>xg && yg>yr
           if dxvlcrg>dxvlcrg1 && dxvlcrg<dxvlcrg2 && dyvlcrg>dyvlcrg1 && dyvlcrg<dyvlcrg2 
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_3);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_3);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_WINDOWS);
                 pause(1);
           end
       end
   end
   
   % File Open in VLC Threshold
   dxvlcopenrg1=50; dxvlcopenrg2=150;
   dyvlcopenrg1=80; dyvlcopenrg2=180;
   
   % File Open Trigger
   dxvlcopenrg=abs(xg-xr);
   dyvlcopenrg=abs(yg-yr);
   
   if numg==1 && numr==1
       if xg>xr && yg>yr
           if dxvlcopenrg>dxvlcopenrg1 && dxvlcopenrg<dxvlcopenrg2 && dyvlcopenrg>dyvlcopenrg1 && dyvlcopenrg<dyvlcopenrg2
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_CONTROL);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_O);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_O);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_CONTROL);
                 pause(1);
           end
       end
   end
   
   % Threshold Forward
   dxforward1=0; dxforward2=100;
   dyforward1=0; dyforward2=100;
   
   %Trigger
   dxforward=abs(xg-xr);
   dyforward=abs(yg-yr);
   if numg==1 && numr==1
       if xg>xr && yg>yr
           if dxforward>dxforward1 && dxforward<dxforward2 && dyforward>dyforward1 && dyforward<dyforward2
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_CONTROL);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_RIGHT);
                 pause(0.25)
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_RIGHT);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_CONTROL);
                 pause(1);
           end
       end
   end
   
    % Threshold Backward
   dxbackward1=0; dxbackward2=100;
   dybackward1=0; dybackward2=100;
   
   %Trigger
   dxbackward=abs(xg-xr);
   dybackward=abs(yg-yr);
   if numg==1 && numr==1
       if xg<xr && yg>yr
           if dxbackward>dxbackward1 && dxbackward<dxbackward2 && dybackward>dybackward1 && dybackward<dyforward2
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_CONTROL);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_LEFT);
                 pause(0.25)
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_CONTROL);
                 pause(1);
           end
       end
   end
     
   % minimize threshold
   dxmin1=10, dxmin2=150;
   dymin1=130, dymin2=260;
      
   % calling minimize function
   dxmin=abs(xb-xr);
   dymin=abs(yb-yr);
   if numr==1 && numb==1
       if xb>xr && yb<yr
            if dxmin<dxmin2 && dxmin>dxmin1 && dymin<dymin2 && dymin>dymin1
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_WINDOWS);
                 pause(1);
            end
       end
   end
   
    % close threshold   
   dxcloserb1=150; dxcloserb2=300;
   dycloserb1=10; dycloserb2=140;
%    dxcloserg1=75; dxcloserg2=125;
%    dycloserg1=25; dycloserg2=75;
%    dxclosebg1=280; dxclosebg2=330;
%    dyclosebg1=70; dyclosebg2=130;
   
   %calling close
   dxcloserb=abs(xb-xr);
%    dxcloserg=abs(xr-xg);
%    dxclosebg=abs(xb-xg);
   dycloserb=abs(yr-yb);
%    dycloserg=abs(yr-yg);
%    dyclosebg=abs(yb-yg);
   if numb==1 && numr==1
       if xr>xb && yr>yb 
           if dxcloserb>dxcloserb1 && dxcloserb<dxcloserb2 && dycloserb>dycloserb1 && dycloserb<dycloserb2 
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_ALT);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_SPACE);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_ALT);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_SPACE);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_C);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_C);
                 pause(1);
           end
       end
   end
   
   
    
    if numr==2
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON1_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK);
        end
        if numb==2
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON3_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON3_MASK);
        end
   
   
  % Threshold Exit
  dxexit1=80; dxexit2=220;
  dyexit1=250; dyexit2=380;
  % Trigger
  dxexit=abs(xb-xr);
  dyexit=abs(yb-yr);
  if numb==1 && numr==1 && numg==1
      if xr>xb && yb>yr && yb>yg && xg>xb && xg>xr && yr>yg 
          if dxexit>dxexit1 && dxexit<dxexit2 && dyexit>dyexit1 && dyexit<dyexit2
              break;
          end
      end
  end
   
     
end
stop(cap);
flushdata(cap);

    case 4

% Mode 4_Copy Paste Delete
start(cap);
while(cap.FramesAcquired<=300)
    flushdata(cap);

    im=getsnapshot(cap);
    im=flipdim(im,2);
    imgr=rgb2gray(im);
    imgray=imadjust(imgr);
    imgray=imadjust(imgr);
    imr=imsubtract(im(:,:,1),imgray);
    imb=imsubtract(im(:,:,3),imgray);
    img=imsubtract(im(:,:,2),imgray);
    imrbw=im2bw(imr,0.25);
    imbbw=im2bw(imb,0.25);
    imgbw=im2bw(img,0.10);
    imrbwfilt=medfilt2(imrbw,[5,5]);
    imgbwfilt=medfilt2(imgbw,[5,5]);
    imbbwfilt=medfilt2(imbbw,[5,5]);
    imrbwpx=bwareaopen(imrbwfilt,900);
    imgbwpx=bwareaopen(imgbwfilt,900);
    imbbwpx=bwareaopen(imbbwfilt,900);
    
    [bwconr numr]= bwlabel(imrbwpx, 8);
    [bwcong numg]= bwlabel(imgbwpx, 8);
    [bwconb numb]= bwlabel(imbbwpx, 8);
    statsr=regionprops(bwconr,'BoundingBox','Centroid');
    statsg=regionprops(bwcong,'BoundingBox','Centroid');
    statsb=regionprops(bwconb,'BoundingBox','Centroid');
    
    for i=1:length(statsr)
        br=statsr(i).BoundingBox;
        cr=statsr(i).Centroid;
        xr=cr(1); yr=cr(2);
        
        
        xi=cr(1);yi=cr(2);
        
        xs=xi*(1366/1028);
        ys=yi;
        import java.awt.Robot;
        
        cursor=Robot;
        cursor.mouseMove(xs,ys);
       
    end
    
    for i=1:length(statsb)
        bb=statsb(i).BoundingBox;
        cb=statsb(i).Centroid;
        xb=cb(1); yb=cb(2);
        
    end
    
    for i=1:length(statsg)
        bg=statsg(i).BoundingBox;
        cg=statsg(i).Centroid;
        xg=cg(1); yg=cg(2);
        
   
    end
    
   % minimize threshold
   dxmin1=10, dxmin2=110;
   dymin1=130, dymin2=230;
      
   % calling minimize function
   dxmin=abs(xb-xr);
   dymin=abs(yb-yr);
   if numr==1 && numb==1
       if xb>xr && yb<yr
            if dxmin<dxmin2 && dxmin>dxmin1 && dymin<dymin2 && dymin>dymin1
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_WINDOWS);
                 pause(1);
            end
       end
   end
   
   % Threshold copy
    dxcopy1=0; dxcopy2=100;
    dycopy1=0; dycopy2=100;
    % Trigger
    dxcopy=abs(xb-xr);
    dycopy=abs(yb-yr);
    if numb==1 && numr==1
        if xr>xb yr>yb
            if dxcopy>dxcopy1 && dxcopy<dxcopy2
             
                import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_CONTROL);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_C);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_C);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_CONTROL);
                 pause(0.5);
            end
        end
    end
    
    % Threshold paste
    dxpaste1=230; dxpaste2=390;
    dypaste1=70; dypaste2=220;
    % Trigger Paste
    dxpaste=abs(xr-xb);
    dypaste=abs(yb-yr);
    if numb==1 && numr==1
        if xr>xb && yr>yb
            if dxpaste>dxpaste1 && dxpaste<dxpaste2 && dypaste>dypaste1 && dypaste<dypaste2
               
                import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_CONTROL);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_V);
                 pause(0.1);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_V);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_CONTROL);
                 pause(0.5);
            end
        end
    end
    
   % Delete Threshold
   dxdelete1=0; dxdelete2=100;
   dydelete1=0; dydelete2=30;
   
   %Trigger
   dxdelete=abs(xg-xr);
   dydelete=abs(yg-yr);
   if numr==1 && numg==1
       if xg>xr && yr>yg
           if dxdelete>dxdelete1 && dxdelete<dxdelete2 && dydelete>dydelete1 && dydelete<dydelete2
                import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_DELETE);
                 
                 pause(0.1);
                 
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_DELETE);
                 pause(0.5);
           end
       end
   end
   
   % Threshold Enter
   dxenter1=0; dxenter2=100;
   dyenter1=0; dyenter2=30;
   
   %Trigger
   dxenter=abs(xg-xr);
   dyenter=abs(yg-yr);
   if numr==1 && numg==1
       if xr>xg && yr>yg
           if dxenter>dxenter1 && dxenter<dxenter2 && dyenter>dyenter1 && dyenter<dyenter2
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_ENTER);
                 
                 pause(0.1);
                 
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_ENTER);
                 pause(0.5);
           end
       end
   end
                 
    
 
   
   
   
   if numr==2
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON1_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK);
   end
        
   if numb==2
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON3_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON3_MASK);
   end
   
 % Threshold Exit
  dxexit1=80; dxexit2=220;
  dyexit1=250; dyexit2=380;
  
  % Trigger
  dxexit=abs(xb-xr);
  dyexit=abs(yb-yr);
  if numb==1 && numr==1 && numg==1
      if xr>xb && yb>yr && yb>yg && xg>xb && xg>xr && yr>yg 
          if dxexit>dxexit1 && dxexit<dxexit2 && dyexit>dyexit1 && dyexit<dyexit2
              break;
          end
      end
  end
   
   
     
end
stop(cap);
flushdata(cap);

    case 5
        
% Mode 5_Snapshot
start(cap);
while(1)
    flushdata(cap);

    im=getsnapshot(cap);
    im=flipdim(im,2);
    imgr=rgb2gray(im);
    imgray=imadjust(imgr);
    imgray=imadjust(imgr);
    imr=imsubtract(im(:,:,1),imgray);
    imb=imsubtract(im(:,:,3),imgray);
    img=imsubtract(im(:,:,2),imgray);
    imrbw=im2bw(imr,0.25);
    imbbw=im2bw(imb,0.25);
    imgbw=im2bw(img,0.10);
    imrbwfilt=medfilt2(imrbw,[5,5]);
    imgbwfilt=medfilt2(imgbw,[5,5]);
    imbbwfilt=medfilt2(imbbw,[5,5]);
    imrbwpx=bwareaopen(imrbwfilt,900);
    imgbwpx=bwareaopen(imgbwfilt,900);
    imbbwpx=bwareaopen(imbbwfilt,900);
    
    
    [bwconr numr]= bwlabel(imrbwpx, 8);
    [bwcong numg]= bwlabel(imgbwpx, 8);
    [bwconb numb]= bwlabel(imbbwpx, 8);
    statsr=regionprops(bwconr,'BoundingBox','Centroid');
    statsg=regionprops(bwcong,'BoundingBox','Centroid');
    statsb=regionprops(bwconb,'BoundingBox','Centroid');
    
    for i=1:length(statsr)
        br=statsr(i).BoundingBox;
        cr=statsr(i).Centroid;
        xr=cr(1); yr=cr(2);
       
        
        xi=cr(1);yi=cr(2);
        
        xs=xi*(1366/1028);
        ys=yi;
        import java.awt.Robot;
        
        cursor=Robot;
        cursor.mouseMove(xs,ys);
       
    end
    
    for i=1:length(statsb)
        bb=statsb(i).BoundingBox;
        cb=statsb(i).Centroid;
        xb=cb(1); yb=cb(2);
        
   
    end
    
    for i=1:length(statsg)
        bg=statsg(i).BoundingBox;
        cg=statsg(i).Centroid;
        xg=cg(1); yg=cg(2);
       
    end
    
   % Zoom out Threshold
   dxvoldec1=20, dxvoldec2=170;
   dyvoldec1=70, dyvoldec2=230;
      
   % Trigger 
   dxvoldec=abs(xb-xr);
   dyvoldec=abs(yb-yr);
   if numr==1 && numb==1
       if xb<xr && yb<yr
            if dxvoldec<dxvoldec2 && dxvoldec>dxvoldec1 && dyvoldec<dyvoldec2 && dyvoldec>dyvoldec1
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_CONTROL);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_DOWN);
                 pause(0.25);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_DOWN);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_CONTROL);
                 pause(0.25);
            end
       end
   end
   
   % Zoom in
   dxvolinc1=20; dxvolinc2=170;
   dyvolinc1=70; dyvolinc2=230;
   %trigger increase
   dxvolinc=abs(xb-xr);
   dyvolinc=abs(yb-yr);
   if numb==1 && numr==1
       if xr<xb && yb>yr
           if dxvolinc>dxvolinc1 && dxvolinc<dxvolinc2 && dyvolinc>dyvolinc1 && dyvolinc<dyvolinc2
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_CONTROL);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_UP);
                 pause(0.45);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_UP);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_CONTROL);
                 pause(0.25);
           end
       end
   end
   
     
   % minimize threshold
   dxmin1=10, dxmin2=150;
   dymin1=130, dymin2=260;
      
   % calling minimize function
   dxmin=abs(xb-xr);
   dymin=abs(yb-yr);
   if numr==1 && numb==1
       if xb>xr && yb<yr
            if dxmin<dxmin2 && dxmin>dxmin1 && dymin<dymin2 && dymin>dymin1
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_WINDOWS);
                 pause(1);
            end
       end
   end
   
    % close threshold   
   dxcloserb1=150; dxcloserb2=300;
   dycloserb1=10; dycloserb2=140;
%    dxcloserg1=75; dxcloserg2=125;
%    dycloserg1=25; dycloserg2=75;
%    dxclosebg1=280; dxclosebg2=330;
%    dyclosebg1=70; dyclosebg2=130;
   
   %calling close
   dxcloserb=abs(xb-xr);
%    dxcloserg=abs(xr-xg);
%    dxclosebg=abs(xb-xg);
   dycloserb=abs(yr-yb);
%    dycloserg=abs(yr-yg);
%    dyclosebg=abs(yb-yg);
   if numb==1 && numr==1
       if xr>xb && yr>yb 
           if dxcloserb>dxcloserb1 && dxcloserb<dxcloserb2 && dycloserb>dycloserb1 && dycloserb<dycloserb2 
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_ALT);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_SPACE);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_ALT);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_SPACE);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_C);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_C);
                 pause(1);
           end
       end
   end
   
   % snapshot 1
    if numb==2 && numr==2
     
            
            cr1snap=statsr(1).Centroid;
            cb1snap=statsb(1).Centroid;
            xr1snap=cr1snap(1);
            yr1snap=cr1snap(2);
            xb1snap=cb1snap(1);
            yb1snap=cb1snap(2);
            cr2snap=statsr(2).Centroid;
            cb2snap=statsb(2).Centroid;
            xr2snap=cr2snap(1);
            yr2snap=cr2snap(2);
            xb2snap=cb2snap(1);
            yb2snap=cb2snap(2);
            dxsnap=abs(xr1snap-xr2snap);
            dysnap=abs(yr1snap-yb1snap);
            
            imsnap=imcrop(im,[xr1snap+50 yr1snap+50 dxsnap-100 dysnap-100]);
            imwrite(imsnap,'snap1.jpg','Quality',50);
            winopen('snap1.jpg')
            
            pause(2);
            
        
    end
        
   
   
  % Threshold Exit
  dxexit1=80; dxexit2=220;
  dyexit1=250; dyexit2=380;
  
  % Trigger
  dxexit=abs(xb-xr);
  dyexit=abs(yb-yr);
  if numb==1 && numr==1 && numg==1
      if xr>xb && yb>yr && yb>yg && xg>xb && xg>xr && yr>yg 
          if dxexit>dxexit1 && dxexit<dxexit2 && dyexit>dyexit1 && dyexit<dyexit2
              break;
          end
      end
  end
    
    
   
   
     
end
stop(cap);
flushdata(cap);

    case 6

% Mode 6_Various Applications    

start(cap);
while(1)
    flushdata(cap);

    im=getsnapshot(cap);
    im=flipdim(im,2);
    imgr=rgb2gray(im);
    imgray=imadjust(imgr);
    imgray=imadjust(imgr);
    imr=imsubtract(im(:,:,1),imgray);
    imb=imsubtract(im(:,:,3),imgray);
    img=imsubtract(im(:,:,2),imgray);
    imrbw=im2bw(imr,0.25);
    imbbw=im2bw(imb,0.25);
    imgbw=im2bw(img,0.10);
    imrbwfilt=medfilt2(imrbw,[5,5]);
    imgbwfilt=medfilt2(imgbw,[5,5]);
    imbbwfilt=medfilt2(imbbw,[5,5]);
    imrbwpx=bwareaopen(imrbwfilt,900);
    imgbwpx=bwareaopen(imgbwfilt,900);
    imbbwpx=bwareaopen(imbbwfilt,900);
    
    [bwconr numr]= bwlabel(imrbwpx, 8);
    [bwcong numg]= bwlabel(imgbwpx, 8);
    [bwconb numb]= bwlabel(imbbwpx, 8);
    statsr=regionprops(bwconr,'BoundingBox','Centroid');
    statsg=regionprops(bwcong,'BoundingBox','Centroid');
    statsb=regionprops(bwconb,'BoundingBox','Centroid');
    
    for i=1:length(statsr)
        br=statsr(i).BoundingBox;
        cr=statsr(i).Centroid;
        xr=cr(1); yr=cr(2);
        
        
        xi=cr(1);yi=cr(2);
        
        xs=xi*(1366/1028);
        ys=yi;
        import java.awt.Robot;
        
        cursor=Robot;
        cursor.mouseMove(xs,ys);
       
    end
    
    for i=1:length(statsb)
        bb=statsb(i).BoundingBox;
        cb=statsb(i).Centroid;
        xb=cb(1); yb=cb(2);
        
    end
    
    for i=1:length(statsg)
        bg=statsg(i).BoundingBox;
        cg=statsg(i).Centroid;
        xg=cg(1); yg=cg(2);
        
   
    end
    
   % minimize threshold
   dxmin1=10, dxmin2=110;
   dymin1=130, dymin2=260;
      
   % calling minimize function
   dxmin=abs(xb-xr);
   dymin=abs(yb-yr);
   if numr==1 && numb==1
       if xb>xr && yb<yr
            if dxmin<dxmin2 && dxmin>dxmin1 && dymin<dymin2 && dymin>dymin1
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_WINDOWS);
                 pause(1);
            end
       end
   end
           
   % close threshold   
   dxcloserb1=150; dxcloserb2=300;
   dycloserb1=20; dycloserb2=100;
%    dxcloserg1=75; dxcloserg2=125;
%    dycloserg1=25; dycloserg2=75;
%    dxclosebg1=280; dxclosebg2=330;
%    dyclosebg1=70; dyclosebg2=130;
   
   %calling close
   dxcloserb=abs(xb-xr);
%    dxcloserg=abs(xr-xg);
%    dxclosebg=abs(xb-xg);
   dycloserb=abs(yr-yb);
%    dycloserg=abs(yr-yg);
%    dyclosebg=abs(yb-yg);
   if numb==1 && numr==1
       if xr>xb && yr>yb 
           if dxcloserb>dxcloserb1 && dxcloserb<dxcloserb2 && dycloserb>dycloserb1 && dycloserb<dycloserb2 
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_ALT);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_SPACE);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_ALT);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_SPACE);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_C);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_C);
                 pause(1);
           end
       end
   end
   
  % Shuffle Threshold
   dxwin1=80; dxwin2=250;
   dywin1=250; dywin2=400;   
   
   % Trigger
   dxwine=abs(xb-xr);
   dywine=abs(yb-yr);
   if numr==1 && numb==1
        if xb>xr && yb>yr
                 if dxwine>dxwin1 && dxwine<dxwin2 && dywine>dywin1 && dywine<dywin2
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_TAB);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_TAB);
                 pause(0.3);
                 end
        end
   end
   
   % Threshold release windows
    dxcopy1=0; dxcopy2=100;
    dycopy1=0; dycopy2=100;
    % Trigger
    dxcopy=abs(xb-xr);
    dycopy=abs(yb-yr);
    if numb==1 && numr==1
        if xr>xb yr>yb
            if dxcopy>dxcopy1 && dxcopy<dxcopy2
             
                import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_WINDOWS);
                 pause(0.5);
            end
        end
    end
     
    
   % Threshold MS Word
    dxword1=60; dxword2=210;
    dyword1=200; dyword2=350;
    % Trigger 
    dxword=abs(xr-xb);
    dyword=abs(yb-yr);
    if numb==1 && numr==1
        if xr<xb && yr>yb
            if dxword>dxword1 && dxword<dxword2 && dyword>dyword1 && dyword<dyword2
               
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_4);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_4);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_WINDOWS);
                 pause(1.5);
            end
        end
    end
   
   % Notepad Threshold
   dxnotepad1=80; dxnotepad2=210;
   dynotepad1=90; dynotepad2=200;
   
   %Trigger
   dxnotepad=abs(xg-xr);
   dynotepad=abs(yg-yr);
   if numr==1 && numg==1
       if xr<xg && yr<yg
           if dxnotepad>dxnotepad1 && dxnotepad<dxnotepad2 && dynotepad>dynotepad1 && dynotepad<dynotepad2
               system('notepad &');
               pause(1.5);
           end
       end
   end
       
   % Paint Threshold
   dxpaint1=90; dxpaint2=210;
   dypaint1=60; dypaint2=190;
   
   % Trigger
   dxpaint=abs(xg-xr);
   dypaint=abs(yg-yr);
   if numr==1 && numg==1
       if xr>xg && yg>yr
           if dxpaint>dxpaint1 && dxpaint<dxpaint2 && dypaint>dypaint1 && dypaint<dypaint2
               system('mspaint &');
               pause(1.5);
           end
       end
   end
   
   
    % Threshold Excel
    dxexcel1=240; dxexcel2=360;
    dyexcel1=100; dyexcel2=220;
    
    % Trigger 
    dxexcel=abs(xr-xb);
    dyexcel=abs(yb-yr);
    if numb==1 && numr==1 && numg==1
        if xr>xb && yr>yb && yg>yb && yg>yr && xg>xb
            if dxexcel>dxexcel1 && dxexcel<dxexcel2 && dyexcel>dyexcel1 && dyexcel<dyexcel2
               
                Excel = actxserver('Excel.Application');
                Excel.Visible=1;
                pause(1.5);
            end
        end
    end
       
        if numr==2
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON1_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK);
        end
        if numb==2
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON3_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON3_MASK);
        end
        
     
        
        
        % Threshold Exit
  dxexit1=80; dxexit2=220;
  dyexit1=250; dyexit2=380;
  
  
  % Trigger
  dxexit=abs(xb-xr);
  dyexit=abs(yb-yr);
  if numb==1 && numr==1 && numg==1
      if xr>xb && yb>yr && yb>yg && xg>xb && xg>xr && yr>yg 
          if dxexit>dxexit1 && dxexit<dxexit2 && dyexit>dyexit1 && dyexit<dyexit2
              break;
          end
      end
  end
        
       hold off
     
end
stop(cap);
flushdata(cap);

% MODE 7_PPT Control
    case 7
    
start(cap);
while(1)
    flushdata(cap);

    im=getsnapshot(cap);
    im=flipdim(im,2);
    imgr=rgb2gray(im);
    imgray=imadjust(imgr);
    imgray=imadjust(imgr);
    imr=imsubtract(im(:,:,1),imgray);
    imb=imsubtract(im(:,:,3),imgray);
    img=imsubtract(im(:,:,2),imgray);
    imrbw=im2bw(imr,0.25);
    imbbw=im2bw(imb,0.25);
    imgbw=im2bw(img,0.10);
    imrbwfilt=medfilt2(imrbw,[5,5]);
    imgbwfilt=medfilt2(imgbw,[5,5]);
    imbbwfilt=medfilt2(imbbw,[5,5]);
    imrbwpx=bwareaopen(imrbwfilt,900);
    imgbwpx=bwareaopen(imgbwfilt,900);
    imbbwpx=bwareaopen(imbbwfilt,900);
    
    
    [bwconr numr]= bwlabel(imrbwpx, 8);
    [bwcong numg]= bwlabel(imgbwpx, 8);
    [bwconb numb]= bwlabel(imbbwpx, 8);
    statsr=regionprops(bwconr,'BoundingBox','Centroid');
    statsg=regionprops(bwcong,'BoundingBox','Centroid');
    statsb=regionprops(bwconb,'BoundingBox','Centroid');
    
    for i=1:length(statsr)
        br=statsr(i).BoundingBox;
        cr=statsr(i).Centroid;
        xr=cr(1); yr=cr(2);
       
        
        xi=cr(1);yi=cr(2);
        
        xs=xi*(1366/1028);
        ys=yi;
        import java.awt.Robot;
        
        cursor=Robot;
        cursor.mouseMove(xs,ys);
       
    end
    
    for i=1:length(statsb)
        bb=statsb(i).BoundingBox;
        cb=statsb(i).Centroid;
        xb=cb(1); yb=cb(2);
        
   
    end
    
    for i=1:length(statsg)
        bg=statsg(i).BoundingBox;
        cg=statsg(i).Centroid;
        xg=cg(1); yg=cg(2);
       
    end
    
   
    
   % Threshold Forward
   dxforward1=0; dxforward2=100;
   dyforward1=0; dyforward2=100;
   
   %Trigger
   dxforward=abs(xg-xr);
   dyforward=abs(yg-yr);
   if numg==1 && numr==1
       if xg>xr && yg>yr
           if dxforward>dxforward1 && dxforward<dxforward2 && dyforward>dyforward1 && dyforward<dyforward2
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                
                 cursor.keyPress(java.awt.event.KeyEvent.VK_RIGHT);
                 pause(0.25)
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_RIGHT);
                
                 pause(1);
           end
       end
   end
   
    % Threshold Backward
   dxbackward1=0; dxbackward2=100;
   dybackward1=0; dybackward2=100;
   
   %Trigger
   dxbackward=abs(xg-xr);
   dybackward=abs(yg-yr);
   if numg==1 && numr==1
       if xg<xr && yg>yr
           if dxbackward>dxbackward1 && dxbackward<dxbackward2 && dybackward>dybackward1 && dybackward<dyforward2
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 
                 cursor.keyPress(java.awt.event.KeyEvent.VK_LEFT);
                 pause(0.25)
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
                 
                 pause(1);
           end
       end
   end
  
   % Threshold PPT
   dxppt1=230; dxppt2=400;
   dyppt1=140; dyppt2=270;
   
   %Trigger
   dxppt=abs(xr-xb);
   dyppt=abs(yr-yb);
   if numb==1 && numg==1 && numr==1
       if xb>xr && xb>xg && yg>yr && yg>yb && yr>yb
           if dxppt>dxppt1 && dxppt<dxppt2 && dyppt>dyppt1 && dyppt<dyppt2
               winopen('C:\Users\Ronak\Dropbox\Final Year Project\8th Sem\PPT\Project.ppsx');
           end
       end
   end
               
   
     
   % minimize threshold
   dxmin1=10, dxmin2=150;
   dymin1=130, dymin2=260;
      
   % calling minimize function
   dxmin=abs(xb-xr);
   dymin=abs(yb-yr);
   if numr==1 && numb==1
       if xb>xr && yb<yr
            if dxmin<dxmin2 && dxmin>dxmin1 && dymin<dymin2 && dymin>dymin1
                 import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_WINDOWS);
                 cursor.keyPress(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_D);
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_WINDOWS);
                 pause(1);
            end
       end
   end
   
    % close threshold   
   dxcloserb1=150; dxcloserb2=300;
   dycloserb1=10; dycloserb2=140;
%    dxcloserg1=75; dxcloserg2=125;
%    dycloserg1=25; dycloserg2=75;
%    dxclosebg1=280; dxclosebg2=330;
%    dyclosebg1=70; dyclosebg2=130;
   
   %calling close
   dxcloserb=abs(xb-xr);
%    dxcloserg=abs(xr-xg);
%    dxclosebg=abs(xb-xg);
   dycloserb=abs(yr-yb);
%    dycloserg=abs(yr-yg);
%    dyclosebg=abs(yb-yg);
   if numb==1 && numr==1
       if xr>xb && yr>yb 
           if dxcloserb>dxcloserb1 && dxcloserb<dxcloserb2 && dycloserb>dycloserb1 && dycloserb<dycloserb2 
               import java.awt.Robot;
                 import java.awt.event.*;
                 cursor=Robot;
                 cursor.keyPress(java.awt.event.KeyEvent.VK_ESCAPE);
                 pause(0.25)
                 cursor.keyRelease(java.awt.event.KeyEvent.VK_ESCAPE);
                 pause(1);
           end
       end
   end
   
   
    
    if numr==2
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON1_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK);
        end
        if numb==2
         
           import java.awt.Robot;
           import java.awt.event.*;
           cursor=Robot;
           pause(0.25)
           cursor.mousePress(java.awt.event.InputEvent.BUTTON3_MASK);
           pause(0.5)
           cursor.mouseRelease(java.awt.event.InputEvent.BUTTON3_MASK);
        end
   
   % Threshold Exit
  dxexit1=80; dxexit2=220;
  dyexit1=250; dyexit2=380;
  
  % Trigger
  dxexit=abs(xb-xr);
  dyexit=abs(yb-yr);
  if numb==1 && numr==1 && numg==1
      if xr>xb && yb>yr && yb>yg && xg>xb && xg>xr && yr>yg 
          if dxexit>dxexit1 && dxexit<dxexit2 && dyexit>dyexit1 && dyexit<dyexit2
              break;
          end
      end
  end
     
end
stop(cap);
flushdata(cap);

    case 8
message = sprintf('Thank You Very Much!!! \n Press ok to exit.');
		uiwait(msgbox(message));   
        return;
end

end

	
        
   
   