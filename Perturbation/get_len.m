% get x,y 
XY001 = readmatrix('XY001.csv');
x = XY001(:,1);
y = XY001(:,2);
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
l = accumulated_lengths / curve_length;

% l: The first element of the array is 0 and the last element is 1, 
% indicating the start and end points of the entire curve.

writematrix(l,'length_001.csv');
