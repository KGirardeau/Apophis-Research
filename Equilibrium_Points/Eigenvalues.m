%% Apophis 99942 Eigenvalues

clc; clear all;

% load the data
%requires Data_Apophis folder
cd('C:/Users/tewki/Downloads/Summer Research/Data_Apophis');

layers_1 = load('points_tetrahedron_center.dat');
layers_30 = load('points_tetrahedron_center_n.dat');

% calculate the spin rate
T = 30.4; %hrs
w = (2*pi)/(T*3600); %rad/s

x_E1 = 0.1281; y_E1 = 1.0141; z_E1 = 0;
x_E2 = -1.0280; y_E2 = -0.560; z_E2 = 0;
x_E3 = -0.1866; y_E3 = -1.0055; z_E3 = 0;
x_E4 = 0.9985; y_E4 = 0.2462; z_E4 = 0;

%% 1 Layer Second Solution
[Uxx_E1_1,Uyy_E1_1,Uzz_E1_1,Uxy_E1_1,Uxz_E1_1,...
    Uyz_E1_1] = du2(x_E1,y_E1,z_E1,layers_1);
[Uxx_E2_1,Uyy_E2_1,Uzz_E2_1,Uxy_E2_1,Uxz_E2_1,...
    Uyz_E2_1] = du2(x_E2,y_E2,z_E2,layers_1);
[Uxx_E3_1,Uyy_E3_1,Uzz_E3_1,Uxy_E3_1,Uxz_E3_1,...
    Uyz_E3_1] = du2(x_E3,y_E3,z_E3,layers_1);
[Uxx_E4_1,Uyy_E4_1,Uzz_E4_1,Uxy_E4_1,Uxz_E4_1,...
    Uyz_E4_1] = du2(x_E4,y_E4,z_E4,layers_1);

%calculate alpha
alpha_E1_1 = Uxx_E1_1 + Uyy_E1_1 + Uzz_E1_1 + 4*w.^2;
alpha_E2_1 = Uxx_E2_1 + Uyy_E2_1 + Uzz_E2_1 + 4*w.^2;
alpha_E3_1 = Uxx_E3_1 + Uyy_E3_1 + Uzz_E3_1 + 4*w.^2;
alpha_E4_1 = Uxx_E4_1 + Uyy_E4_1 + Uzz_E4_1 + 4*w.^2;

%calculate beta
beta_E1_1 = Uxx_E1_1*Uyy_E1_1 + Uyy_E1_1*Uzz_E1_1 + Uzz_E1_1*Uxx_E1_1...
    - Uxy_E1_1.^2 - Uyz_E1_1.^2 - Uxz_E1_1.^2 + 4*w.^2*Uzz_E1_1;
beta_E2_1 = Uxx_E2_1*Uyy_E2_1 + Uyy_E2_1*Uzz_E2_1 + Uzz_E2_1*Uxx_E2_1...
    - Uxy_E2_1.^2 - Uyz_E2_1.^2 - Uxz_E2_1.^2 + 4*w.^2*Uzz_E2_1;
beta_E3_1 = Uxx_E3_1*Uyy_E3_1 + Uyy_E3_1*Uzz_E3_1 + Uzz_E3_1*Uxx_E3_1...
    - Uxy_E3_1.^2 - Uyz_E3_1.^2 - Uxz_E3_1.^2 + 4*w.^2*Uzz_E3_1;
beta_E4_1 = Uxx_E4_1*Uyy_E4_1 + Uyy_E4_1*Uzz_E4_1 + Uzz_E4_1*Uxx_E4_1...
    - Uxy_E4_1.^2 - Uyz_E4_1.^2 - Uxz_E4_1.^2 + 4*w.^2*Uzz_E4_1;

%calculate gamma
gamma_E1_1 = Uxx_E1_1*Uyy_E1_1*Uzz_E1_1 + 2*Uxy_E1_1*Uyz_E1_1*Uxz_E1_1...
    - Uxx_E1_1*Uyz_E1_1.^2 - Uyy_E1_1*Uxz_E1_1.^2 - Uzz_E1_1*Uxy_E1_1.^2;
gamma_E2_1 = Uxx_E2_1*Uyy_E2_1*Uzz_E2_1 + 2*Uxy_E2_1*Uyz_E2_1*Uxz_E2_1...
    - Uxx_E2_1*Uyz_E2_1.^2 - Uyy_E2_1*Uxz_E2_1.^2 - Uzz_E2_1*Uxy_E2_1.^2;
gamma_E3_1 = Uxx_E3_1*Uyy_E3_1*Uzz_E3_1 + 2*Uxy_E3_1*Uyz_E3_1*Uxz_E3_1...
    - Uxx_E3_1*Uyz_E3_1.^2 - Uyy_E3_1*Uxz_E3_1.^2 - Uzz_E3_1*Uxy_E3_1.^2;
gamma_E4_1 = Uxx_E4_1*Uyy_E4_1*Uzz_E4_1 + 2*Uxy_E4_1*Uyz_E4_1*Uxz_E4_1...
    - Uxx_E4_1*Uyz_E4_1.^2 - Uyy_E4_1*Uxz_E4_1.^2 - Uzz_E4_1*Uxy_E4_1.^2;

%solve for eigenvalues (lambda)
coeff_E1_1 = [1, 0, alpha_E1_1, 0, beta_E1_1, 0, gamma_E1_1];
coeff_E2_1 = [1, 0, alpha_E2_1, 0, beta_E2_1, 0, gamma_E2_1];
coeff_E3_1 = [1, 0, alpha_E3_1, 0, beta_E3_1, 0, gamma_E3_1];
coeff_E4_1 = [1, 0, alpha_E4_1, 0, beta_E4_1, 0, gamma_E4_1];

eigen_E1_1 = roots(coeff_E1_1);
eigen_E2_1 = roots(coeff_E2_1);
eigen_E3_1 = roots(coeff_E3_1);
eigen_E4_1 = roots(coeff_E4_1);

%% 30 Layer Solution
[Uxx_E1_30,Uyy_E1_30,Uzz_E1_30,Uxy_E1_30,Uxz_E1_30,...
    Uyz_E1_30] = du2(x_E1,y_E1,z_E1,layers_30);
[Uxx_E2_30,Uyy_E2_30,Uzz_E2_30,Uxy_E2_30,Uxz_E2_30,...
    Uyz_E2_30] = du2(x_E2,y_E2,z_E2,layers_30);
[Uxx_E3_30,Uyy_E3_30,Uzz_E3_30,Uxy_E3_30,Uxz_E3_30,...
    Uyz_E3_30] = du2(x_E3,y_E3,z_E3,layers_30);
[Uxx_E4_30,Uyy_E4_30,Uzz_E4_30,Uxy_E4_30,Uxz_E4_30,...
    Uyz_E4_30] = du2(x_E4,y_E4,z_E4,layers_30);

%calculate alpha
alpha_E1_30 = Uxx_E1_30 + Uyy_E1_30 + Uzz_E1_30 + 4*w.^2;
alpha_E2_30 = Uxx_E2_30 + Uyy_E2_30 + Uzz_E2_30 + 4*w.^2;
alpha_E3_30 = Uxx_E3_30 + Uyy_E3_30 + Uzz_E3_30 + 4*w.^2;
alpha_E4_30 = Uxx_E4_30 + Uyy_E4_30 + Uzz_E4_30 + 4*w.^2;

%calculate beta
beta_E1_30 = Uxx_E1_30*Uyy_E1_30 + Uyy_E1_30*Uzz_E1_30 + Uzz_E1_30*Uxx_E1_30...
    - Uxy_E1_30.^2 - Uyz_E1_30.^2 - Uyz_E1_30.^2 + 4*w.^2*Uzz_E1_30;
beta_E2_30 = Uxx_E2_30*Uyy_E2_30 + Uyy_E2_30*Uzz_E2_30 + Uzz_E2_30*Uxx_E2_30...
    - Uxy_E2_30.^2 - Uyz_E2_30.^2 - Uyz_E2_30.^2 + 4*w.^2*Uzz_E2_30;
beta_E3_30 = Uxx_E3_30*Uyy_E3_30 + Uyy_E3_30*Uzz_E3_30 + Uzz_E3_30*Uxx_E3_30...
    - Uxy_E3_30.^2 - Uyz_E3_30.^2 - Uyz_E3_30.^2 + 4*w.^2*Uzz_E3_30;
beta_E4_30 = Uxx_E4_30*Uyy_E4_30 + Uyy_E4_30*Uzz_E4_30 + Uzz_E4_30*Uxx_E4_30...
    - Uxy_E4_30.^2 - Uyz_E4_30.^2 - Uyz_E4_30.^2 + 4*w.^2*Uzz_E4_30;

%calculate gamma
gamma_E1_30 = Uxx_E1_30*Uyy_E1_30*Uzz_E1_30 + 2*Uxy_E1_30*Uyz_E1_30*Uxz_E1_30...
    - Uxx_E1_30*Uyz_E1_30.^2 - Uyy_E1_30*Uxz_E1_30.^2 - Uzz_E1_30*Uxy_E1_30.^2;
gamma_E2_30 = Uxx_E2_30*Uyy_E2_30*Uzz_E2_30 + 2*Uxy_E2_30*Uyz_E2_30*Uxz_E2_30...
    - Uxx_E2_30*Uyz_E2_30.^2 - Uyy_E2_30*Uxz_E2_30.^2 - Uzz_E2_30*Uxy_E2_30.^2;
gamma_E3_30 = Uxx_E3_30*Uyy_E3_30*Uzz_E3_30 + 2*Uxy_E3_30*Uyz_E3_30*Uxz_E3_30...
    - Uxx_E3_30*Uyz_E3_30.^2 - Uyy_E3_30*Uxz_E3_30.^2 - Uzz_E3_30*Uxy_E3_30.^2;
gamma_E4_30 = Uxx_E4_30*Uyy_E4_30*Uzz_E4_30 + 2*Uxy_E4_30*Uyz_E4_30*Uxz_E4_30...
    - Uxx_E4_30*Uyz_E4_30.^2 - Uyy_E4_30*Uxz_E4_30.^2 - Uzz_E4_30*Uxy_E4_30.^2;

%solve for eigenvalues (lambda)
coeff_E1_30 = [1, 0, alpha_E1_30, 0, beta_E1_30, 0, gamma_E1_30];
coeff_E2_30 = [1, 0, alpha_E2_30, 0, beta_E2_30, 0, gamma_E2_30];
coeff_E3_30 = [1, 0, alpha_E3_30, 0, beta_E3_30, 0, gamma_E3_30];
coeff_E4_30 = [1, 0, alpha_E4_30, 0, beta_E4_30, 0, gamma_E4_30];

eigen_E1_30 = roots(coeff_E1_30);
eigen_E2_30 = roots(coeff_E2_30);
eigen_E3_30 = roots(coeff_E3_30);
eigen_E4_30 = roots(coeff_E4_30);

%% Plot the eigenvalues on the real-imaginary plane

figure(1);
xline(0,'k-'); hold on;
yline(0,'k-'); hold on;
plot(real(eigen_E1_1),imag(eigen_E1_1),'.','MarkerSize',20)
xlabel('Re');
ylabel('Im');
title('Eigenvalues of E1');

figure(2);
xline(0,'k-'); hold on;
yline(0,'k-'); hold on;
plot(real(eigen_E1_1),imag(eigen_E2_1),'.','MarkerSize',20)
xlabel('Re');
ylabel('Im');
title('Eigenvalues of E2');

figure(3);
xline(0,'k-'); hold on;
yline(0,'k-'); hold on;
plot(real(eigen_E1_1),imag(eigen_E3_1),'.','MarkerSize',20)
xlabel('Re');
ylabel('Im');
title('Eigenvalues of E3');

figure(4);
xline(0,'k-'); hold on;
yline(0,'k-'); hold on;
plot(real(eigen_E1_1),imag(eigen_E4_1),'.','MarkerSize',20)
xlabel('Re');
ylabel('Im');
title('Eigenvalues of E4');

%% Create function to calculate second derivatives
function [Uxx,Uyy,Uzz,Uxy,Uxz,Uyz] = du2(x, y, z, layers)

Uxx = 0; Uyy = 0; Uzz = 0; Uxy = 0; Uxz = 0; Uyz = 0;

for i = 1:size(layers,1)
    x0 = layers(i,1);
    y0 = layers(i,2);
    z0 = layers(i,3);
    mu = layers(i,4);

    dx = x - x0;
    dy = y - y0;
    dz = z - z0;
    r = sqrt((dx).^2 + (dy).^2 + (dz).^2);

    Uxx = Uxx - (mu/r.^3) + ((3*mu*dx.^2)/r.^5);
    Uyy = Uyy - (mu/r.^3) + ((3*mu*dy.^2)/r.^5);
    Uzz = Uzz - (mu/r.^3) + ((3*mu*dz.^2)/r.^5);
    Uxy = Uxy + ((3*mu*dx*dy)/r.^5);
    Uxz = Uxz + ((3*mu*dx*dz)/r.^5);
    Uyz = Uyz + ((3*mu*dy*dz)/r.^5);
end
end
