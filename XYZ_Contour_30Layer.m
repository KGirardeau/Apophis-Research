
% Define mascon layers
layers_1 = load('Data_Apophis/points_tetrahedron_center.dat');
layers_30 = load('Data_Apophis/points_tetrahedron_center.dat');

% calculate the spin rate
T = 30.4; %hrs
w = (2*pi)/(T*3600); %rad/s

% Constants
R_max = 0.254; % in km
side_length = 9 * R_max;
N = 101; % Use an odd number to guarantee that x = 0 is in your grid

% Create grid from -side_length to +side_length
x_cube = linspace(-side_length, side_length, N);
y_cube = linspace(-side_length, side_length, N);
z_cube = linspace(-side_length, side_length, N);
[X_cube, Y_cube, Z_cube] = meshgrid(x_cube, y_cube, z_cube);

% Compute distance from origin

[potential_cube_1, pseudo_cube_1] = pot0(X_cube, Y_cube, Z_cube, layers_1, w);
[potential_cube_30, pseudo_cube_30] = pot0(X_cube, Y_cube, Z_cube, layers_30, w);

% Reshape data for table export
x_cube_flat = reshape(X_cube, [], 1);
y_cube_flat = reshape(Y_cube, [], 1);
z_cube_flat = reshape(Z_cube, [], 1);

potential_cube_flat_1 = reshape(potential_cube_1, [], 1);
pseudo_cube_flat_1 = reshape(pseudo_cube_1, [], 1);

potential_cube_flat_30 = reshape(potential_cube_30, [], 1);
pseudo_cube_flat_30 = reshape(pseudo_cube_30, [], 1);

% Combine into a matrix
data1 = [x_cube_flat, y_cube_flat, z_cube_flat, potential_cube_flat_1, pseudo_cube_flat_1];
data30 = [x_cube_flat, y_cube_flat, z_cube_flat, potential_cube_flat_30, pseudo_cube_flat_30];

x_minE1 = 0.1105;
y_minE1 = 1.0163;
x_minE2 = -1.0288;
y_minE2 = -0.0288;
x_minE3 = -0.1601;
y_minE3 = -1.0101;
x_minE4 = 1.0175;
y_minE4 = 0.1469;

% Find the z-values
x_vals = [x_minE1, x_minE2, x_minE3, x_minE4];
y_vals = [y_minE1, y_minE2, y_minE3, y_minE4];

z_at_min_pseudo = zeros(1, 4);
min_pseudo_vals = zeros(1, 4);

for i = 1:4
    x0 = x_vals(i);
    y0 = y_vals(i);
    
    % Find nearest indices on the grid
    [~, ix] = min(abs(x_cube - x0));
    [~, iy] = min(abs(y_cube - y0));
    
    % Extract pseudo-potential along z-axis at this (x, y)
    pseudo_line = squeeze(pseudo_cube_30(iy, ix, :));  % (y, x, z)
    
    % Find minimum pseudo value and corresponding z
    [min_pseudo, iz] = min(pseudo_line);
    z_min = z_cube(iz);
    
    z_at_min_pseudo(i) = z_min;
    min_pseudo_vals(i) = min_pseudo;
    
end


function [potential,pseudo] = pot0(x, y, z, layers, w)

potential = 0;

for i = 1:size(layers,1)
    x0 = layers(i,1);
    y0 = layers(i,2);
    z0 = layers(i,3);
    mu = layers(i,4);

    dx = x - x0; dy = y - y0; dz = z - z0;
    r = sqrt((dx).^2 + (dy).^2 + (dz).^2);

    potential = potential + mu ./ r;

end

pseudo = -0.5 * w^2 .* (x.^2 + y.^2) - potential;

end