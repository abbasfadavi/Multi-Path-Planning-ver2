% Multi-path planning
clc, clear, close all
forbid = set_up; % Initialize UAV scenario and create hypothetical buildings. 'forbid' represents the location of buildings.
%% UAV properties
number_uav = 4; % User can select the number of UAVs (1 to 4).
initial_position = [1 1 1; 1 100 1; 50 1 1; 1 50 1]; % Start position of each UAV.
goal_position = [100 100 1; 100 1 1; 50 100 1; 100 50 1]; % Goal position for each UAV.
%% Find paths using an adaptation of PSO.
%% Reference paper: "Offline/Online Optimum Routing of a UAV using Auxiliary Points." International Journal of Electrical & Computer
number_auxiliary_points = 4;
best_point = zeros(number_uav, 3, number_auxiliary_points);
best_point(:,:,1) = initial_position(1:number_uav, :);
best_point(:,:,end) = goal_position(1:number_uav, :);
flag = 1;
%% Initialize the best error value.
best_er = 1000;
for tr = 1:1e4 % Try iterations
    for nu = 1:number_uav
        point(nu,:,:) = find_path6(flag, best_point(nu,:,:)); % Find path
        [e1(nu), e2(nu), e3(nu)] = check_path(forbid, point(nu,:,:)); % Evaluate path
    end
    e4 = check_paths(nu, point); % Evaluate paths collectively
    % We have 4 types of errors:
    % e1: Out of bounds
    % e2: Collision with buildings
    % e3: Sum of path lengths
    % e4: Collisions between UAVs
    if sum(e1) == 0 && sum(e2) == 0 && sum(e3) < best_er && e4 == 0
        best_er = sum(e3);
        best_point = point;
    else
        flag = -flag;
    end
end
% Display the paths
for nu = 1:number_uav
    best_path = point2path(squeeze(best_point(nu,:,:)));
    plot3(best_path(1,:), best_path(2,:), best_path(3,:));
    p = squeeze(best_point(nu,:,:));
    scatter3(p(1,:), p(2,:), p(3,:), 'filled');
end