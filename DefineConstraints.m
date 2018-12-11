function [ A,B,Aeq,Beq] = DefineConstraints(Ic,M,a,Tfi,Rf,K,F,V,Delta,b,C,TopoNum,nf,ncore,SD,Dsd,SourceNum,DestinationNum,NumLink,CAP,delay,SLA,nc,wincom,woutcom)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    Rowcnt=1;
    Aeq=zeros(10000,TopoNum+(V*F)+2*(NumLink*SourceNum*DestinationNum));
    Beq=zeros(10000,1);
    ConstraintsNum=C+(F*V)+(F*V)+F+(2*V)+1+V;
    A=zeros(1000,TopoNum+(V*F)+2*(NumLink*SourceNum*DestinationNum));
    B=zeros(1000,1);
%% First Constraints
    for i=1:TopoNum
       A(Rowcnt,i)=1;
    end
    B(Rowcnt,1)=Ic;
%% Second Constraints
    ColumnCnt=0;
    for v=1:V
        for f=1:F
            Rowcnt=Rowcnt+1;
            ColumnCnt=ColumnCnt+1;
            A(Rowcnt,ColumnCnt+TopoNum)=-M;
            B(Rowcnt,1)=0;
            for j=1:(TopoNum)
                for i=1:F
                        if (Tfi(f,i)*a(v,i,j))==1
                            A(Rowcnt,j)=1; 
                        end
                        
                end
            end
        end
    end  

%% Third Constraints 
    ColumnCnt=0;
    for v=1:V
        for f=1:F
            Rowcnt=Rowcnt+1;
            ColumnCnt=ColumnCnt+1;
            B(Rowcnt,1)=0;
            A(Rowcnt,ColumnCnt+TopoNum)=1;
            for j=1:(TopoNum)
                for i=1:F
                    if (Tfi(f,i)*a(v,i,j))==1
                        A(Rowcnt,j)=-1; 
                    end  
                end
            end
        end
    end
    
%% 4th Constraints
    for f=1:F
        Columncnt=TopoNum+f;
        Rowcnt=Rowcnt+1;
        B(Rowcnt,1)=Rf;
        for v=1:V
             A(Rowcnt,Columncnt)=1;  
             Columncnt=(Columncnt+F);
        end
    end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% %% 5th Constraints
%     Columncnt=10;
%     for v=1:V
%         Rowcnt=Rowcnt+1;
%         B(Rowcnt,1)=0;
%         for f=1:F
%             Columncnt=Columncnt+1;
%             A(Rowcnt,Columncnt)=1;
%         end
%         A(Rowcnt,(TopoNum+(V*F))+v)=-M;
%     end
% %% 6th Constraints
%     Columncnt=10;
%     for v=1:V
%         Rowcnt=Rowcnt+1;
%         B(Rowcnt,1)=0;
%         for f=1:F
%             Columncnt=Columncnt+1;
%             A(Rowcnt,Columncnt)=-1;
%         end
%         A(Rowcnt,(TopoNum+(V*F))+v)=1;
%     end
% %% 7th Constraints
%     Rowcnt=Rowcnt+1;
%     B(Rowcnt,1)=K;
%     for v=1:14
%         A(Rowcnt,TopoNum+(V*F)+v)=1;
%     end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% 5th Constraints
    for v=1:V
        Rowcnt=Rowcnt+1;
        B(Rowcnt,1)=ncore(1,v);
        Columncnt=0;
        for i=1:TopoNum
            Columncnt=Columncnt+1;
            for s=1:SourceNum
                for d=1:DestinationNum
                    for f=1:F
                        for j=1:F
                            aaa=A(Rowcnt,Columncnt);
                            A(Rowcnt,Columncnt)= aaa+(Dsd(s,d)*Delta(s,d,i)*Tfi(f,j)*nf(f)*a(v,j,i));
                        end
                    end
                end
            end
        end
        
    end    
%% 5th Constraints
CNTT=0;
Sum=0;
for s=1:SourceNum
    for d=1:DestinationNum
        CNTT=CNTT+1;
        if SD(s,d)==1
            Rowcnt=Rowcnt+1;
            for T=1:TopoNum
                for l=1:NumLink
                    A(Rowcnt,TopoNum+(V*F)+(l-1)*(SourceNum*DestinationNum)+CNTT) = delay(l); 
                    A(Rowcnt,TopoNum+(V*F)+(NumLink*SourceNum*DestinationNum)+(l-1)*(SourceNum*DestinationNum)+CNTT) = delay(l);
                    B(Rowcnt,1)=SLA(s,d);
                    Sum=0;
                    for i=1:V
                        Sum=Sum+b(i,l,T); 
                    end
                    A(Rowcnt,T)=Delta(s,d,T)*Sum*delay(l);
                end
            end
        end
    end
end
%% constraint 10
% for l=1:NumLink
%     Rowcnt=Rowcnt+1;
%     CNTT=0;
%     for s=1:SourceNum
%         for d=1:DestinationNum
%             CNTT=CNTT+1;
%             if SD(s,d)==1
%                 Sum=0;
%                 A(Rowcnt,TopoNum+(V*F)+(l-1)*(SourceNum*DestinationNum)+CNTT) = Dsd(s,d);
%                 A(Rowcnt,TopoNum+(V*F)+(NumLink*SourceNum*DestinationNum)+(l-1)*(SourceNum*DestinationNum)+CNTT) = Dsd(s,d);
%                 B(Rowcnt,1)=CAP(l);
%                 for T=1:TopoNum
%                     for i=1:V
%                         Sum=Sum+b(i,l,T); 
%                     end
%                     A(Rowcnt,T)=Delta(s,d,T)*Sum;
%                 end
%             end
%         end
%     end
% end
%% 9th Constraints
    Rowcnt1=0;
    for s=1:SourceNum
        for d=1:DestinationNum
            if SD(s,d)==1
                Rowcnt1=Rowcnt1+1;
                for i=1:TopoNum
                    if Delta(s,d,i)==1
                        Aeq(Rowcnt1,i)=1;
                        Beq(Rowcnt1,1)=1;
                    end
                end
            end
        end
    end

%% constrant 13
CNTT=0;
for s=1:SourceNum
    for d=1:DestinationNum
        CNTT=CNTT+1;
        if SD(s,d)==1
            Rowcnt1=Rowcnt1+1;
            Beq(Rowcnt1,1)=1;
            for T=1:TopoNum
                Aeq(Rowcnt1,T)=Delta(s,d,T)*a(s,1,T);
            end
            for l=1:NumLink
                if wincom(s,l)==1
                    Aeq(Rowcnt1,TopoNum+(V*F)+(l-1)*(SourceNum*DestinationNum)+CNTT) =1;
                end
            end
        end 
    end
end
%% constrant 16
CNTT=0;
for s=1:SourceNum
    for d=1:DestinationNum
        CNTT=CNTT+1;
        if SD(s,d)==1
            Rowcnt1=Rowcnt1+1;
            Beq(Rowcnt1,1)=1;
            for T=1:TopoNum
                Aeq(Rowcnt1,T)=Delta(s,d,T)*a(d,nc,T);
            end
            for l=1:NumLink
                if woutcom(d,l)==1
                    Aeq(Rowcnt1,TopoNum+(V*F)+(NumLink*SourceNum*DestinationNum)+(l-1)*(SourceNum*DestinationNum)+CNTT) =1;
                end
            end
        end 
    end
end
%% constrant 15
CNTT=0;
for s=1:SourceNum
    for d=1:DestinationNum
        CNTT=CNTT+1;
        if SD(s,d)==1

            for v=1:V
                if v~=s
                    Rowcnt1=Rowcnt1+1;
                    Beq(Rowcnt1,1)=0;
                    for T=1:TopoNum
                        Aeq(Rowcnt1,T)=Delta(s,d,T)*a(v,1,T);
                    end
                    for l=1:NumLink
                        if wincom(v,l)==1
                            Aeq(Rowcnt1,TopoNum+(V*F)+(l-1)*(SourceNum*DestinationNum)+CNTT) =1;
                        end
                        if woutcom(v,l)==1
                            Aeq(Rowcnt1,TopoNum+(V*F)+(l-1)*(SourceNum*DestinationNum)+CNTT) =-1;
                        end
                    end
                end 
            end
        end
    end 
end
%% constrant 14
CNTT=0;
for s=1:SourceNum
    for d=1:DestinationNum
        CNTT=CNTT+1;
        if SD(s,d)==1
            for v=1:V
                if v~=s
                    Rowcnt=Rowcnt+1;
                    B(Rowcnt,1)=0;
                    for T=1:TopoNum
                        A(Rowcnt,T)=Delta(s,d,T)*a(v,1,T);
                    end
                    for l=1:NumLink
                        if woutcom(v,l)==1
                            A(Rowcnt,TopoNum+(V*F)+(l-1)*(SourceNum*DestinationNum)+CNTT) =-1;
                        end
                    end
                end 
            end
        end
    end 
end
%% constrant 18
CNTT=0;
for s=1:SourceNum
    for d=1:DestinationNum
        CNTT=CNTT+1;
        if SD(s,d)==1

            for v=1:V
                if v~=d
                    Rowcnt1=Rowcnt1+1;
                    Beq(Rowcnt1,1)=0;
                    for T=1:TopoNum
                        Aeq(Rowcnt1,T)=Delta(s,d,T)*a(v,nc,T);
                    end
                    for l=1:NumLink
                        if wincom(v,l)==1
                            Aeq(Rowcnt1,TopoNum+(V*F)+(NumLink*SourceNum*DestinationNum)+(l-1)*(SourceNum*DestinationNum)+CNTT) =-1;
                        end
                        if woutcom(v,l)==1
                            Aeq(Rowcnt1,TopoNum+(V*F)+(NumLink*SourceNum*DestinationNum)+(l-1)*(SourceNum*DestinationNum)+CNTT) =1;
                        end
                    end
                end 
            end
        end
    end 
end
%% constrant 17
CNTT=0;
for s=1:SourceNum
    for d=1:DestinationNum
        CNTT=CNTT+1;
        if SD(s,d)==1
            for v=1:V
                if v~=d
                    Rowcnt=Rowcnt+1;
                    B(Rowcnt,1)=0;
                    for T=1:TopoNum
                        A(Rowcnt,T)=Delta(s,d,T)*a(v,nc,T);
                    end
                    for l=1:NumLink
                        if wincom(v,l)==1
                            A(Rowcnt,TopoNum+(V*F)+(NumLink*SourceNum*DestinationNum)+(l-1)*(SourceNum*DestinationNum)+CNTT) =-1;
                        end
                    end
                end 
            end
        end
    end 
end
end