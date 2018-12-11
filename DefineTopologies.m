function [ Delta,b,a,Cnta111 ] =DefineTopologies(Chains,V,FunNum,ChainNum,SD,SourceNum,DestinationNum,NumLink)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Delta=[1 0 0 0 1;
%        1 1 0 0 0;
%        0 0 1 1 0;
%        0 1 0 0 0;
%        0 1 0 1 0;
%        1 1 1 0 1;
%        1 1 0 1 1;
%        1 0 1 1 1;
%        0 1 1 1 0;
%        1 1 1 0 1;];
% b(:,:,1)=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0]; 
% b(:,:,2)=[0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0];      
% b(:,:,3)=[0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0]; 
% b(:,:,4)=[0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0;
%           0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
% b(:,:,5)=[0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
% b(:,:,6)=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0]; 
% b(:,:,7)=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1]; 
% b(:,:,8)=[0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0]; 
% b(:,:,9)=[1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 1 1 1 0]; 
% b(:,:,10)=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%            1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
%            0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0;
%            0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 

One=zeros(1,FunNum);
Cnt=0;
%% Creat a matrix
for CN=1:ChainNum
    Cnt=Cnt+1;
    OneNum=1;
    a(:,:,Cnt)=zeros(V,FunNum);
    for i=1:FunNum
        if Chains(CN,i)~=0
            a(1,i,Cnt)=1; 
        end   
    end
%     a(1,:,Cnt)=Chains(CN,:); 
    Var=a(:,:,Cnt);
    for k=1:FunNum
        if a(1,k,Cnt)==1
            One(OneNum)=k;
            OneNum=OneNum+1;
        end
    end
    OneNum=OneNum-1;
    Var2=OneNum;
    while  OneNum>0 
        for j=1:(V-1)
            if a(j,One(OneNum),Cnt)==1
                F=j;
                break;
            end
        end
        while F<V
            a(:,:,Cnt+1)=Var;
            Cnt=Cnt+1;
            a(F,One(OneNum),Cnt)=0;
            a(F+1,One(OneNum),Cnt)=1; 
            Var=a(:,:,Cnt);
            s=OneNum;
            for d=1:Var2
                if (Var(V,One(d)))==1 
                    Check=0;
                    for r=d:Var2
                        if (Var(V,One(r)))==0
                            Check=1;
                        end
                    end
                    if Check==0
                        Var(V,One(d))=0;
                        Var(1,One(d))=1;
                        OneNum=OneNum-1;
                    end
                end
            end
            if s~=OneNum
                break;
            end
            if OneNum~=Var2
               OneNum=Var2; 
               break;
            end
            F=F+1;
        end
    end
end

%%  Creat b matrix

%path from each node to other node
x(:,:,1)=[0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x(:,:,V*(1)+(1)+1)=[0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x(:,:,V*(1)+(2)+1)=[0 0 0 0 0 0 0 0 0 0 0 1 0 0;
     0 0 0 0 0 1 1 0 0 0 0 0 0 0;
     1 1 1 0 0 0 0 0 0 0 0 0 0 0;
     0 0 1 0 0 0 0 0 0 0 1 0 0 0
     0 0 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x(:,:,V*(1)+(3)+1)=[1 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 1 0 1 0 0 0;
                    0 0 0 0 0 0 0 0 1 1 0 1 0 0;
                    0 0 0 0 0 1 1 0 1 1 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x(:,:,V*(1)+(4)+1)=[1 1 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 1 0 0 0;
                    0 0 0 0 0 0 0 0 0 1 0 1 0 0;
                    0 0 0 0 0 1 1 0 0 1 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x(:,:,V*(1)+(5)+1)=[0 0 0 0 0 1 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 1 0 1;
                    0 0 1 0 0 0 0 0 0 0 1 0 0 1;
                    1 1 1 0 0 0 0 0 0 0 0 0 0 1;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x(:,:,V*(2)+(1)+1)=[0 0 0 0 1 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 1 1;
                    0 0 0 0 0 0 0 1 1 1 0 0 0 0;
                    0 0 0 1 0 0 0 0 0 1 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x(:,:,V*(2)+(2)+1)=[0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
x(:,:,V*(2)+(3)+1)=[0 0 0 0 0 0 0 0 1 1 0 0 0 0;
                    1 0 0 0 1 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 1 0 0 0 1 0 1 0 0 0;
                    1 0 0 0 0 0 0 0 0 0 0 0 1 1;
                    0 0 0 0 0 0 0 0 1 0 1 0 1 1;
                    1 0 0 1 0 0 0 0 0 1 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];  
x(:,:,V*(2)+(4)+1)=[0 0 0 0 0 0 0 0 0 1 0 0 0 0;
                    0 0 0 0 1 0 0 0 0 0 1 0 0 0;
                    1 1 0 0 1 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 1 0 1 1;
                    1 1 0 0 0 0 0 0 0 0 0 0 1 1;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
x(:,:,V*(2)+(5)+1)=[0 0 0 0 0 0 0 0 0 0 0 0 0 1;
                    0 0 0 0 1 1 0 0 0 0 0 0 0 0;
                    0 0 0 1 0 1 0 0 0 1 0 0 0 0;
                    0 0 0 0 0 1 0 1 1 1 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x(:,:,V*(3)+(1)+1)=[0 0 0 0 0 0 0 1 0 0 0 0 0 0;
                    0 1 0 1 0 0 0 0 0 0 0 0 0 0;
                    0 1 1 0 1 0 0 0 0 0 0 0 0 0;
                    0 1 1 0 0 0 0 0 0 0 0 0 1 1;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x(:,:,V*(3)+(2)+1)=[0 1 1 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 1 0 0 0 1 0 0;
                    0 1 0 1 0 0 0 0 0 0 0 1 0 0;
                    0 0 0 0 0 1 1 1 0 0 0 0 0 0;
                    0 1 0 1 0 1 1 0 0 0 0 0 0 0;
                    0 0 1 0 0 0 0 1 0 0 1 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];  
x(:,:,V*(3)+(3)+1)=[0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];  
x(:,:,V*(3)+(4)+1)=[0 1 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 1 0 0 1 0 0 0;
                    0 0 0 0 0 0 0 1 0 1 0 1 0 0;
                    0 0 0 0 0 1 1 1 0 1 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x(:,:,V*(3)+(5)+1)=[0 0 0 0 0 1 0 1 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 1 0 0 0 1 0 1;
                    0 0 1 0 0 0 0 1 0 0 1 0 0 1;
                    0 1 1 0 0 0 0 0 0 0 0 0 0 1;
                    0 1 1 0 1 1 0 0 0 0 0 0 0 0;
                    0 1 0 1 0 1 0 0 0 0 0 0 0 0;
                    0 1 0 1 0 0 0 0 0 0 0 1 0 1]; 
x(:,:,V*(4)+(1)+1)=[0 0 0 1 0 0 0 1 0 0 0 0 0 0;
                    0 0 0 1 0 0 0 0 0 0 0 0 0 0;
                    0 0 1 0 1 0 0 0 0 0 0 0 0 0;
                    0 0 1 0 0 0 0 0 0 0 0 0 1 1;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
x(:,:,V*(4)+(2)+1)=[0 0 1 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 1 0 0 0 0 0 0 0 1 0 0;
                    0 0 0 0 0 0 0 1 1 0 0 1 0 0;
                    0 0 0 1 0 1 1 0 0 0 0 0 0 0;
                    0 0 0 0 0 1 1 1 1 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x(:,:,V*(4)+(3)+1)=[0 0 0 0 0 0 0 0 1 0 0 0 0 0;
                    1 0 0 1 0 0 0 0 0 0 0 0 0 0;
                    1 0 1 0 1 0 0 0 0 0 0 0 0 0;
                    1 0 1 0 0 1 1 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
x(:,:,V*(4)+(4)+1)=[0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0];  
x(:,:,V*(4)+(5)+1)=[0 0 1 0 0 0 0 0 0 0 0 0 0 1;
                    0 0 1 0 1 1 0 0 0 0 0 0 0 0;
                    0 0 0 1 0 1 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 1 0 1 1 0 0 0 0 0;
                    0 0 0 0 0 0 0 1 1 0 0 1 0 1;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
x(:,:,V*(5)+(1)+1)=[0 0 0 0 0 0 0 0 0 0 0 0 1 0;
                    0 0 0 0 1 0 1 0 0 0 0 0 0 0;
                    0 0 0 1 0 0 1 0 0 1 0 0 0 0;
                    0 0 0 0 0 0 1 1 1 1 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
x(:,:,V*(5)+(2)+1)=[0 0 0 0 0 0 1 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 1 1 0;
                    0 0 0 1 0 1 0 0 0 1 0 0 0 0;
                    1 1 1 0 0 0 0 0 0 0 0 0 1 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
x(:,:,V*(5)+(3)+1)=[1 0 0 0 0 0 0 0 0 0 0 0 1 0;
                    1 0 0 0 1 0 1 0 0 0 0 0 0 0;
                    1 0 0 1 0 0 1 0 0 1 0 0 0 0;
                    0 0 0 0 0 0 1 0 1 1 0 0 0 0;
                    0 0 0 0 0 0 0 0 1 1 0 1 1 0;
                    0 0 0 0 0 0 0 0 1 0 1 0 1 0;
                    0 0 0 0 1 0 1 0 1 0 1 0 0 0]; 
x(:,:,V*(5)+(4)+1)=[0 0 0 0 0 0 1 0 0 1 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 1 0 1 1 0;
                    0 0 0 0 0 0 0 0 0 0 1 0 1 0;
                    1 1 0 0 0 0 0 0 0 0 0 0 1 0;
                    1 1 0 0 1 0 1 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];  
x(:,:,V*(5)+(5)+1)=[0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0];  
MaxNumPath=7; 
% NumLink=14;
Numa=Cnt;
FunPlace=zeros(1,FunNum);
Cntb=1;
Cntb1=1;
for i=1:Numa
    Cnt1=1;
    Var2=a(:,:,i);
    b(:,:,i)=zeros(FunNum,NumLink);
    for j=1:FunNum
        for k=1:V
           if Var2(k,j)==1
               FunPlace(1,Cnt1)=k;
               Cnt1=Cnt1+1;
           end
        end
    end
    Cnt1=Cnt1-1;
    for j=1:Cnt1-1
        for k=1:NumLink
%             if x(1,k,V*(FunPlace(1,j))+(FunPlace(1,j+1))+1)==1
%                 if k<6 
                    b(j,k,i)=x(1,k,V*(FunPlace(1,j))+(FunPlace(1,j+1))+1);
%                 else
%                     b(j,k,Cntb)=100;
%                 end
       
%             end
        end
    end
    Var3=b(:,:,i);
    Var4=zeros(MaxNumPath,Cnt1);
    Var4(1,:)=ones(1,Cnt1);
    s=Cnt1-1;
    Cntb1=Cntb1+1;
    while s>0
        for w=1:MaxNumPath
            if Var4(w,s+1)==1
               k=w; 
               break;
            end
        end
    
    while (k<MaxNumPath)
        Var4(k,s+1)=0;
        Var4(k+1,s+1)=1;
        Check=0;
        for e=1:NumLink
            if x(k+1,e,V*(FunPlace(1,s))+(FunPlace(1,s+1))+1)~=0
                Check=1;
                break;
            end
        end
        if Check==1
            b(:,:,Numa+Cntb)=Var3;
            b(s,:,Numa+Cntb)=zeros(1,NumLink);
        
%                     Check=0;
                    
        for j=1:NumLink
%             if x(k+1,j,V*(FunPlace(1,s))+(FunPlace(1,s+1))+1)==1
%                 if j<6 
                    b(s,j,Cnt+Cntb)=x(k+1,j,V*(FunPlace(1,s))+(FunPlace(1,s+1))+1);
%                     Check=1;
%                 else
%                     b(s,j,Cnt+Cntb)=100;
% %                     Check=1;
%                 end
%             end
        end
        Var3=b(:,:,Numa+Cntb);
        a(:,:,Numa+Cntb)=Var2;
        Cntb=Cntb+1;
        end
%         Var3=b(:,:,Cnt+Cntb);
%         a(:,:,Cnt+Cntb)=Var2;
    if k==MaxNumPath-1
        Var4(1,s+1)=1;
        Var4(MaxNumPath,s+1)=0;
        Var3(s,:)=x(1,:,V*(FunPlace(1,s))+(FunPlace(1,s+1))+1);
        s=s-1;
        break;
    end
    if s~=Cnt1-1 && Check==1
        s=Cnt1-1;
        break;
    end
%     if  Check==0 &&  k~=MaxNumPath-1
%         s=s-1;
%     end
    k=k+1;
%     if Check==1
%         Cntb=Cntb+1;
%     end
    end
    end
end
%% Creat Delta matrix


Numab=Cnt+Cntb-1;


%         Check1=0;
% Var2=zeros(1,SDnum);
Cntdelta=1;
Check=0;
SourceNum=4; %Cloud is not considered as a source
DestinationNum=5;
SDnum=0;
UserPlace=zeros(2,SourceNum*DestinationNum);

%                 if Cntdelta==(2^SDnum)-1
%                 break;
% 
%             end
    for j=1:SourceNum
        for k=1:DestinationNum
            if SD(j,k)==1
                SDnum=SDnum+1;
                UserPlace(1,SDnum)=j;
                UserPlace(2,SDnum)=k;
            end
        end
    end
Delta=zeros(SourceNum,DestinationNum,Numab+(2^SDnum)-2); 
for i=1:Numab
    Var5=a(:,:,i);
    Var6=b(:,:,i);   
     Cntdelta=1;   
Var3=zeros(1,SDnum);
%             Var2=zeros(SourceNum,DestinationNum);
%             Delta(:,:,i)=zeros(SourceNum,DestinationNum);
            Delta(UserPlace(1,1),UserPlace(2,1),i)=1;
    for j=1:SDnum
        sum=0;
        Var2=zeros(SourceNum,DestinationNum);
        for k=1:j
            Var2(UserPlace(1,k),UserPlace(2,k))=1;
            Var3(1,k)=k;
        end
        if j~=1
          if i==1
                Delta(:,:,Numab+Cntdelta)=Var2;
                a(:,:,Numab+Cntdelta)=Var5;
                b(:,:,Numab+Cntdelta)=Var6;
          else
              sum=0;
              for g=2:i
                  sum=(2^SDnum)-2+sum;
              end
                Delta(:,:,Numab+sum+Cntdelta)=Var2;
                a(:,:,Numab+sum+Cntdelta)=Var5;
                b(:,:,Numab+sum+Cntdelta)=Var6;
                
          end
            Cntdelta=Cntdelta+1;
        end
        sum=0;
        z=j;
%         z=s-1;
        s=j;
        
        while z>0 
            s=Var3(1,z);
            if Cntdelta==(2^SDnum)-1
                z=0;
                break;
            end
%             Var3(1,s)=Var3(1,s)+1;
%             z=z+1;
            for k=s:SDnum-1
                Var2(UserPlace(1,k),UserPlace(2,k))=0;
                Var2(UserPlace(1,k+1),UserPlace(2,k+1))=1;
                if i==1
                Delta(:,:,Numab+Cntdelta)=Var2;
                a(:,:,Numab+Cntdelta)=Var5;
                b(:,:,Numab+Cntdelta)=Var6;
          else
              sum=0;
              for g=2:i
                  sum=(2^SDnum)-2+sum;
              end
                Delta(:,:,Numab+sum+Cntdelta)=Var2;
                a(:,:,Numab+sum+Cntdelta)=Var5;
                b(:,:,Numab+sum+Cntdelta)=Var6;
                Cntall=Numab+sum+Cntdelta+1;
          end
                Cntdelta=Cntdelta+1;
                if k==SDnum-1
                    Var2(UserPlace(1,SDnum),UserPlace(2,SDnum))=0;
                    Var2(UserPlace(1,s+1),UserPlace(2,s+1))=1;
%                     z=s;
%                     z=s+1;
                    Var3(1,z)=Var3(1,z)+1;
                    z=z-1;
%                     z=s+1;
                    break;
                end
                Check=0;
                Check1=0;
%                 if j~=1
                for w=1:j
                    q=j-w+1;
                    Check1=0;
                    Check=0;
                    for y=1:q

                        if Var2(UserPlace(1,SDnum-q+y),UserPlace(2,SDnum-q+y))==0
                            Check=1;
                        else
                            Check1=Check1+1;
                        end
                    end
                    if Check==0
                        z=j-Check1;
                        break;
                    end

                end
%                 end
%                 if Check==j
%                     Check=0;
%                     z=0;
%                     break;
%                 end
%                 if Check>1
%                   z=z-Check;
%                   break;
%                 end
            if j==SDnum
               z=0;
               break;
            end
                if z==0
                    break;
                end
                if  Check==0 
                    for p=1:Check1
                            Var2(UserPlace(1,SDnum-Check1+p),UserPlace(2,SDnum-Check1+p))=0;
                            Var2(UserPlace(1,Var3(1,z)+p+1),UserPlace(2,Var3(1,z)+p+1))=1;
                            Var3(1,j-Check1+p)=Var3(1,z)+p+1;
                    end
                    break;
                end
                if z~=j 
                    Var3(1,z)=Var3(1,z)+1;
                    z=j;
                   
%                     z=z-1;
                    break;
                end
%                 s=s+1;
            end
        end
    end
end
[~,~,Cnta111]=size(a);


% Numab=Cnt+Cntb;
% Cntdelta=1;
% SDnum=0;
% UserPlace=zeros(2,SourceNum*DestinationNum);
%   for j=1:SourceNum
%         for k=1:DestinationNum
%             if SD(j,k)==1
%                 SDnum=SDnum+1;
%                 UserPlace(1,SDnum)=j;
%                 UserPlace(2,SDnum)=k;
%             end
%         end
%   end
% for i=1:Numab
%     Cntdelta=1;
%     Var5=a(:,:,i);
%     Var6=b(:,:,i);
%     Var3=zeros(1,SDnum);
% %     if Cntdelta==(2^SDnum)-1
% %         break;
% %     end
% %     for j=1:SourceNum
% %         for k=1:DestinationNum
% %             if SD(j,k)==1
% %                 SDnum=SDnum+1;
% %                 UserPlace(1,SDnum)=j;
% %                 UserPlace(2,SDnum)=k;
% %             end
% %         end
% %     end
% Delta=zeros(SourceNum,DestinationNum,Numab+(2^SDnum)-2);    
% % Var3=zeros(1,SDnum);
% Delta(:,:,i)=zeros(SourceNum,DestinationNum);
% Delta(UserPlace(1,1),UserPlace(2,1),i)=1;
% for j=1:SDnum
%     Var2=zeros(SourceNum,DestinationNum);
%     for k=1:j
%         Var2(UserPlace(1,k),UserPlace(2,k))=1;
%         Var3(1,k)=k;
%     end
%     if j~=1
%         Delta(:,:,Numab+Cntdelta)=Var2;
%         a(:,:,Numab+Cntdelta)=Var5;
%         b(:,:,Numab+Cntdelta)=Var6;
%         Cntdelta=Cntdelta+1;
%     end
%     z=j;
%     s=j;
%         while z>0 
%             s=Var3(1,z);
%             if Cntdelta==(2^SDnum)-1
%                 z=0;
%                 break;
%             end
%             for k=s:SDnum-1
%                 Var2(UserPlace(1,k),UserPlace(2,k))=0;
%                 Var2(UserPlace(1,k+1),UserPlace(2,k+1))=1;
%                 if i==1
%                 Delta(:,:,Numab+(((i-1)*2^SDnum))+Cntdelta)=Var2;
%                 else
%                     Delta(:,:,Numab+(((i-1)*2^SDnum))+Cntdelta-2)=Var2;
%                 end
%                 Cntdelta=Cntdelta+1;
%                 if k==SDnum-1
%                     Var2(UserPlace(1,SDnum),UserPlace(2,SDnum))=0;
%                     Var2(UserPlace(1,s+1),UserPlace(2,s+1))=1;
%                     Var3(1,z)=Var3(1,z)+1;
%                     z=z-1;
%                     break;
%                 end
%                 Check=0;
%                 Check1=0;
%                 for w=1:j
%                     q=j-w+1;
%                     Check1=0;
%                     Check=0;
%                     for y=1:q
% 
%                         if Var2(UserPlace(1,SDnum-q+y),UserPlace(2,SDnum-q+y))==0
%                             Check=1;
%                         else
%                             Check1=Check1+1;
%                         end
%                     end
%                     if Check==0
%                         z=j-Check1;
%                         break;
%                     end
% 
%                 end
%             if j==SDnum
%                z=0;
%                break;
%             end
%                 if z==0
%                     break;
%                 end
%                 if  Check==0 
%                     for p=1:Check1
%                             Var2(UserPlace(1,SDnum-Check1+p),UserPlace(2,SDnum-Check1+p))=0;
%                             Var2(UserPlace(1,Var3(1,z)+p+1),UserPlace(2,Var3(1,z)+p+1))=1;
%                             Var3(1,j-Check1+p)=Var3(1,z)+p+1;
%                     end
%                     break;
%                 end
%                 if z~=j 
%                     Var3(1,z)=Var3(1,z)+1;
%                     z=j;
%                     break;
%                 end
%             end
%         end
%     end
% % end
% Cntall=Numab+Cntdelta;
% for i=10:Numa
%     Cnt1=1;
%     Var2=a(:,:,i);
%     for j=1:FunNum
%         for k=1:V
%            if Var2(k,j)==1
%                FunPlace(1,Cnt1)=k;
%                Cnt1=Cnt1+1;
%            end
%         end
%     end
% %     for j=1:Cnt1
%         Var3=Cnt1-1;
%         b(:,:,Cntb)=zeros(FunNum,NumLink);
%         for k=1:Cnt1-1
%             for j=1:MaxNumPath
%                 for m=1:NumLink
%                     if x(k,m,V*(FunPlace(1,j))+(FunPlace(1,j+1))+1)==1
%                         if m<6 
%                             b(j,m,Cntb)=1;
%                         else
%                             b(j,m,Cntb)=100;
%                         end
%                         
%                     end
%                 end
%             end
%         end
% end
% for CN=1:ChainNum
%     a(:,:,Cnt)=zeros(V,FunNum);
%     a(1,:,Cnt)=Chains(CN,:);
%     Var=a(:,:,Cnt);
%     r=Cnt;
%     for i=1:FunNum
%         if a(1,i,Cnt)==1
%             for j=1:(V-1)
%                 for k=(i+1):FunNum
%                     if a(1,k,Cnt)==1
%                         for l=1:(V-1)
%                             for m=(k+1):FunNum
%                                 if a(1,m,Cnt)==1
%                                     for n=1:(V-1)
%                                         for o=(m+1):FunNum
%                                             if a(1,o,Cnt)==1
%                                                 for p=1:(V-1)
%                                                     for q=(o+1):FunNum
%                                                         if a(1,q,Cnt)==1
%                                                             for w=1:(V-1)
%                                                     
%                                                     
%                                                             a(:,:,Cnt+1)=Var;
%                                                             Cnt=Cnt+1;
%                                                             a(w,q,Cnt)=0;
%                                                             a(w+1,q,Cnt)=1; 
%                                                             Var=a(:,:,Cnt);
%                                                             if Var(5,q)==1
%                                                                 Var(5,q)=0;
%                                                                 Var(1,q)=1;
%                                                             end
%                                                             end
%                                                         break;
%                                                         end
%                                                     end
%                                                     a(:,:,Cnt+1)=Var; 
%                                                     Cnt=Cnt+1;
%                                                     Var1=Cnt;
%                                                     a(p,o,Cnt)=0;
%                                                     a(p+1,o,Cnt)=1; 
%                                                     Var=a(:,:,Cnt);
%                                                     if Var(5,o)==1
%                                                        Var(5,o)=0;
%                                                        Var(1,o)=1;
%                                                     end
%                                                 end
%                                             break;
%                                             end
%                                         end
%                                         
%                                         a(:,:,Cnt+1)=Var;
%                                         Cnt=Cnt+1;
%                                         a(n,m,Cnt)=0;
%                                         a(n+1,m,Cnt)=1;   
%                                         Var=a(:,:,Cnt);
%                                         if Var(5,o)==1
%                                             Var(5,m)=0;
%                                             Var(1,m)=1;
%                                         end
%                                     end
%                                     break;
%                                 end
%                             end
%                             a(:,:,Cnt+1)=Var;
%                             Cnt=Cnt+1;
%                             u=Cnt;
%                             a(l,k,Cnt)=0;
%                             a(l+1,k,Cnt)=1;
%                             Var=a(:,:,Cnt);
%                         end
%                        break; 
%                     end
%                 end
%                 a(:,:,Cnt+1)=Var;
%                 Cnt=Cnt+1;
%                 r=Cnt;
%                 a(j,i,Cnt)=0;
%                 a(j+1,i,Cnt)=1;
%                 Var=a(:,:,Cnt);
%             end
%             Cnt=Cnt+1;
%             break;
%         end
%     end
%     for k=1:FunNum
%         if Chains(i,k)==1
%             OnesCnt=OnesCnt+1;
%         end
%     end
%     while OnesCnt>0
%         for j=1:FunNum
%             if a(1,j,Cnt)==1
% %                 e=j;
%                 a(1,:,Cnt+1)=Chains(i,:);
%                 for k=1:(V-1)
%                     Cnt=Cnt+1;
%                     a(k,j,Cnt)=0;
%                     a((k+1),j,Cnt)=1;
%                     for l=j+1:FunNum
%                         if a(1,l,Cnt)==1 
%                            a(:,:,Cnt+1)=a(:,:,Cnt);
%                            for n=1:(V-1)
%                                 Cnt=Cnt+1;
%                                 a(n,l,Cnt)=0;
% %                                 a((k+1),j,Cnt)=1;
%                                 a((n+1),l,Cnt)=1;
%                                 a(:,:,Cnt+1)=a(:,:,Cnt);
%                            end
%                         end
%                     end
%                 end
%             end
%         end
%     end
% end
% a(:,:,1)=[1 0 1 0 0 1 1 1 1 0;
%           0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0;
%           ];
% a(:,:,2)=[1 0 1 0 0 1 1 1 0 0;
%           0 0 0 0 0 0 0 0 1 0;
%           0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0;
%           0 0 0 0 0 0 0 0 0 0;
%           ];      
% a(:,:,2)=[0 0 0 0 0;
%           0 0 0 0 0;
%           1 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 1;
%           ];  
% a(:,:,3)=[0 0 0 0 0;
%           0 0 0 0 0;
%           1 0 0 0 0;
%           0 0 0 0 0;
%           0 1 1 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 1 0;
%           0 0 0 0 0;
%           0 0 0 0 1;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0];  
% a(:,:,4)=[0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 1 1 0;
%           0 0 0 0 0;
%           0 1 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           1 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 1;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0];  
% a(:,:,5)=[0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 1 1;
%           0 0 0 0 0;
%           0 0 1 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 1 0 0 0;
%           0 0 0 0 0;
%           1 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0];  
% a(:,:,6)=[0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 1 0 0;
%           0 0 0 0 0;
%           1 1 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 1;
%           0 0 0 0 0;
%           0 0 0 1 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0];  
% a(:,:,7)=[0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 1;
%           0 0 0 0 0;
%           1 1 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 1 0;
%           0 0 0 0 0;
%           0 0 1 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0];  
% a(:,:,8)=[0 0 0 0 0;
%           0 0 0 0 0;
%           0 1 0 0 0;
%           0 0 0 0 0;
%           0 0 1 1 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 1;
%           0 0 0 0 0;
%           1 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0];  
% a(:,:,9)=[0 0 0 0 0;
%           0 0 0 0 0;
%           0 1 1 0 0;
%           0 0 0 0 0;
%           0 0 0 0 1;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           1 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 1 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0;
%           0 0 0 0 0];  
% a(:,:,10)=[0 0 0 0 0;
%            0 0 0 0 0;
%            1 1 0 0 0;
%            0 0 0 0 0;
%            0 0 0 1 0;
%            0 0 0 0 0;
%            0 0 0 0 0;
%            0 0 1 0 0;
%            0 0 0 0 0;
%            0 0 0 0 1;
%            0 0 0 0 0;
%            0 0 0 0 0;
%            0 0 0 0 0;
%            0 0 0 0 0];  
      


end

 