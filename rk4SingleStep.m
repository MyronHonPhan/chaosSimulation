function yout = rk4SingleStep(fun, dt, tk, yk)

f1 = fun(tk,yk);
f2 = fun(tk+dt/2, yk + f1*(dt/2));
f3 = fun(tk+dt/2, yk + f2*(dt/2));
f4 = fun(tk+dt, yk + f3*dt);

yout = yk + (dt/6)*(f1 + 2*f2 + 2*f3 + f4);
end
