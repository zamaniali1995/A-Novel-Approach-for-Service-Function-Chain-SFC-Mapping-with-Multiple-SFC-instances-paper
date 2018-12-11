function [ Dsd,SD,Tfi,nf,C,SLA ,nc] =DefineChain(c,FunNum,SourceNum,DestinationNum)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
Dsd=zeros(SourceNum,DestinationNum,c);
SD=zeros(SourceNum,DestinationNum,c);
C=zeros(c,FunNum);
% Tfi=zeros(FunNum,FunNum,c);
% SourceNum=4; %Cloud is not considered as a source
% DestinationNum=5;
C=[1 2 3 4 5 6];
nc=6;
SD=[1 1 1 1 1;
    1 1 1 1 1;
    1 1 1 1 1;
    1 1 1 1 1];
Dsd=[1 1 1 1 1;
     1 1 1 1 1;
     1 1 1 1 1;
     1 1 1 1 1];
SLA=[1000 1000 1000 1000 1000 ;
     1000 1000 1000 1000 1000;
     1000 1000 1000 1000 1000;
     1000 1000 1000 1000 1000];
%%%%%%%%%%%%%%%%%%%%%%%
% check=0;
% for k=1:c
%     while check<5
%     for i=1:SourceNum
%         if check==5
%             break;
%         end
%         for j=1:DestinationNum
%             SD(i,j,k)=floor(rand*2);
%             if SD(i,j,k)==1
%                 Dsd(i,j,k)=1;
%                 check=check+1;
%             end
%             SD(SourceNum-i+1,DestinationNum-j+1,k)=floor(rand*2);
%             if SD(SourceNum-i+1,DestinationNum-j+1,k)==1
%                 Dsd(SourceNum-i+1,DestinationNum-j+1,k)=1;
%                 check=check+1;
%             end
%             if check==5
%                 break;
%             end
%         end
%     end
%     end
% end
% check=0;
% while check==0
% for i=1:c
%     for j=1:FunNum
%         C(i,j)=floor(rand*2);
%         check=check+1;
%     end
% end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%f=1  ----->  NAT
%%f=2  ----->  FW
%%f=3  ----->  VOC
%%f=4  ----->  WOC
%%f=5  ----->  IDPS
%%f=6  ----->  TM
Tfi=[1 0 0 0 0 0 0 0 0 0;
     0 1 0 0 0 0 0 0 0 0; 
     0 0 1 0 0 0 0 0 0 0;
     0 0 0 1 0 0 0 0 0 0;
     0 0 0 0 1 0 0 0 0 0;
     0 0 0 0 0 1 0 0 0 0;
     0 0 0 0 0 0 1 0 0 0;
     0 0 0 0 0 0 0 1 0 0;
     0 0 0 0 0 0 0 0 1 0;
     0 0 0 0 0 0 0 0 0 1];
nf=[1 1 0.001 0.002 0.001 0.001];  

end

