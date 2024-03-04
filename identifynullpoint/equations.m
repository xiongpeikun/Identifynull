function [ FX,dFX ] = equations( ax,cv )
%EQUATIONS Summary of this function goes here
%   Detailed explanation goes here

s=ax(1,1);t=ax(1,2);u=ax(1,3);

x1=cv(1,1);x2=cv(1,2);x3=cv(1,3);x4=cv(1,4);x5=cv(1,5);x6=cv(1,6);x7=cv(1,7);x8=cv(1,8);
y1=cv(2,1);y2=cv(2,2);y3=cv(2,3);y4=cv(2,4);y5=cv(2,5);y6=cv(2,6);y7=cv(2,7);y8=cv(2,8);
z1=cv(3,1);z2=cv(3,2);z3=cv(3,3);z4=cv(3,4);z5=cv(3,5);z6=cv(3,6);z7=cv(3,7);z8=cv(3,8);

p1=(1-s)*(1-t)*(1-u);p2=s*(1-t)*(1-u);p3=s*(1-t)*u;p4=(1-s)*(1-t)*u;
p5=(1-s)*t*(1-u);p6=s*t*(1-u);p7=s*t*u;p8=(1-s)*t*u;

Vx=[x1,x2,x3,x4,x5,x6,x7,x8]*[p1;p2;p3;p4;p5;p6;p7;p8];
Vy=[y1,y2,y3,y4,y5,y6,y7,y8]*[p1;p2;p3;p4;p5;p6;p7;p8];
Vz=[z1,z2,z3,z4,z5,z6,z7,z8]*[p1;p2;p3;p4;p5;p6;p7;p8];

Vxs=x1*(-1)*(1-t)*(1-u)+x2*(1-t)*(1-u)+x3*(1-t)*u+x4*(-1)*(1-t)*u+...
    x5*(-1)*t*(1-u)+x6*t*(1-u)+x7*t*u+x8*(-1)*t*u;
Vys=y1*(-1)*(1-t)*(1-u)+y2*(1-t)*(1-u)+y3*(1-t)*u+y4*(-1)*(1-t)*u+...
    y5*(-1)*t*(1-u)+y6*t*(1-u)+y7*t*u+y8*(-1)*t*u;
Vzs=z1*(-1)*(1-t)*(1-u)+z2*(1-t)*(1-u)+z3*(1-t)*u+z4*(-1)*(1-t)*u+...
    z5*(-1)*t*(1-u)+z6*t*(1-u)+z7*t*u+z8*(-1)*t*u;

Vxt=x1*(1-s)*(-1)*(1-u)+x2*s*(-1)*(1-u)+x3*s*(-1)*u+x4*(1-s)*(-1)*u+...
    x5*(1-s)*(1-u)+x6*s*(1-u)+x7*s*u+x8*(1-s)*u;
Vyt=y1*(1-s)*(-1)*(1-u)+y2*s*(-1)*(1-u)+y3*s*(-1)*u+y4*(1-s)*(-1)*u+...
    y5*(1-s)*(1-u)+y6*s*(1-u)+y7*s*u+y8*(1-s)*u;
Vzt=z1*(1-s)*(-1)*(1-u)+z2*s*(-1)*(1-u)+z3*s*(-1)*u+z4*(1-s)*(-1)*u+...
    z5*(1-s)*(1-u)+z6*s*(1-u)+z7*s*u+z8*(1-s)*u;

Vxu=x1*(1-s)*(1-t)*(-1)+x2*s*(1-t)*(-1)+x3*s*(1-t)+x4*(1-s)*(1-t)+...
    x5*(1-s)*t*(-1)+x6*s*t*(-1)+x7*s*t+x8*(1-s)*t;
Vyu=y1*(1-s)*(1-t)*(-1)+y2*s*(1-t)*(-1)+y3*s*(1-t)+y4*(1-s)*(1-t)+...
    y5*(1-s)*t*(-1)+y6*s*t*(-1)+y7*s*t+y8*(1-s)*t;
Vzu=z1*(1-s)*(1-t)*(-1)+z2*s*(1-t)*(-1)+z3*s*(1-t)+z4*(1-s)*(1-t)+...
    z5*(1-s)*t*(-1)+z6*s*t*(-1)+z7*s*t+z8*(1-s)*t;

FX=[Vx;Vy;Vz];
dFX=[Vxs,Vxt,Vxu;Vys,Vyt,Vyu;Vzs,Vzt,Vzu];

end

