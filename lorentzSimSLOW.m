clear; clc;

% Lorentz's parameters (classic chaotic)

sigma = 10;
beta = 8/3;
rho = 28;

% initial condition - large cube of data

xvec = -20:2:20;
yvec = -20:2:20;
zvec = -20:2:20;
[x0,y0,z0] = meshgrid(xvec,yvec,zvec);

yIC(1,:,:,:) = x0;
yIC(2,:,:,:) = y0;
yIC(3,:,:,:) = z0;

% plot3(yIC(1,:),yIC(2,:), yIC(3,:),'r.', 'LineWidth', 2, 'MarkerSize', 4);
% axis([-40 40 -40 40 -40 40])
% view(20,40)
% drawnow

% compute trajectory
dt = .01;
duration = 2;
tspan = [0:duration];
L = duration / dt;
yparticles = yIC;

for step = 1:L
    time = step * dt;
    for i = 1:length(xvec)
        for j = 1:length(yvec)
            for k = 1:length(zvec)
                yin = yparticles(:,i,j,k);
                yout = rk4SingleStep(@(t,y)lorentz(t,y,sigma,beta,rho), dt, time, yin);
                yparticles(:,i,j,k) = yout;
            end
        end
    end
    plot3(yparticles(1,:), yparticles(2,:), yparticles(3,:), 'r.');
    axis([-40 40 -40 40 -40 40])
    view(20,40)
    drawnow
end


