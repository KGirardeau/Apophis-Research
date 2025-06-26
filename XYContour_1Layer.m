%% Plotting the zero velocity curve XY for 1 Mascon Layer

cd('C:/Users/tewki/Downloads/Summer Research/Data_Apophis');
Mascon_1 = load('Mascon_1_data.dat');
layers_1 = load('points_tetrahedron_center.dat');
tsoulis = load('pot_tsulis.dat');

x1 = tsoulis(:,1);
y1 = tsoulis(:,2);
z1 = Mascon_1(:,2);
a1 = size(Mascon_1);

b1 = a1(:,1);
set(gca,'fontsize',5)
xlin1 = linspace(min(x1),max(x1));
ylin1 = linspace(min(y1),max(y1));
zlin1 = linspace(min(z1),max(z1));
[XX1,YY1] = meshgrid(xlin1,ylin1);
ZZ1 = griddata(x1,y1,z1,XX1,YY1);

x = layers_1(:,1);
y = layers_1(:,2);

% Plot Asteroid in XY plane
unit = 0;

contour(XX1,YY1,-ZZ1*10^(unit),1500);grid off
title('XY Projection of Zero Velocity Curves for 1 Mascon Layer');
strunit = int2str(unit);
cb=colorbar;x1=get(gca,'position');t=get(cb,'Position');t(3)=0.015;set(cb,'Position',t);set(gca,'position',x1);

set(gca,'fontsize',8)
xlabel('X(Km)','FontSize',8);
ylabel('Y(Km)','FontSize',8);
zlabel('V(J)','FontSize',8);

print('equilibrium_xy_1layer','-djpeg');