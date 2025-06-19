%% Apophis 99942 Gravity Potential

clc; clear all;

% load the data
%requires Data_Apophis folder
cd('C:/Users/tewki/Downloads/Summer Research/Data_Apophis');
%vertices = load('shape_v.dat');
%faces = load('shape_f.dat');
%faces_x = faces(:,1);
%faces_y = faces(:,2);
%faces_z = faces(:,3);
tsoulis = load('pot_tsulis.dat');
layers_1 = load('points_tetrahedron_center.dat');
layers_30 = load('points_tetrahedron_center_n.dat');

% plot the asteroid
%figure();
%trisurf(faces, vertices(:,1), vertices(:,2), vertices(:,3));
%xlabel('X');
%ylabel('Y');
%zlabel('Z');
%title('Apophis 99942 3D View');
%axis equal;         

%plot 1 layer mass points
%figure();
%scatter3(layers_1(:,1),layers_1(:,2),layers_1(:,3));
%title('Apophis 99942 1 Layer Mascon');
%axis equal;  

%plot 30 layer mass points
%figure();
%scatter3(layers_30(:,1),layers_30(:,2),layers_30(:,3));
%title('Apophis 99942 30 Layer Mascon');
%axis equal;  

% calculate the spin rate
T = 30.4; %hrs
w = (2*pi)/(T*3600); %rad/s

x = tsoulis(:,1);
y = tsoulis(:,2);
z = tsoulis(:,3); 
x_1 = layers_1(:,1);
y_1 = layers_1(:,2);
z_1 = layers_1(:,3);
potential_tsoulis = tsoulis(:,4);
pseudo_tsoulis = tsoulis(:,5);

%calculate potential, du, pseudo, and r
[potential_1_value, du_1, pseudo_1,r_1] = pot(x, y, z, layers_1, w);
[potential_30_value, du_30, pseudo_30,r_30] = pot(x, y, z, layers_30, w);

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

%plot gravity potential error
figure(1)
plot(r_1,potential_error_1); hold on;
plot(r_30,potential_error_30);
legend('1 Layer','30 Layer');
xlabel('Distance Radius (km)');
ylabel('Relative Error (%)');
title('Gravity Potential Error');

%plot pseudo-potential error
figure(2)
plot(r_1,pseudo_error_1); hold on;
plot(r_30,pseudo_error_30);
legend('1 Layer','30 Layer');
xlabel('Distance Radius (km)');
ylabel('Relative Error (%)');
title('Pseudo-Potential Error');

%function to calculate potential, du, pseudo, and r
function [potential, du, pseudo,r] = pot(x, y, z, layers, w)

potential = 0;
du = [0, 0, 0];

for i = 1:size(layers,1)
    x0 = layers(i,1);
    y0 = layers(i,2);
    z0 = layers(i,3);
    mu = layers(i,4);

    r = sqrt((x - x0).^2 + (y - y0).^2 + (z - z0).^2);
    potential = potential + mu ./ r;

    %ran into issue running this section of the code
    %du(i,1) = du(1) + (-mu * x0) ./ (r.^3);
    %du(i,2) = du(2) + (-mu * y0) ./ (r.^3);
    %du(i,3) = du(3) + (-mu * z0) ./ (r.^3);
end

pseudo = -0.5 * w^2 .* (x.^2 + y.^2) - potential;

end
