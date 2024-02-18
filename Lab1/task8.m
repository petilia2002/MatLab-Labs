% TASK 8
n = 4;
m = 4;

x1 = rand(n, m);
x1

x2 = x1(2:end,:) - x1(1:end-1,:);
x2

x3 = x1(:,2:end) - x1(:,1:end-1);
x3

