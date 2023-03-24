function y = moving_average_1d(x, window_size)
% Calculates the moving average of a 1D array using a sliding window
% with odd window size.

assert(mod(window_size, 2) == 1, 'Window size must be odd.');

% Pad the array to handle the edges of the sliding window
pad_size = floor(window_size/2);
x_padded = padarray(x, [pad_size, 0], 'replicate', 'both');

% Create a sliding window view of the padded array
x_view = im2col(x_padded, [window_size, 1], 'sliding');

% Calculate the moving average by averaging over the sliding window
y = mean(x_view, 1)';

% Remove any remaining padding
y = y(pad_size+1:end-pad_size);

end
