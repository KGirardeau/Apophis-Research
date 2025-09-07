%% Plot the Asteroid

clc; clear all;

cd('C:/Users/tewki/Downloads/Summer Research/Data_Apophis');
vertices = load('shape_v.dat');
faces = load('shape_f.dat');
faces_x = faces(:,1);
faces_y = faces(:,2);
faces_z = faces(:,3);
layers_1 = load('points_tetrahedron_center.dat');
layers_30 = load('points_tetrahedron_center_n.dat');

%Plot the surface
figure(1);
trisurf(faces, vertices(:,1), vertices(:,2), vertices(:,3),'FaceColor','white','EdgeColor','black'); hold on;
plot3(0.1105,1.0163,0,'.','MarkerSize',20,'MarkerEdgeColor','black'); hold on;
text(0.1105,1.0163,0, 'E1', 'FontSize',8, 'Color','k');
plot3(-1.0288,-0.0288,0,'.','MarkerSize',20,'MarkerEdgeColor','black'); hold on;
text(-1.0288,-0.0288,0, 'E2', 'FontSize',8, 'Color','k');
plot3(-0.1601,-1.0101,0,'.','MarkerSize',20,'MarkerEdgeColor','black'); hold on;
text(-0.1601,-1.0101,0, 'E3', 'FontSize',8, 'Color','k');
plot3(1.0175,0.1469,0,'.','MarkerSize',20,'MarkerEdgeColor','black');
text(1.0175,0.1469,0, 'E4', 'FontSize',8, 'Color','k');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Apophis 99942 3D View');
axis equal;   

%plot 1 layer mass points
figure(2);
scatter3(layers_1(:,1),layers_1(:,2),layers_1(:,3),1);
title('Apophis 99942 1 Layer Mascon');
xlabel('X (km)');
ylabel('Y (km)');
zlabel('Z (km)');
axis equal;  

figure(3);
scatter(layers_1(:,1),layers_1(:,2),1);
title('Apophis 99942 1 Layer Mascon (XY)');
xlabel('X (km)');
ylabel('Y (km)');
axis equal;  

figure(4);
scatter(layers_1(:,1),layers_1(:,3),1);
title('Apophis 99942 1 Layer Mascon (XZ)');
xlabel('X (km)');
ylabel('Z (km)');
axis equal;  

figure(5);
scatter(layers_1(:,2),layers_1(:,3),1);
title('Apophis 99942 1 Layer Mascon (YZ)');
xlabel('Y (km)');
ylabel('Z (km)');
axis equal;  

%plot 30 layer mass points
figure(6);
scatter3(layers_30(:,1),layers_30(:,2),layers_30(:,3),0.5);
title('Apophis 99942 30 Layer Mascon');
xlabel('X (km)');
ylabel('Y (km)');
zlabel('Z (km)');
axis equal;  

figure(7);
scatter(layers_30(:,1),layers_30(:,2),1);
title('Apophis 99942 30 Layer Mascon (XY)');
xlabel('X (km)');
ylabel('Y (km)');
axis equal;  

figure(8);
scatter(layers_30(:,1),layers_30(:,3),1);
title('Apophis 99942 30 Layer Mascon (XZ)');
xlabel('X (km)');
ylabel('Z (km)');
axis equal;  

figure(9);
scatter(layers_30(:,2),layers_30(:,3),1);
title('Apophis 99942 30 Layer Mascon (YZ)');
xlabel('Y (km)');
ylabel('Z (km)');
axis equal;
