close all;
clear all;
clc;

%%
%
u0=1;
N=input('number of panel = ');
g=input('x co-ordinate of point where you want to calculate any parameter = ');
n=input('z co-ordinate of point where you want to calculate any parameter = ');
% g=1;n=1;
ux_n=0;
uz_n=0;
for i=1:N
    x1=input('enter the panel left edge x co-ordinate = ');
    z1=input('enter the panel left edge z co-ordinate = ');
    x2=input('enter the panel right edge x co-ordinate = ');
    z2=input('enter the panel right edge z co-ordinate = ');
    g1=input('strength at left edge of panel = ');
    g2=input('strength at right edge of panel = ');
    fprintf('\n');
    [ux,uz]=linearsource_velolcity(x1,z1,x2,z2,g,n,g1,g2);
    ux=ux+ux_n;
    ux_n=ux;
    uz=uz+uz_n;
    uz_n=uz;
end
vel_fx=matlabFunction(ux);
vel_fz=matlabFunction(uz);
ux_P=u0+vel_fx(g,n);
uz_p=vel_fz(g,n);

%enter the edge coordinate of panel where you wanted to findout normal and
%tangential velocity
fprintf('enter the edge coordinate of panel where you wanted to findout normal and tangential velocity \n');
x1=input('enter the panel left edge x co-ordinate = ');
z1=input('enter the panel left edge z co-ordinate = ');
x2=input('enter the panel right edge x co-ordinate = ');
z2=input('enter the panel right edge z co-ordinate = ');
xc=(x1+x2)/2;
zc=(x1+x2)/2;
dx=x2-x1;
dz=z2-z1;
l=sqrt(dx^2+dz^2);
ux_Pc=u0+vel_fx(xc,zc);
uz_pc=vel_fz(xc,zc);
u_n=[ux_Pc,uz_pc]*[dz/l,dx/l]';
u_t=[ux_Pc,uz_pc]*[dx/l,-dz/l]';


