function [ AWS ] = AWSCal(SD,SourceNum,DestinationNum)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Delay=[0 1 1 2 3;
       1 0 2 1 3;
       1 2 0 1 4;
       2 1 1 0 4;
       3 3 4 4 0];
AWS=0;
for s=1:SourceNum
    for d=1:DestinationNum
        if SD(s,d)==1
            AWS=AWS+Delay(s,d);
        end
    end
end
end

