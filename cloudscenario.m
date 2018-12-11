function [ cloud_delay ] = cloudscenario(SD,SourceNum,DestinationNum)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
DelayToCloud=[3 3 4 4 0];
DelayFromCloud=[3 3 4 4 0];
cloud_delay=0;
for s=1:SourceNum
    for d=1:DestinationNum
        if SD(s,d)==1
            cloud_delay=cloud_delay+DelayToCloud(1,s)+DelayFromCloud(1,d);
        end
    end
end

end

