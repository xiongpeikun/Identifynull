function [ nullflag ] = trilinear( eachcell,eachcord )
%TRILINEAR Summary of this function goes here
%   Detailed explanation goes here

nullflag=0;
pairxy=0;
pairyz=0;
pairxz=0;

origin=[0;0;0];%earth coordinate
for i=1:8 % Omit computation very close around earth
    len=norm(eachcord(:,i)-origin);
    if len<3.5
        return;
    end
end

f000=eachcell(:,1); f100=eachcell(:,2); f101=eachcell(:,3); f001=eachcell(:,4);
f010=eachcell(:,5); f110=eachcell(:,6); f111=eachcell(:,7); f011=eachcell(:,8);
oa=f000;ob=f100-f000;oc=f010-f000;od=f110-f100-f010+f000; 
oe=f001-f000;of=f101-f100-f001+f000;og=f011-f010-f001+f000;
oh=f111-f110-f101-f001+f100+f010+f001-f000;

a=oa(1:2,:)';b=ob(1:2,:)';c=oc(1:2,:)';d=od(1:2,:)';e=oe(1:2,:)';f=of(1:2,:)';
g=og(1:2,:)';h=oh(1:2,:)'; %bx=by=0
[flagxy,bxy] = bilinear( a,b,c,d,e,f,g,h,eachcell );
if flagxy==1
    bz=bxy(:,3);
    if length(find(bz>0))~=length(bz)
        pairxy=1;
    end
end

a=[oa(1),oa(3)];b=[ob(1),ob(3)];c=[oc(1),oc(3)];d=[od(1),od(3)];
e=[oe(1),oe(3)];f=[of(1),of(3)];g=[og(1),og(3)];h=[oh(1),oh(3)]; %bx=bz=0
[flagxz,bxz] = bilinear( a,b,c,d,e,f,g,h,eachcell );
if flagxz==1
    by=bxz(:,2);
    if length(find(by>0))~=length(by)
        pairxz=1;
    end
end

a=oa(2:3,:)';b=ob(2:3,:)';c=oc(2:3,:)';d=od(2:3,:)';e=oe(2:3,:)';f=of(2:3,:)';
g=og(2:3,:)';h=oh(2:3,:)';  %by=bz=0
[flagyz,byz] = bilinear( a,b,c,d,e,f,g,h,eachcell );
if flagyz==1
    bx=byz(:,1);
    if length(find(bx>0))~=length(bx)
        pairyz=1;
    end
end

if pairxy==1&&pairxz==1&&pairyz==1
    nullflag=1;
end


end

