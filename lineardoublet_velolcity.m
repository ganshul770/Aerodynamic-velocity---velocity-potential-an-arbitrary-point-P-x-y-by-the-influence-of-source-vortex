function [ux,uz]=lineardoublet_velolcity(x1,z1,x2,z2,g,n,g1,g2)
dx=x2-x1;
dz=z2-z1;
l=sqrt(dx^2+dz^2);
syms g n
T=(1/l)*[dx,-dz;dz,dx];
a=-(atan2(n,(g-x2))-atan2(n,(g-x1)));
b=n/((g-x1)^2+n^2);
c=n/((g-x2)^2+n^2);
d=(g-x1)/((g-x1)^2+n^2);
e=(g-x2)/((g-x2)^2+n^2);
f=-(0.5*log(((g-x2)^2+n^2)/((g-x1)^2+n^2)));
D=(1/(2*pi))*[-b+c-a-x2*c+x1*b,-(-a-x2*c+x1*b);d-e-f-x1*d+x2*e,-(-f-x1*d+x2*e)]*[g1,g2]';
% A=[-(g1/(2*pi))*(n/((g-x1)^2+n^2)-n/((g-x2)^2+n^2))+((g2-g1)/(2*pi))*(-(atan2(n,(g-x2))-atan2(n,(g-x1)))+(x2*n/((g-x2)^2+n^2))-(x1*n/((g-x1)^2+n^2)));(g1/(2*pi))*((g-x1)/((g-x1)^2+n^2)-(g-x2)/((g-x2)^2+n^2))+((g2-g1)/(2*pi))*(-(0.5*log(((g-x2)^2+n^2)/((g-x1)^2+n^2)))+(x1*(g-x1)/((g-x1)^2+n^2))-(x2*(g-x2)/((g-x2)^2+n^2)))];
U=T*D;%U=T*A
ux=U(1);
uz=U(2);