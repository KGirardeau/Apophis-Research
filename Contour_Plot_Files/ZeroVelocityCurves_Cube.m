
% Define mascon layers
layers_1 = load('Data_Apophis/points_tetrahedron_center.dat');
layers_30 = load('Data_Apophis/points_tetrahedron_center.dat');

% calculate the spin rate
T = 30.4; %hrs
w = (2*pi)/(T*3600); %rad/s

% Constants
R_max = 0.254; % in km
side_length = 7 * R_max;
N = 101; % Use an odd number to guarantee that x = 0 is in your grid

% Create grid from -side_length to +side_length
x_cube = linspace(-side_length, side_length, N);
y_cube = linspace(-side_length, side_length, N);
z_cube = linspace(-side_length, side_length, N);
[X_cube, Y_cube, Z_cube] = meshgrid(x_cube, y_cube, z_cube);

% Compute distance from origin

[potential_cube_1, pseudo_cube_1] = pot(X_cube, Y_cube, Z_cube, layers_1, w);
[potential_cube_30, pseudo_cube_30] = pot(X_cube, Y_cube, Z_cube, layers_30, w);

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

% Write header manually
fid = fopen('pseudo_potential_z0.csv', 'w');
fprintf(fid, 'x_km,y_km,z_km,potential,pseudo_potential\n');

% Write data
fclose(fid); % Close to reset for append
dlmwrite('pseudo_potential_z0_1.csv', data1, '-append', ...
         'delimiter', ',', 'precision', 9);

disp('Saved to pseudo_potential_z0_1.csv');

% Write header manually
fid = fopen('pseudo_potential_z0_30.csv', 'w');
fprintf(fid, 'x_km,y_km,z_km,potential,pseudo_potential\n');

% Write data
fclose(fid); % Close to reset for append
dlmwrite('pseudo_potential_z0_30.csv', data30, '-append', ...
         'delimiter', ',', 'precision', 9);

disp('Saved to pseudo_potential_z0_30.csv');

