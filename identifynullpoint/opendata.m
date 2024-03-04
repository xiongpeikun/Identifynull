Nx=241;
Ny=161;
Nz=161;
xyz=zeros(3,Nx,Ny,Nz);
rho=zeros(1,Nx,Ny,Nz);
current=zeros(3,Nx,Ny,Nz);
btotal=zeros(3,Nx,Ny,Nz);
p=zeros(1,Nx,Ny,Nz);
moment=zeros(3,Nx,Ny,Nz);
v=zeros(3,Nx,Ny,Nz);

% jumpdata=349829876*1;  %1-36

fid=fopen('magnetosphere_cube2.t01','r');
% fseek(fid,0,'bof');
% ftell(fid);

% fseek(fid,jumpdata,'bof');

h0=fread(fid,1,'float32');%4

time=fread(fid,1,'float32');%4

h=fread(fid,2,'float32');%8
for k=1:Nz
    for j=1:Ny
        for i=1:Nx
            xyz(:,i,j,k)=fread(fid,3,'float32'); %74963548  12
        end
    end
end
h1=fread(fid,2,'float32');
% fclose(fid);

for k=1:Nz
    for j=1:Ny
        for i=1:Nx
            rho(:,i,j,k)=fread(fid,1,'float32');
        end
    end
end
h2=fread(fid,2,'float32');

for k=1:Nz
    for j=1:Ny
        for i=1:Nx
            current(:,i,j,k)=fread(fid,3,'float32');
        end
    end
end
h3=fread(fid,2,'float32');

for k=1:Nz
    for j=1:Ny
        for i=1:Nx
            btotal(:,i,j,k)=fread(fid,3,'float32');
        end
    end
end
h4=fread(fid,2,'float32');

for k=1:Nz
    for j=1:Ny
        for i=1:Nx
            p(:,i,j,k)=fread(fid,1,'float32');
        end
    end
end
h5=fread(fid,2,'float32');


for k=1:Nz
    for j=1:Ny
        for i=1:Nx
            moment(:,i,j,k)=fread(fid,3,'float32');
        end
    end
end
h6=fread(fid,1,'float32');
% fseek(fid,349829876,'bof');


time2=fread(fid,4,'float32');

fclose(fid);
for k=1:Nz
    for j=1:Ny
        for i=1:Nx
            v(:,i,j,k)=moment(:,i,j,k)./rho(:,i,j,k);
        end
    end
end

