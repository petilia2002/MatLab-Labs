% 3. Рассчитать распределение интенсивности внутреннего и внешнего поля
% дифракции (формулы (5.6) и (5.8)) плоской ТЕ-поляризованной волны (длина волны λ = 633 нм)
% на бесконечном стеклянном цилиндре (n = 1,59) с радиусами R = 2,1749λ, R = 2,0λ, R = 2,5λ.
close all;
clear;

lambda = 0.633; % длина плоской волны в мкм
n = 1.5; % показатель преломления стекла
A = 1; % амплитуда
mu1 = 1; % магнитная проницаемость внешней среды
mu2 = 1; % магнитная проницаемость цилиндра
k1 = 2 * pi / lambda; % магнитная проницаемость внешней среды
k2 = k1 * n; % магнитная проницаемость цилиндра

b1 = -15; % нижняя граница для коэффициентов b_m
b2 = 15; % верхняя граница для коэффициентов b_m

c1 = -10; % нижняя граница для коэффициентов c_m
c2 = 10; % верхняя граница для коэффициентов c_m

b = b1 : b2; % диапазон индексов для коэффициентов b_m
c = c1 : c2; % диапазон индексов для коэффициентов c_m

% При R = 0.5 * λ
R = 0.5 * lambda;

[b_m, c_m] = calcCoefficients(R, k1, k2, mu1, mu2, b, c, b1, b2, c1, c2);

x = linspace(-1.5, 1.5, 500) .* R;
y = x;

[E_p, E_m] = calcIntensity(x, y, R, A, k1, k2, b, c, b_m, c_m);

figure(1);
imagesc(x, y, E_p');
colorbar;
colormap('gray');
axis xy;
title('Внутренне поле при R = 0.5 * \lambda');
xlabel('x, мкм');
ylabel('y, мкм');

figure(2);
imagesc(x, y, E_m');
colorbar;
colormap('gray');
axis xy;
title('Внешнее поле при R = 0.5 * \lambda');
xlabel('x, мкм');
ylabel('y, мкм');

% При R = λ
R = lambda;

[b_m, c_m] = calcCoefficients(R, k1, k2, mu1, mu2, b, c, b1, b2, c1, c2);

x = linspace(-1.5, 1.5, 500) .* R;
y = x;

[E_p, E_m] = calcIntensity(x, y, R, A, k1, k2, b, c, b_m, c_m);

figure(3);
imagesc(x, y, E_p');
colorbar;
colormap('gray');
axis xy;
title('Внутренне поле при R = \lambda');
xlabel('x, мкм');
ylabel('y, мкм');

figure(4);
imagesc(x, y, E_m');
colorbar;
colormap('gray');
axis xy;
title('Внешнее поле при R = \lambda');
xlabel('x, мкм');
ylabel('y, мкм');

% При R = 2.0 * λ
R = 2.0 * lambda;

[b_m, c_m] = calcCoefficients(R, k1, k2, mu1, mu2, b, c, b1, b2, c1, c2);

x = linspace(-1.5, 1.5, 500) .* R;
y = x;

[E_p, E_m] = calcIntensity(x, y, R, A, k1, k2, b, c, b_m, c_m);

figure(5);
imagesc(x, y, E_p');
colorbar;
colormap('gray');
axis xy;
title('Внутренне поле при R = 2.0 * \lambda');
xlabel('x, мкм');
ylabel('y, мкм');

figure(6);
imagesc(x, y, E_m');
colorbar;
colormap('gray');
axis xy;
title('Внешнее поле при R = 2.0 * \lambda');
xlabel('x, мкм');
ylabel('y, мкм');












