%% Apophis 99942 Gravity Potential

clc; clear all;

% load the data
%requires Data_Apophis folder
cd('C:/Users/tewki/Downloads/Summer Research/Data_Apophis');
tsoulis = load('pot_tsulis.dat');
layers_1 = load('points_tetrahedron_center.dat');
layers_30 = load('points_tetrahedron_center_n.dat');

% calculate the spin rate
T = 30.4; %hrs
w = (2*pi)/(T*3600); %rad/s

x = tsoulis(:,1);
y = tsoulis(:,2);
z = tsoulis(:,3); 
potential_tsoulis = tsoulis(:,4);
pseudo_tsoulis = tsoulis(:,5);

%calculate potential, du, pseudo, and r
[potential_1_value, pseudo_1, r_1] = pot(x, y, z, layers_1, w);
[potential_30_value, pseudo_30, r_30] = pot(x, y, z, layers_30, w);

%preallocate to reduce run time
potential_error_1 = zeros(1002001, 1);
potential_error_30 = zeros(1002001, 1);
pseudo_error_1 = zeros(1002001, 1);
pseudo_error_30 = zeros(1002001, 1);

%calculate error of gravity potential and pseudo-potential
for a = 1:size(pseudo_tsoulis)
    potential_error_1(a) = (potential_tsoulis(a) - potential_1_value(a))*100/potential_tsoulis(a);
    potential_error_30(a) = (potential_tsoulis(a) - potential_30_value(a))*100/potential_tsoulis(a);
    pseudo_error_1(a) = (pseudo_tsoulis(a) - pseudo_1(a))*100/pseudo_tsoulis(a);
    pseudo_error_30(a) = (pseudo_tsoulis(a) - pseudo_30(a))*100/pseudo_tsoulis(a);
end

%determine the location of the furthest most edge of the asteroid surface
for b = 1:size(layers_30)
    rmax30(b) = sqrt(layers_30(b,1).^2 + layers_30(b,2).^2 + layers_30(b,3).^2);
end
rmax = max(rmax30);

%plot gravity potential error
figure(1)
plot(r_1,potential_error_1); hold on;
plot(r_30,potential_error_30); hold on;
xline(rmax,'--k')
legend('1 Layer','30 Layer','Edge of Asteroid');
xlabel('Distance Radius (km)');
ylabel('Relative Error (%)');
title('Gravity Potential Error');

%plot pseudo-potential error
figure(2)
plot(r_1,pseudo_error_1); hold on;
plot(r_30,pseudo_error_30); hold on;
xline(rmax,'--k')
legend('1 Layer','30 Layer','Edge of Asteroid');
xlabel('Distance Radius (km)');
ylabel('Relative Error (%)');
title('Pseudo-Potential Error');

Mascon_1_data = [potential_1_value, pseudo_1, du_1(:,1), du_1(:,2), du_1(:,3)];
Mascon_30_data = [potential_30_value, pseudo_30, du_30(:,1), du_30(:,2), du_30(:,3)];

function to calculate potential, du, pseudo, and r
function [potential, pseudo, r] = pot(x, y, z, layers, w)

potential = 0;
du = [0,0,0];

du_x = zeros(size(x));
du_y = zeros(size(y));
du_z = zeros(size(z));

for i = 1:size(layers,1)
    x0 = layers(i,1);
    y0 = layers(i,2);
    z0 = layers(i,3);
    mu = layers(i,4);

    dx = x - x0;
    dy = y - y0;
    dz = z - z0;
    r = sqrt((dx).^2 + (dy).^2 + (dz).^2);

    potential = potential + mu ./ r;

    du_x = du_x + (-mu .* dx) ./ r.^3;
    du_y = du_y + (-mu .* dy) ./ r.^3;
    du_z = du_z + (-mu .* dz) ./ r.^3;
end

du = [du_x, du_y, du_z];

pseudo = -0.5 * w^2 .* (x.^2 + y.^2) - potential;

end
