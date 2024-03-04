function [ flag,pointsb ] = bilinear( oa,ob,oc,od,oe,of,og,oh,eachcell )
%BILINEAR Summary of this function goes here
%   bilinear method on six surface of hex
%   if the number of intersections is sufficient, flag=1

flag=0;
y=repmat(-1,1,2);
count=0;
pointsb=zeros(12,3);

a=oa;b=ob;c=oc;d=od;
A=det([b;d]);B=det([a;d])+det([b;c]);C=det([a;c]);
sur1=roots([A B C]);
if isreal(sur1)
    for i=1:length(sur1(:,1))
        x=sur1(i);
        if x>=0&&x<=1
            y(i)=-(a+b*x)/(c+d*x);
            if y(i)>=0&&y(i)<=1
                count=count+1;
                stu=[x,y(i),0];
                pointsb(count,:)=bincube( eachcell,stu );
            end
        end
    end
end

%surface z=1
a=oa+oe;b=ob+of;c=oc+og;d=od+oh;
A=det([b;d]);B=det([a;d])+det([b;c]);C=det([a;c]);
sur1=roots([A B C]);
if isreal(sur1)
    for i=1:length(sur1(:,1))
        x=sur1(i);
        if x>=0&&x<=1
            y(i)=-(a+b*x)/(c+d*x);
            if y(i)>=0&&y(i)<=1
                count=count+1;
                stu=[x,y(i),1];
                pointsb(count,:)=bincube( eachcell,stu );
            end
        end
    end
end

%surface y=0
a=oa;b=ob;c=oe;d=of;
A=det([b;d]);B=det([a;d])+det([b;c]);C=det([a;c]);
sur1=roots([A B C]);
if isreal(sur1)
    for i=1:length(sur1(:,1))
        x=sur1(i);
        if x>=0&&x<=1
            y(i)=-(a+b*x)/(c+d*x);
            if y(i)>=0&&y(i)<=1
                count=count+1;
                stu=[x,0,y(i)];
                pointsb(count,:)=bincube( eachcell,stu );
            end
        end
    end
end

%surface y=1
a=oa+oc;b=ob+od;c=oe+og;d=of+oh;
A=det([b;d]);B=det([a;d])+det([b;c]);C=det([a;c]);
sur1=roots([A B C]);
if isreal(sur1)
    for i=1:length(sur1(:,1))
        x=sur1(i);
        if x>=0&&x<=1
            y(i)=-(a+b*x)/(c+d*x);
            if y(i)>=0&&y(i)<=1
                count=count+1;
                stu=[x,1,y(i)];
                pointsb(count,:)=bincube( eachcell,stu );
            end
        end
    end
end

%surface x=0
a=oa;b=oc;c=oe;d=og;
A=det([b;d]);B=det([a;d])+det([b;c]);C=det([a;c]);
sur1=roots([A B C]);
if isreal(sur1)
    for i=1:length(sur1(:,1))
        x=sur1(i);
        if x>=0&&x<=1
            y(i)=-(a+b*x)/(c+d*x);
            if y(i)>=0&&y(i)<=1
                count=count+1;
                stu=[0,x,y(i)];
                pointsb(count,:)=bincube( eachcell,stu );
            end
        end
    end
end

%surface x=1
a=oa+ob;b=oc+od;c=oe+of;d=og+oh;
A=det([b;d]);B=det([a;d])+det([b;c]);C=det([a;c]);
sur1=roots([A B C]);
if isreal(sur1)
    for i=1:length(sur1(:,1))
        x=sur1(i);
        if x>=0&&x<=1
            y(i)=-(a+b*x)/(c+d*x);
            if y(i)>=0&&y(i)<=1
                count=count+1;
                stu=[1,x,y(i)];
                pointsb(count,:)=bincube( eachcell,stu );
            end
        end
    end
end

if count>=2
    pointsb=pointsb(1:count,:);
    flag=1;
end

end

