function [ cube ] = asigncube( xyz, a )
%ASIGNCUBE Summary of this function goes here
%   Detailed explanation goes here
% cube=zeros(3,8);

i=a(1);j=a(2);k=a(3);

cube(:,1)=xyz(:,i,j,k);
cube(:,2)=xyz(:,i+1,j,k);
cube(:,3)=xyz(:,i+1,j,k+1);
cube(:,4)=xyz(:,i,j,k+1);
cube(:,5)=xyz(:,i,j+1,k);
cube(:,6)=xyz(:,i+1,j+1,k);
cube(:,7)=xyz(:,i+1,j+1,k+1);
cube(:,8)=xyz(:,i,j+1,k+1);


end

