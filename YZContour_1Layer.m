%% Plotting the zero velocity curve YZ for 1 Mascon Layer

x1 = pseudo_cube_flat_1;
y1 = y_cube_flat;
z1 = z_cube_flat;
a1 = size(pseudo_cube_flat_1);

b1 = a1(:,1);
set(gca,'fontsize',5)
xlin1 = linspace(min(x1),max(x1));
ylin1 = linspace(min(y1),max(y1));
zlin1 = linspace(min(z1),max(z1));
[YY1,ZZ1] = meshgrid(ylin1,zlin1);
XX1 = griddata(y1,z1,x1,YY1,ZZ1);

unit = 0;

contour(YY1,ZZ1,-XX1*10^(unit),1500);grid off
title('YZ Projection of Zero Velocity Curves for 1 Mascon Layer');
strunit = int2str(unit);
cb=colorbar;y1=get(gca,'position');t=get(cb,'Position');t(3)=0.015;set(cb,'Position',t);set(gca,'position',y1);

set(gca,'fontsize',8)
xlabel('Y(Km)','FontSize',8);
ylabel('Z(Km)','FontSize',8);
zlabel('V(J)','FontSize',8);

print('equilibrium_yz_1layer','-djpeg');