function [phi_s]=constantsource_potential(x1,z1,x2,z2,g,n,g1)
dx=x2-x1;
dz=z2-z1;
l=sqrt(dx^2+dz^2);
syms g n
T=(1/l)*[dx,-dz;dz,dx];
A=(0.5*g1/pi)*[0.5*log(((g-x1)^2+n^2)/((g-x2)^2+n^2));atan(n/(g-x2))-atan(n/(g-x1))];
U=T*A;
ux=U(1);
uz=U(2);
phi_s=int(uz,'n');