%% Condo price estimator

%% Clear and Close Figures
clear ; close all; clc

%% Load Data
data = load('condo.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Choose some alpha value
alpha = 1.0;
num_iters = 50;

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Compute accuracy on our training set
p = (X * theta);

SSres = sum((p - y) .^ 2);
SStot = sum((y - mean(y)) .^ 2);

Rsquared = round((1 - (SSres / SStot)) * 10000) / 100;

fprintf('R^2: %f\n', Rsquared);

