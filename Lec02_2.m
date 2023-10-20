% 機械学習・データサイエンス特論
% Lec02課題 問2

%% Create DataArray
data_array = [];

% Add data(Label:0)
data_array = cat(1, data_array, [2,2,1]);
data_array = cat(1, data_array, [2,4,1]);
data_array = cat(1, data_array, [3,2,1]);
data_array = cat(1, data_array, [4,5,1]);
data_array = cat(1, data_array, [5,3,1]);
% Add data(Label:1)
data_array = cat(1, data_array, [1,2,0]);
data_array = cat(1, data_array, [1,4,0]);
data_array = cat(1, data_array, [2,1,0]);
data_array = cat(1, data_array, [3,1,0]);
data_array = cat(1, data_array, [4,3,0]);

%% Calculate Score
result_array = [];
BetaUpLim = 10;
BetaLowLim = 0;
BetaChangeRate = 0.01;

for Beta = BetaLowLim:BetaChangeRate:BetaUpLim
    cnt_tp = 0;
    cnt_fp = 0;
    cnt_fn = 0;
    cnt_tn = 0;

    for idx = 1:size(data_array,1)
        x1 = data_array(idx,1);
        x2 = data_array(idx,2);
        y = data_array(idx,3);
        x2_bd = -(x1)-(-Beta); % 線形分類境界上のx2
        if x2 > x2_bd % y(予測)が1
            if y == 1
                cnt_tp = cnt_tp + 1;
            else
                cnt_fp = cnt_fp + 1;
            end
        else % y(予測)が0
            if y == 0
                cnt_tn = cnt_tn + 1;
            else
                cnt_fn = cnt_fn + 1;
            end 
        end
    end

    precision = cnt_tp / (cnt_tp + cnt_fp);
    recall = cnt_tp / (cnt_tp + cnt_fn);
    F1score = 2 * precision * recall / (precision + recall);
    
    result_array = cat(1, result_array, [Beta, precision, recall, F1score]);
end
