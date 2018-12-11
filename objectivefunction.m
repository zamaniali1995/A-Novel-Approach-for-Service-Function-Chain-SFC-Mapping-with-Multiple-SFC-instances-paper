function [F] = objectivefunction(delay,Delta,b,TopoNum,SourceNum,DestinationNum,NumLink,FunNum,V,SD)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    F=zeros(TopoNum+(V*FunNum)+2*(NumLink*SourceNum*DestinationNum),1);
    for Tnum=1:TopoNum
        for s=1:SourceNum
            for d=1:DestinationNum
                if SD(s,d)==1
                    for l=1:NumLink
                        for i=1:FunNum
                            F(Tnum,1)=F(Tnum,1)+(delay(l)*Delta(s,d,Tnum)*b(i,l,Tnum));
                        end
                    end
                end
            end
        end
%         F(i,1)=(Dsd*[1;1;1;1;1])*(Delta(i,:)*[1;1;1;1;1])*([1 1 1 1]*b(:,:,i)*[1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1]);
    end
        
        for l=1:NumLink
            Cnt=0;
            for s=1:SourceNum
                for d=1:DestinationNum
                    Cnt=Cnt+1;
                    if SD(s,d)==1
                        F(TopoNum+(V*FunNum)+(l-1)*(SourceNum*DestinationNum)+Cnt,1)=delay(l);
                        F(TopoNum+(V*FunNum)+(NumLink*SourceNum*DestinationNum)+(l-1)*(SourceNum*DestinationNum)+Cnt,1)=delay(l);
                    end
                end
            end
        end
%         for l=1:NumLink
%             Cnt=0;
%             for s=1:SourceNum
%                 for d=1:DestinationNum
%                     Cnt=Cnt+1;
%                     if SD(s,d)==1
%                         F(TopoNum+(V*FunNum)+2*(NumLink*SourceNum*DestinationNum)+(l-1)*(SourceNum*DestinationNum)+Cnt,1)=delay(l);
%                         F(TopoNum+(V*FunNum)+3*(NumLink*SourceNum*DestinationNum)+(l-1)*(SourceNum*DestinationNum)+Cnt,1)=delay(l);
%                     end
%                 end
%             end
%         end
    end