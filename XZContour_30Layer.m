%% Plotting the zero velocity curve XZ for 30 Mascon Layer

x30 = x_cube_flat;
z30 = z_cube_flat;
y30 = pseudo_cube_flat_30;
a30 = size(pseudo_cube_flat_30);

b30 = a30(:,1);
set(gca,'fontsize',5)
xlin30 = linspace(min(x30),max(x30));
ylin30 = linspace(min(y30),max(y30));
zlin30 = linspace(min(z30),max(z30));
[XX30,ZZ30] = meshgrid(xlin30,zlin30);
YY30 = griddata(x30,z30,y30,XX30,ZZ30);

unit = 0;

figure(1); 
contour(XX30,ZZ30,-YY30*10^(unit),1500);grid off
title('XZ Projection of Zero Velocity Curves for 30 Mascon Layer');
strunit = int2str(unit);
cb=colorbar;x30=get(gca,'position');t=get(cb,'Position');t(3)=0.015;set(cb,'Position',t);set(gca,'position',x30);

set(gca,'fontsize',8)
xlabel('X(Km)','FontSize',8);
ylabel('Z(Km)','FontSize',8);
zlabel('V(J)','FontSize',8);

print('equilibrium_xz_30layer','-djpeg');