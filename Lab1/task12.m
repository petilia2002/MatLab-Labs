% TASK12
x = linspace(-1, 1, 1000);

[X, Y] = meshgrid(x, x);
[~, x1] = cart2pol(X, Y);
imagesc(x1);
colorbar;
title('Матрица расстояний от центра');
xlabel('x');
ylabel('y');

