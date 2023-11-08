% 機械学習・データサイエンス特論
% Lec05課題 問1
% 単変量の事例10個、バンド幅がh=2の線形カーネル関数

% データの定義
DataSet = [2, 3, 3, 4, 6, 7, 7, 7, 8, 8];
bandwidth = 2;
scale = 0.01;
x = 0:scale:10;

% 座標から線形カーネルへの変換
[kernel_density_estimate] = LenearKernel(DataSet, bandwidth, scale);

% グラフの作成
figure;
plot(x, kernel_density_estimate, 'LineWidth', 2);
hold on;
% histogram(data, 'Normalization', 'probability', 'BinWidth', 1, 'FaceColor', [0.8, 0.8, 0.8]);
xlabel('x');
ylabel('確率密度');
ylim([0 0.5]);
legend('カーネル密度推定', 'ヒストグラム', 'Location', 'Best');
title('バンド幅2の線形カーネルを用いたカーネル密度推定');

% グリッドを表示
grid on;