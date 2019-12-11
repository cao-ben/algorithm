function [ output ] = euclidean_distance(data, center)
% 用于计算训练样本与聚类中心的的欧氏距离的平方；
% 其中  data为一个 矩阵 M×N， 表示样本集，其中M表示共有M个样本，　N表示每一个样本的维度；
%      centre 为一个矩阵 K×N，表示K个聚类中心，N表示样本的维度；
%      output 为一个矩阵，大小为M×K； 第ｘ行ｙ列表示第X个样本与第Y个聚类中心的距离；（每一行表示一个样本与K个聚类中心的距离）；


% 作者：殷和义；
% 时间：2017年10月14日；




data_num = size(data, 1);
center_num = size(center, 1);
output = zeros(data_num, center_num);
for i = 1:center_num
    difference = data - repmat(center(i,:), data_num, 1);    %求样本集与第i个聚类中心的差；
    sum_of_squares = sum(difference .* difference, 2);        %求平方， 并对每一行求和；
    output(:, i) = sum_of_squares;             
end

end

