% TASK11
n = 4;
m = 4;
x1 = rand(n, m);
x1

x2 = zeros(n, m);
x2(x1 < 0.5) = 1;
x2

