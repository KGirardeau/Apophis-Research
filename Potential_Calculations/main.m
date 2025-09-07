% 7m31.142s
% calculate the spin rate
T = 30.4; %hrs
w = (2*pi)/(T*3600); %rad/s


% Display the results
disp('w:'); disp(w);

tsoulis = load('Data_Apophis/pot_tsulis.dat');
layers_1 = load('Data_Apophis/points_tetrahedron_center.dat');
layers_30 = load('Data_Apophis/points_tetrahedron_center_n.dat');

[potential_1_value, pseudo_1] = pot(tsoulis(:,1), tsoulis(:,2), tsoulis(:,3), layers_1, w);
[potential_30_value, pseudo_30] = pot(tsoulis(:,1), tsoulis(:,2), tsoulis(:,3), layers_30, w);

% Combine data into one matrix
output_data = [tsoulis(:,1), tsoulis(:,2), tsoulis(:,3), potential_1_value, pseudo_1];
dlmwrite('output_potential_1.csv', output_data, 'delimiter', ',', 'precision', 8); % matlab R2010

% Combine data into one matrix
output_data = [tsoulis(:,1), tsoulis(:,2), tsoulis(:,3), potential_30_value, pseudo_30];
dlmwrite('output_potential_30.csv', output_data, 'delimiter', ',', 'precision', 8); % matlab R2010

