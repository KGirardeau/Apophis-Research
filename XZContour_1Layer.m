%% Plotting the zero velocity curve XZ for 1 Mascon Layer

x1 = x_cube_flat;
z1 = z_cube_flat;
y1 = pseudo_cube_flat_1;
a1 = size(pseudo_cube_flat_1);

b1 = a1(:,1);
set(gca,'fontsize',5)
xlin1 = linspace(min(x1),max(x1));
ylin1 = linspace(min(y1),max(y1));
zlin1 = linspace(min(z1),max(z1));
[XX1,ZZ1] = meshgrid(xlin1,zlin1);
YY1 = griddata(x1,z1,y1,XX1,ZZ1);

unit = 0;

figure(1); 
contour(XX1,ZZ1,-YY1*10^(unit),1500);grid off
title('XZ Projection of Zero Velocity Curves for 1 Mascon Layer');
strunit = int2str(unit);
cb=colorbar;x1=get(gca,'position');t=get(cb,'Position');t(3)=0.015;set(cb,'Position',t);set(gca,'position',x1);

set(gca,'fontsize',8)
xlabel('X(Km)','FontSize',8);
ylabel('Z(Km)','FontSize',8);
zlabel('V(J)','FontSize',8);

print('equilibrium_xz_1layer','-djpeg');