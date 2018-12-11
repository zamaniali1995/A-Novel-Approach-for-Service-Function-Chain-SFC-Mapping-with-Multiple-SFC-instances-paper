function [ f ]=NumFunInEachChain(C,FunNum)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
f=zeros(C,1);
for i=1:C
    f(i)=ceil(rand*FunNum);
end

end

