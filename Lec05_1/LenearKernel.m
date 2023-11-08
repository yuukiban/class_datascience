function [kernel_density_estimate] = LenearKernel(DataSet, bandwidth, scale)
kernel_density_estimate = zeros(length(0:scale:10),1);

for i = 1:length(DataSet)
    kernel_array = linspace(0, bandwidth, bandwidth/scale); 
    kernel_reversed_array = flip(kernel_array);
    
    kernel_density_estimate(((DataSet(i)-bandwidth)/scale)+1:(DataSet(i)/scale)) = kernel_density_estimate(((DataSet(i)-bandwidth)/scale)+1:(DataSet(i)/scale)) + kernel_array';
    kernel_density_estimate(((DataSet(i))/scale)+1:(DataSet(i)+bandwidth)/scale) = kernel_density_estimate(((DataSet(i))/scale)+1:(DataSet(i)+bandwidth)/scale) + kernel_reversed_array(1:end)';
end

kernel_density_estimate = kernel_density_estimate/(bandwidth*length(DataSet)*2);

end

