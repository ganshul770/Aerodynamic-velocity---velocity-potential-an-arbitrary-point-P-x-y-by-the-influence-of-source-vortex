close all;
clear all;
clc;

%%
%constant constant source strength
x1=input('enter the panel left edge x co-ordinate = ');
z1=input('enter the panel left edge z co-ordinate = ');
x2=input('enter the panel right edge x co-ordinate = ');
z2=input('enter the panel right edge z co-ordinate = ');
g=input('x co-ordinate of point where you want to calculate any parameter = ');
n=input('z co-ordinate of point where you want to calculate any parameter = ');
g1=input('strength of panel = ');
% g2=input('strength at right edge of panel = ');
% x1=0;z1=0;x2=1;z2=0;g=1;n=1;g1=1;

%%
%velocity at any point P(x,y)
[ux,uz]=constantsource_velolcity(x1,z1,x2,z2,g,n,g1);
vel_fx=matlabFunction(ux);
vel_fz=matlabFunction(uz);
ux_P=vel_fx(g,n);
uz_p=vel_fz(g,n);

x=(x1+x2)/2;
z=-10:0.1:10;
ux=vel_fx(x,z);
uz=vel_fz(x,z);
figure(1)
plot(z,ux);
hold on;
plot(z,uz);
xlabel('--- x and z -->');
ylabel('--- ux and uz -->');
legend('ux','uz');
title('variation of ux,uz along central normal line of panel');

x=x1:0.1:x2;
ux=vel_fx(x,0);
figure(2)
plot(x,ux);
xlabel('--- x -->');
ylabel('--- ux -->');
title('variation of ux at z=0, along panel length');

uz=vel_fz(x,0);
figure(3)
plot(x,uz);
xlabel('--- x -->');
ylabel('--- uz -->');
title('variation of uz at z=0, along panel length');


%%
%potential at a point
[phi_s]=constantsource_potential(x1,z1,x2,z2,g,n,g1);
phi_f=matlabFunction(phi_s);
phi_P=phi_f(g,n);

x=x1:0.1:x2;
phi=phi_f(x,0);
figure(4)
plot(x,phi);
xlabel('--- x -->');
ylabel('--- phi -->');
title('variation of phi at z=0, along panel length');

x=(x1+x2)/2;
z=-10:0.1:10;
phi=phi_f(x,z);
figure(5)
plot(z,phi);
xlabel('--- z -->');
ylabel('--- phi -->');
title('variation of phi along central normal line of panel');
