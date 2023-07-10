% range of the model
x_start=-82.5;
x_end=-77;
y_start=37.5;
y_end=40;
z_start=0;
z_end=220000;
% interval of the model
x_itl=0.02;
y_itl=0.02;
z_itl=1000;
x_line=x_start:x_itl:x_end;
y_line=y_start:y_itl:y_end;
z_line=z_start:z_itl:z_end;
NX=length(x_line);
NY=length(y_line);
NZ=length(z_line);
% anomaly setup
mag=0.05;
lenx=0.8;
leny=1;
lenz=60000;
lenz2=60000;
vec1=0.894;
vec2=-0.447;
yshift=0.55;
% allocate array for velo
alpha=[];
beta=[];
rho=[];
fp=fopen('tomography_model.xyz','w');
for i=1:NX
    for j=1:NY
        for k=1:NZ
            [temp_alpha,temp_beta,temp_rho]=sm_ak135(z_line(k)/1000,10);
            % anomal for shallower than 60km only
%             if z_line(k)<40000
                pert=1-mag*sin(pi*(vec1*x_line(i)+vec2*(y_line(j)+yshift))/lenx)*sin(pi*z_line(k)/lenz);
%             elseif z_line(k)>=40000 && z_line(k)<=220000
%                 pert=1+mag*sin(pi*(vec1*x_line(i)+vec2*(y_line(j)+yshift))/lenx)*sin(pi*(-vec2*x_line(i)+vec1*(y_line(j)+yshift))/lenx)*sin(pi*(z_line(k)-35000)/lenz2);
%             else
%                 pert=1;
%             end
            alpha(i,j,k)=temp_alpha*1000*pert;
            beta(i,j,k)=temp_beta*1000*pert;
            rho(i,j,k)=temp_rho*1000*pert;
        end
    end
end
fprintf(fp,'%f %f %f %f %f %f\n',x_start,y_start,z_start,x_end,y_end,-z_end);
fprintf(fp,'%f %f %f\n',x_itl,y_itl,-z_itl);
fprintf(fp,'%d %d %d\n',NX,NY,NZ);
fprintf(fp,'%f %f %f %f %f %f\n',min(min(min(alpha))),max(max(max(alpha))),...
    min(min(min(beta))),max(max(max(beta))),min(min(min(rho))),max(max(max(rho))));
for k=1:NZ
    for j=1:NY
        for i=1:NX
            fprintf(fp,'%f %f %f %f %f %f\n',x_line(i),y_line(j),-z_line(k),alpha(i,j,k),beta(i,j,k),rho(i,j,k));
        end
    end
end
fclose(fp);

%% read StaFile file 
StaFile='./STATIONS';
allsta = struct('name', {}, 'net', {}, 'lon', {}, 'lat', {}, 'elev',{}, 'not_use', {});
i=0;
fstat = fopen(StaFile,'r');
while ~feof(fstat)
    name = fscanf(fstat,'%s',1);
    if ~strcmp(name,'')
        i=i+1;
        allsta(i).name = name;  %station name
        allsta(i).net = fscanf(fstat,'%s',1); %station network
	    allsta(i).lat = fscanf(fstat,'%f',1); %station latitude
        allsta(i).lon = fscanf(fstat,'%f',1); %station longitude
        allsta(i).elev = fscanf(fstat,'%d',1); %station elevation
        allsta(i).not_use = fscanf(fstat,'%f',1); %station elevation
%         temp=fscanf(fstat,'%f',1); %dummy value
    else
        break
    end
    temp = fgetl(fstat);
end
StaNum=length(allsta);
%% plot
%imagesc(beta);
load BWR;
figure;hold on;
imagesc(x_line,y_line,reshape(beta(:,:,120),NX,NY)');
colorbar;colormap(flipud(BWR));
set(gca,'Ydir','normal');
axis equal;
for i=1:StaNum
    plot(allsta(i).lon,allsta(i).lat,'y^','MarkerFaceColor','y');
    text(allsta(i).lon,allsta(i).lat,allsta(i).name);
end
plot([-81.3821,-77.6398],[39.6715,37.8001],'w','LineWidth',1.2);