function [ spnum,spindex ] = searchsp( nxyz,btotal )
%SEARCHSP Summary of this function goes here
%   Detailed explanation goes here 1206;
%   step1

Nx=nxyz(1)+1;
Ny=nxyz(2)+1;
Nz=nxyz(3)+1;

all=(Nx-1)*(Ny-1)*(Nz-1);
spindex=zeros(all,3);
bv=zeros(3,8);

spnum=0;
for k=1:Nz-1
    for j=1:Ny-1
        for i=1:Nx-1

            bv(:,1)=btotal(:,i,j,k);
            bv(:,2)=btotal(:,i+1,j,k);
            bv(:,3)=btotal(:,i+1,j,k+1);
            bv(:,4)=btotal(:,i,j,k+1);
            bv(:,5)=btotal(:,i,j+1,k);
            bv(:,6)=btotal(:,i+1,j+1,k);
            bv(:,7)=btotal(:,i+1,j+1,k+1);
            bv(:,8)=btotal(:,i,j+1,k+1);
            
            spfound=0;
            for m=1:7
                for n=1+m:8
                    check=bv(:,m).*bv(:,n);
                    if check(1)<0 || check(2)<0 || check(3)<0
                        spfound=1;
                        spnum=spnum+1;
                        spindex(spnum,:)=[i,j,k];
                        break;
                    end
                  
                end
                if spfound==1
                    break;
                end
            end
            
        end
    end
end
spindex=spindex(1:spnum,:);


end

