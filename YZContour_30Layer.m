%% Plotting the zero velocity curve YZ for 30 Mascon Layer

x30 = pseudo_cube_flat_30;
y30 = y_cube_flat;
z30 = z_cube_flat;
a30 = size(pseudo_cube_flat_30);

b30 = a30(:,1);
set(gca,'fontsize',5)
xlin30 = linspace(min(x30),max(x30));
ylin30 = linspace(min(y30),max(y30));
zlin30 = linspace(min(z30),max(z30));
[YY30,ZZ30] = meshgrid(ylin30,zlin30);
XX30 = griddata(y30,z30,x30,YY30,ZZ30);

unit = 0;

contour(YY30,ZZ30,-XX30*10^(unit),1500);grid off
title('YZ Projection of Zero Velocity Curves for 1 Mascon Layer');
strunit = int2str(unit);
cb=colorbar;y30=get(gca,'position');t=get(cb,'Position');t(3)=0.015;set(cb,'Position',t);set(gca,'position',y30);

set(gca,'fontsize',8)
xlabel('Y(Km)','FontSize',8);
ylabel('Z(Km)','FontSize',8);
zlabel('V(J)','FontSize',8);

print('equilibrium_yz_30layer','-djpeg');