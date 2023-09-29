% get x,y 
XY = readmatrix('C:\Users\AT75690\Desktop\Tal corpus\fricative\perturbated\perturbated_2\s\p2_con_day6_see_273.csv');
m = size(XY,1);
len = zeros(m,8);
for i = 1:8
x = XY(:,2*i-1);
y = XY(:,2*i);
% Calculate the difference between neighboring points
dx = diff(x);
dy = diff(y);

% Calculate the length of each line segment
segment_lengths = hypot(dx, dy);

% Calculate the total length of the curve
curve_length = sum(segment_lengths);

% Calculate the cumulative distance (arc length) from each point to the starting point
accumulated_lengths = [0; cumsum(segment_lengths)];

% Calculate the normalized arc length coordinates of each point
len(:,i) = accumulated_lengths / curve_length;

% l: The first element of the array is 0 and the last element is 1, 
% indicating the start and end points of the entire curve.

end

writematrix(len,'C:\Users\AT75690\Desktop\Tal corpus\fricative\perturbated\perturbated_2\s\p2_len_day6_see_273.csv');
