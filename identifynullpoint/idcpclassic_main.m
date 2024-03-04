clear;


Nx=240;   %grid size -1
Ny=160;
Nz=160;

nxyz=[Nx,Ny,Nz];

ep=1e-15;
load 271btotal.mat;load 271xyz.mat;

[ spnum,spindex ] = searchsp( nxyz,btotal ); %searching for potential candidates
cell=zeros(3,8,spnum);
cordv=zeros(3,8,spnum);

parfor spi=1:spnum

    cell(:,:,spi)= asigncube( btotal, spindex(spi,:) );
    cordv(:,:,spi)= asigncube( xyz, spindex(spi,:) );
    
end

nullpoint=zeros(spnum,3);
nullvector=zeros(spnum,3);
nullin=zeros(1,spnum);
nullstu=zeros(spnum,3);

parfor spi=1:spnum %gradient method for searching null points
    eachcell=cell(:,:,spi);
    eachcord=cordv(:,:,spi);
    nullflag = trilinear( eachcell,eachcord );
    if nullflag==1
        [ vflag, stu ] = newton( eachcell );
        if vflag==1
            nullpoint(spi,:) = bincube( eachcord,stu );
            nullstu(spi,:)=stu;
            nullin(spi)=1;
            nullvector(spi,:)=bincube( eachcell,stu );
        end
    end
end

cpnum=0;
for i=1:spnum
    
    if nullin(i)==1
        Ds=zeros(3,3,8);
        ii=spindex(i,1);jj=spindex(i,2);kk=spindex(i,3);
        if (ii>=Nx||ii<=1) || (jj>=Ny||jj<=1) || (kk>=Nz||kk<=1)
            continue;
        end
        Ds(:,:,1)=getjac(btotal,ii,jj,kk);
        Ds(:,:,2)=getjac(btotal,ii+1,jj,kk);
        Ds(:,:,3)=getjac(btotal,ii+1,jj,kk+1);
        Ds(:,:,4)=getjac(btotal,ii,jj,kk+1);
        Ds(:,:,5)=getjac(btotal,ii,jj+1,kk);
        Ds(:,:,6)=getjac(btotal,ii+1,jj+1,kk);
        Ds(:,:,7)=getjac(btotal,ii+1,jj+1,kk+1);
        Ds(:,:,8)=getjac(btotal,ii,jj+1,kk+1);
        stu=nullstu(i,:);
        jtensor = jacobian( stu ,Ds );
        [eigvec,eigval] = eig(jtensor);
        if eigval(1)*eigval(5)>0&&eigval(5)*eigval(9)>0
            continue;
        end
  
        cpnum=cpnum+1;
%         ii=spindex(i,1);jj=spindex(i,2);kk=spindex(i,3);
        nullpoints(cpnum,:)=nullpoint(i,:);
        nullstus(cpnum,:)=nullstu(i,:);
        nullvectors(cpnum,:)=nullvector(i,:);
        nullijk(cpnum,:)=[ii,jj,kk];
    end
end

save('nulldata271','nullijk','nullpoints','nullstus');


