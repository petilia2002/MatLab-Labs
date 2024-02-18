% TASK 6
n = 100;
k = 200;
m = 300;

x1 = rand(n, k); % 3 x 4
x2 = rand(k, m); % 4 x 5

tic
x3 = x1 * x2;
toc

x3 = zeros(n, m); % 3 x 5

tic
for i=1:n
  for j=1:m
    for s=1:k
      x3(i, j) += x1(i, s) * x2(s, j);
    end
  end
end
#x3
toc

