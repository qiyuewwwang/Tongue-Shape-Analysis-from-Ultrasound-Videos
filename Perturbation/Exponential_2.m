l = readmatrix("C:\Users\AT75690\Desktop\Tal corpus\fricative\length\sh\len_day6_she_265.csv");% add the path of the lengths' file
XY = readmatrix('C:\Users\AT75690\Desktop\Tal corpus\fricative\contours\sh\day6_she_265.csv');% add the path of the contours' file 


theta = 3;  % degree of divergence
alpha = 10;  % for root
beta = 10;   % for tip
            % alpha/beta > 0: swing to left
            % alpha/beta < 0: swing to right
for j = 1:8
    x = XY(:,2*j-1);
    y = XY(:,2*j);
point = [x,y];   %load the points' accordinates

sz = size(point);
x_exp2 = zeros(sz(1),1);
y_exp2 = zeros(sz(1),1);
r_vec = zeros(sz(1),2);
e_vec = zeros(sz(1),2);
d = zeros(sz(1),1);

for i = 2:sz(1)-1
    x1 = point(i-1,1);
    x2 = point(i+1,1);
    y1 = point(i-1,2);
    y2 = point(i+1,2);
    d(i) = sqrt((x2 - x1)^2 + (y2 - y1)^2);
    r_vec(i,:) = [y(i+1)-y(i-1),x(i-1)-x(i+1)];
    e_vec(i,1) = r_vec(i,1)/d(i);
    e_vec(i,2) = r_vec(i,2)/d(i);
end
e_vec(1,:) = e_vec(2,:);
e_vec(sz(1),:) = e_vec(sz(1)-1,:);

r = zeros(sz(1),1);
for i = 1:sz(1)
    if l(i) <= 0.5
    r(i) = alpha*(exp(theta*(0.5-l(i))^2)-1);
else
    r(i) = beta*(exp(theta*(l(i)-0.5)^2)-1);
    end
    if l(i) <= 0.5
    x_exp2(i) = point(i,1) + r(i)*e_vec(i,1);
    y_exp2(i) = point(i,2) + r(i)*e_vec(i,2);
    else
        x_exp2(i) = point(i,1) - r(i)*e_vec(i,1);
        y_exp2(i) = point(i,2) - r(i)*e_vec(i,2);
    end
end
perturbated_2(:,2*j-1) = x_exp2;
perturbated_2(:,2*j) = y_exp2;
end

% write down the perturbated contours
% writematrix(perturbated_2,'C:\Users\AT75690\Desktop\Tal corpus\fricative\perturbated\perturbated_2\sh\p2_con_day6_she_265.csv');

% plot to visualise
plot(XY(:,3),-XY(:,4),'b.-');
hold on;
plot(perturbated_2(:,3),-perturbated_2(:,4),'r.-');
hold on;

axis equal;