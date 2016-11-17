clc ; clear all;
global dim Num BWh Thr Tmp flag;
dim = 3;Num = 20;BWh =14.5;Thr=0.0000001;flag=0;
Tmp=ones(1,3);
fileform = 'C:\Users\Yuanlin\Desktop\workspace\trainPic\*.jpg';
filepathsrc = 'C:\Users\Yuanlin\Desktop\workspace\trainPic\';
TestPic = imread('C:\Users\Yuanlin\Desktop\workspace\frame_0777.jpg');
TestPic =double(TestPic);
file = dir(fileform);
[SumRow,SumList,s] = size(TestPic); 
for i = 1:length(file)
        TrainPic{i} = imread([filepathsrc, file(i).name]);
       TrainPic{i}= double(TrainPic{i});
end
 
for R=1:SumRow
    for L=1:SumList     
          for i=1:Num
              Trains = TrainPic{i};              
              for j = 1:dim
                dvel(R,L,j) = (TestPic(R,L,j) - Trains(R,L,j));  
                st=power( dvel(R,L,j)/BWh,2);
                if  (st>=1)  st =1;flag = 1;end; 
%                 else flag = 0;end;               
                mp(j)= 1- st;                               
              end
          gt(i)=prod(mp);         
         end
     su(R,L) = sum(gt);
%      if flag==1 su(R,L)=0;end;
     Pr(L,R)=15*su(R,L)/(8*3.14*20*BWh^3);
     if Pr(L,R)>Thr   Twv(R,L)=0;
     else Twv(R,L)=1;
    
     end
    end

end                                                                                 
figure(1);imshow(Twv);
x=1:SumRow;y=1:SumList;
z=Pr(y,x);
figure(2);mesh(x,y,z); 
