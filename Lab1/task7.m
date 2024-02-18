% TASK 7
n = 10000;
x1 = rand(1, n);
#x1

tic
x2 = x1(2:end) - x1(1:end-1);
#x2
toc

x2 = zeros(1, n - 1);
tic
for i=1:n-1
  x2(i) = x1(i + 1) - x1(i);
end
#x2
toc

