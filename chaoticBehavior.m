clear; clc;

% Lorentz's parameters (classic chaotic)

sigma = 10;
beta = 8/3;
rho = 28;

% initial condition
y0 = [-8;8;27];

% compute trajectory
dt = .01;
tspan = 0:dt:4;

Y(:,1) = y0;
yk = y0;

for i = 1:length(tspan)
    time = i * dt;
    % computing runge kutta scheme by inputting our function, time step,
    % current time, and current position (tk)
    yout1 = rk4SingleStep(@(t,y)lorentz(t,y, sigma, beta, rho), dt, time, yk);
    % appending yout1 (3 x 1) vector to Y
    Y = [Y yout1];
    % make the calculated position the new yk for the next loop
    yk = yout1;
    
    % animation
    plot3(Y(1,i), Y(2,i), Y(3,i),'o-')
    view(45,0)
    hold on
    axis([-20 20 -20 20 0 45])
    drawnow
end
% plot3(Y(1,:), Y(2,:), Y(3,:))
[t,y] = ode45(@(t,y)lorentz(t,y,sigma,beta,rho),tspan,yk);
plot3(y(:,1),y(:,2),y(:,3))
legend("My integrator", "ODE45")