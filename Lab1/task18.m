% TASK18
x = linspace(-1, 1, 1000);
[X, Y] = meshgrid(x, x);
[~, x1] = cart2pol(X, Y);

x2 = exp(-x1 .* x1 / 0.125);
imagesc(x, x, x2);
colorbar;
title('Гауссов пучок');
xlabel('х');
ylabel('y');

