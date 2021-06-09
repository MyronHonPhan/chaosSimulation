function dy = lorentz(t,y,sigma, beta, rho)
% y is the three dimensional state vector (x, y, z)

dy = [sigma*(y(2)-y(1));
    y(1)*(rho-y(3))-y(2);
    y(1)*y(2)-beta*y(3)];
end
