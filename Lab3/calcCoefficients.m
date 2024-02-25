function [b_m, c_m] = calcCoefficients(R, k1, k2, mu1, mu2, b, c, b1, b2, c1, c2)
  J_m_1_b = besselj(b, k1 * R); % вектор бесселей от k1 для коэффициентов b_m
  J_m_2_b = besselj(b, k2 * R); % вектор бесселей от k2 для коэффициентов b_m

  d_J_m_1_b = besselj(b1 - 1 : b2 - 1, k1 * R) - J_m_1_b .* b ./ (k1 * R); % вектор производных бесселей от k1 для коэффициентов b_m
  d_J_m_2_b = besselj(b1 - 1 : b2 - 1, k2 * R) - J_m_2_b .* b ./ (k2 * R); % вектор производных бесселей от k2 для коэффициентов b_m

  H_m_b = besselh(b, 2, k1 * R); % вектор ханкелей от k1 для коэффициентов b_m
  d_H_m_b = besselh(b1 - 1 : b2 - 1, 2, k1 * R) - H_m_b .* b ./ (k1 * R); % вектор производных ханкелей от k1 для коэффициентов b_m


  b_m = (k1 .* mu2 .* (H_m_b .* d_J_m_1_b) - k1 .* mu2 .* (d_H_m_b .* J_m_1_b)) ./ ...
        (k2 .* mu1 .* (d_J_m_2_b .* H_m_b) - k1 .* mu2 .* (d_H_m_b .* J_m_2_b));


  J_m_1_c = besselj(c, k1 * R); % вектор бесселей от k1 для коэффициентов c_m
  J_m_2_c = besselj(c, k2 * R); % вектор бесселей от k2 для коэффициентов c_m

  d_J_m_1_c = besselj(c1 - 1 : c2 - 1, k1 * R) - J_m_1_c .* c ./ (k1 * R); % вектор производных бесселей от k1 для коэффициентов c_m
  d_J_m_2_c = besselj(c1 - 1 : c2 - 1, k2 * R) - J_m_2_c .* c ./ (k2 * R); % вектор производных бесселей от k2 для коэффициентов c_m

  H_m_c = besselh(c, 2, k1 * R); % вектор ханкелей от k1 для коэффициентов c_m
  d_H_m_c = besselh(c1 - 1 : c2 - 1, 2, k1 * R) - H_m_c .* c ./ (k1 * R); % вектор производных ханкелей от k1 для коэффициентов c_m


  c_m = (k2 * mu1 .* d_J_m_2_c .* J_m_1_c - k1 * mu2 .* J_m_2_c .* d_J_m_1_c) ./ ...
        (k1 * mu2 .* J_m_2_c .* d_H_m_c - k2 * mu1 .* d_J_m_2_c .* H_m_c);
end




