% resultTable = table();
% csvfiles = dir('*.csv');
% for i = 1:length(csvfiles)
%     filename = csvfiles(i).name;
%     XY = readmatrix(filename);

XY = readmatrix('C:\Users\AT75690\Desktop\Tal corpus\fricative\perturbated\perturbated_2\s\p2_con_day1_sea_131.csv');
m = size(XY, 1); % number of the points
    for i = 1:8
    x = XY(:,2*i-1);
    y = XY(:,2*i);
   
    
    mid = ceil(m/2);        % Round up
    oneThird = ceil(m / 3);  
    twoThird = ceil(m - m / 3);
    k(i) = (y(m)-y(1))/(x(m)-x(1));  %slope of the line that connects tip and rood
    A(i) = k(i);
    B(i) = -1;
    C(i) = y(1)-k(i)*x(1);

    %%%%%% DEI %%%%%
    mid_point = [x(mid),y(mid)];

    N(i) = sqrt((x(m) - x(1))^2 + (y(m) - y(1))^2);
    D(i) = abs(A(i)*mid_point(1,1)+B(i)*mid_point(1,2)+C(i))/sqrt(A(i)^2+B(i)^2);

    DEI(i) = D(i)/N(i);

    %%%%% LOC a-i %%%%%
    b_point = [x(oneThird),y(oneThird)];
    f_point = [x(twoThird),y(twoThird)];

    b(i) = abs(A(i)*b_point(1,1)+B(i)*b_point(1,2)+C(i))/sqrt(A(i)^2+B(i)^2);
    f(i) = abs(A(i)*f_point(1,1)+B(i)*f_point(1,2)+C(i))/sqrt(A(i)^2+B(i)^2);

    LOC(i) = f(i)/b(i);

    result(i,:) = [DEI(i),LOC(i)];

    end

    writematrix(result,'C:\Users\AT75690\Desktop\Tal corpus\fricative\perturbated\perturbated_2\s\p2_D&L_day1_sea_131.csv');

%     rowData = {filename,DEI(i),LOC(i)};
%     resultTable{i,:} = rowData;

%     resultTable(i,:) = {filename,DEI(i),LOC(i)};
%     result(i,:) = [DEI(i),LOC(i)];

% end

% resultTable.Properties.VariableNames = {'Filename','DEI','LOC'};
% % output = {File,result};
% writetable(resultTable,'output.csv');






