function [ flag,stu ] = newton( cv )
%NEWTON Summary of this function goes here
%   Detailed explanation goes here
%  step3

%cv=eachcell;

ep=1e-15;
it_max=50000;
% stu=[-1,-1,-1];
flag=0;

% X0=[0,0,0;1,0,0;1,0,1;0,0,1;0,1,0;1,1,0;1,1,1;0,1,1;0.5,0.5,0.5];
% X0=[0.5,0.5,0.5];
initall=1331;
alln=zeros(1,initall);
X0=zeros(initall,3);
num=0;
for zc=1:11
    for tc=1:11
        for sc=1:11
            ss=(sc-1)/10;
            tt=(tc-1)/10;
            uu=(zc-1)/10;
            [ fx,~ ] = equations( [ss,tt,uu],cv );
            num=num+1;
            alln(num)=norm(fx);
            X0(num,:)=[ss,tt,uu];
        end
    end
end            
[nn,ind]=min(alln);
x0=X0(ind,:);
stu=x0;
if nn<ep
    flag=1;
    return;
end

% for ii=1:initall
%     x0=X0(ii,:);
    count=0;
    while count<it_max
        [ FX,dFX ] = equations( x0,cv );
        lu=dFX\FX;
        x=x0'-lu;
        n1=norm(x-x0);
        n2=norm(FX);
        if n1<=ep || n2<=ep
            if x(1)>=0 && x(2)>=0 && x(3)>=0 && x(1)<=1 && x(2)<=1 && x(3)<=1
                flag=1;
                stu=x';
                return;
            end
        end
        if isnan(lu(1))==1||isnan(lu(2))==1||isnan(lu(3))==1
            break;
        end
        x0=x';
        count=count+1;
    end
  
% end



% Vx=x1*(1-s)*(1-t)*(1-u)+x2*s*(1-t)*(1-u)+x3*s*(1-t)*u+x4*(1-s)*(1-t)*u+...
%    x5*(1-s)*t*(1-u)+x6*s*t*(1-u)+x7*s*t*u+x8*(1-s)*t*u;
% Vy=y1*(1-s)*(1-t)*(1-u)+y2*s*(1-t)*(1-u)+y3*s*(1-t)*u+y4*(1-s)*(1-t)*u+...
%    y5*(1-s)*t*(1-u)+y6*s*t*(1-u)+y7*s*t*u+y8*(1-s)*t*u;
% Vz=z1*(1-s)*(1-t)*(1-u)+z2*s*(1-t)*(1-u)+z3*s*(1-t)*u+z4*(1-s)*(1-t)*u+...
%    z5*(1-s)*t*(1-u)+z6*s*t*(1-u)+z7*s*t*u+z8*(1-s)*t*u;

% Vxs=x1*(-1)*(1-t)*(1-u)+x2*(1-t)*(1-u)+x3*(1-t)*u+x4*(-1)*(1-t)*u+...
%     x5*(-1)*t*(1-u)+x6*t*(1-u)+x7*t*u+x8*(-1)*t*u;
% Vys=y1*(-1)*(1-t)*(1-u)+y2*(1-t)*(1-u)+y3*(1-t)*u+y4*(-1)*(1-t)*u+...
%     y5*(-1)*t*(1-u)+y6*t*(1-u)+y7*t*u+y8*(-1)*t*u;
% Vzs=z1*(-1)*(1-t)*(1-u)+z2*(1-t)*(1-u)+z3*(1-t)*u+z4*(-1)*(1-t)*u+...
%     z5*(-1)*t*(1-u)+z6*t*(1-u)+z7*t*u+z8*(-1)*t*u;
% 
% Vxt=x1*(1-s)*(-1)*(1-u)+x2*s*(-1)*(1-u)+x3*s*(-1)*u+x4*(1-s)*(-1)*u+...
%     x5*(1-s)*(1-u)+x6*s*(1-u)+x7*s*u+x8*(1-s)*u;
% Vyt=y1*(1-s)*(-1)*(1-u)+y2*s*(-1)*(1-u)+y3*s*(-1)*u+y4*(1-s)*(-1)*u+...
%     y5*(1-s)*(1-u)+y6*s*(1-u)+y7*s*u+y8*(1-s)*u;
% Vzt=z1*(1-s)*(-1)*(1-u)+z2*s*(-1)*(1-u)+z3*s*(-1)*u+z4*(1-s)*(-1)*u+...
%     z5*(1-s)*(1-u)+z6*s*(1-u)+z7*s*u+z8*(1-s)*u;
% 
% Vxu=x1*(1-s)*(1-t)*(-1)+x2*s*(1-t)*(-1)+x3*s*(1-t)+x4*(1-s)*(1-t)+...
%     x5*(1-s)*t*(-1)+x6*s*t*(-1)+x7*s*t+x8*(1-s)*t;
% Vyu=y1*(1-s)*(1-t)*(-1)+y2*s*(1-t)*(-1)+y3*s*(1-t)+y4*(1-s)*(1-t)+...
%     y5*(1-s)*t*(-1)+y6*s*t*(-1)+y7*s*t+y8*(1-s)*t;
% Vzu=z1*(1-s)*(1-t)*(-1)+z2*s*(1-t)*(-1)+z3*s*(1-t)+z4*(1-s)*(1-t)+...
%     z5*(1-s)*t*(-1)+z6*s*t*(-1)+z7*s*t+z8*(1-s)*t;

% ss=zeros(1,11);tt=zeros(1,11);uu=zeros(1,11);
% stu=0;
% for xc=1:11
%     for yc=1:10
%         for zc=1:10
%             tt=(yc-1)/10;
%             ss=(xc-1)/10;
%             uu=(zc-1)/10;
%             if abs(double(subs(Vx,[s t u],[ss tt uu])))<0.1 &&...
%                abs(double(subs(Vy,[s t u],[ss tt uu])))<0.1 &&...
%                abs(double(subs(Vz,[s t u],[ss tt uu])))<0.1
%            
%                 stu=1;
%                 break;
%             end 
%         end
%         if stu==1
%             break;
%         end
%     end
%     if stu==1
%         break;
%     end
% end
% x0=[ss,tt,uu];

% x0=[0.5,0.5,0.5];




end

