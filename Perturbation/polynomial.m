len = readmatrix("C:\Users\AT75690\Desktop\Tal corpus\fricative\length\sh\len_day1_she_002.csv");% add the path of the lengths' file
XY = readmatrix('C:\Users\AT75690\Desktop\Tal corpus\fricative\contours\sh\day1_she_002.csv');% add the path of the contours' file 

for j = 1:8
    x = XY(:,2*j-1);
    y = XY(:,2*j);
    l = len(:,j);
% 5th orther polynomial
order = 5;
poly_x = polyfit(l,x,order);
poly_y = polyfit(l,y,order);

% visualize the fittness
% x_re = polyval(poly_x,l);
% y_re = polyval(poly_y,l);
% plot(x,-y,'b.-');
% hold on;
% plot(x_re,-y_re,'r.-');

n = -8; % extend: n is positive; shorten: n is negative

% extend or shorten
% blue line denotes the original contour
% red line denotes the perturbed coutour
l_begin = -n/100;
l_end = 1+n/100;
l_poly = l*(l_end - l_begin)+l_begin;
x_poly = polyval(poly_x,l_poly);
y_poly = polyval(poly_y,l_poly);

perturbated_3(:,2*j-1) = x_poly;
perturbated_3(:,2*j) = y_poly;
end


% write down the perturbated contours
% writematrix(perturbated_3,'C:\Users\AT75690\Desktop\Tal corpus\fricative\perturbated\perturbated_3\sh\p3_con_day6_she_265.csv');

% plot to visualise
plot(XY(:,3),-XY(:,4),'b.-');
hold on;
plot(perturbated_3(:,3),-perturbated_3(:,4),'r.-');
hold on;

axis equal;


