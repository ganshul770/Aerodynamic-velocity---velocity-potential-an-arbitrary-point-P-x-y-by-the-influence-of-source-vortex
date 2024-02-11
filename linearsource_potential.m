function [phi_s]=linearsource_potential(x1,z1,x2,z2,g,n,g1,g2)
dx=x2-x1;
dz=z2-z1;
l=sqrt(dx^2+dz^2);
syms g n
T=(1/l)*[dx,-dz;dz,dx];
A=atan(n*l/(g^2+n^2-l*g));
B=0.5*log((n^2+g^2)/((g-l)^2+n^2));
p=[(l-g)*B-n*A+l,n*A+g*B-l;n*B+(l-g)*A,-n*B+g*A];
P=(1/(2*pi*l))*T*p;
U=P*[g1,g2]';
ux=U(1);
uz=U(2);
phi_s=int(uz,'n');