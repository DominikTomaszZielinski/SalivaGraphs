clc
clear 
close all
% Set the file path
file_path = cd;  % Replace with your path
file_list = dir(fullfile(file_path, '*.txt'));  % Get all .txt files in the folder

OldMax = 60;
FlexMax = 20;

Fsize = 30;
% Number of tests (8 files)
numTests = 3;

% Create a cell array to collect data for each test (columns and rows)
data_all_tests = cell(numTests, 1);

% Variable to store the maximum number of lines across all tests
max_number_of_lines = 0;

% Load data from files and extract relevant columns (4-10) and (11-18)
for i = 1:numTests
    file_name = file_list(i).name; 
    file_path_full = fullfile(file_path, file_name);
    
    % Load the data from the file (comma delimiter)
    data = readmatrix(file_path_full, 'Delimiter', ',');
    
    % Remove the header (first row)
    data = data(2:end,:);

    % Get the maximum number of lines across all tests
    max_number_of_lines = max(max_number_of_lines, size(data, 1));
    
    % Store the data for each test
    data_all_tests{i} = data;
end

% Ensure all data arrays have the same length by padding with NaN
for i = 1:numTests
    current_length = size(data_all_tests{i}, 1);
    if current_length < max_number_of_lines
        % Pad the data with NaN to make it the same length as max_number_of_lines
        data_all_tests{i} = [data_all_tests{i}; NaN(max_number_of_lines - current_length, size(data_all_tests{i}, 2))];
    end
end

% 
T7_data = data_all_tests{1};
T8_data = data_all_tests{2};
T9_data = data_all_tests{3};  % T9 corresponds to the 7th test (index 7)


% Extract Columns (4-10) 
T7_columns = T7_data(:, 4:10);  
T8_columns = T8_data(:, 4:10);  
T9_columns = T9_data(:, 4:10);  % Columns from 4 to 10

% Extract Rows (11-18) 
T7_rows = T7_data(:, 11:18);  
T8_rows = T8_data(:, 11:18);  
T9_rows = T9_data(:, 11:18);  % Rows from 11 to 18 (columns 11 to 18)

% Replace zeros with NaN in both columns_data and rows_data
T7_columns(T7_columns == 0) = NaN;
T7_rows(T7_rows == 0) = NaN;
T8_columns(T8_columns == 0) = NaN;
T8_rows(T8_rows == 0) = NaN;
T9_columns(T9_columns == 0) = NaN;
T9_rows(T9_rows == 0) = NaN;


%% T7 Plots
% Create the figure with two subplots
figure;
set(gcf, 'Position', [100, 100, 1600, 800]);  % Increased the figure size for better visibility

% First subplot for columns without outliers
subplot(1, 2, 1);  % First subplot (1 row, 2 columns, first one)
boxplot(T7_columns, 'Labels', {'Col0', 'Col1', 'Col2', 'Col3', 'Col4', 'Col5', 'Col6'},'Whisker', Inf);  % Setting 'Whisker' to Inf eliminates outliers
title('T7 Columns (No Outliers)', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 FlexMax]);

% Second subplot for rows without outliers
subplot(1, 2, 2);  % Second subplot (1 row, 2 columns, second one)
boxplot(T7_rows, 'Labels', {'Row0', 'Row1', 'Row2', 'Row3', 'Row4', 'Row5', 'Row6', 'Row7'},'Whisker', Inf);  % Setting 'Whisker' to Inf eliminates outliers
title('T7 Rows (No Outliers)', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 FlexMax]);

% Fine-tune spacing (to reduce gaps between subplots)
set(gcf, 'Units', 'Inches', 'Position', [0 0 20 10]);  % Resize figure for better display

% Plot with outliers

% Create the figure with two subplots
figure;
set(gcf, 'Position', [100, 100, 1600, 800]);  % Increased the figure size for better visibility

% First subplot for columns
subplot(1, 2, 1);  % First subplot (1 row, 2 columns, first one)
boxplot(T7_columns, 'Labels', {'Col0', 'Col1', 'Col2', 'Col3', 'Col4', 'Col5', 'Col6'});
title('T7 Columns', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 FlexMax]);

% Second subplot for rows
subplot(1, 2, 2);  % Second subplot (1 row, 2 columns, second one)
boxplot(T7_rows, 'Labels', {'Row0', 'Row1', 'Row2', 'Row3', 'Row4', 'Row5', 'Row6', 'Row7'});
title('T7 Rows', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 FlexMax]);

% Fine-tune spacing (to reduce gaps between subplots)
set(gcf, 'Units', 'Inches', 'Position', [0 0 20 10]);  % Resize figure for better display


%% T8 Plots

% Create the figure with two subplots
figure;
set(gcf, 'Position', [100, 100, 1600, 800]);  % Increased the figure size for better visibility

% First subplot for columns without outliers
subplot(1, 2, 1);  % First subplot (1 row, 2 columns, first one)
boxplot(T8_columns, 'Labels', {'Col0', 'Col1', 'Col2', 'Col3', 'Col4', 'Col5', 'Col6'},'Whisker', Inf);  % Setting 'Whisker' to Inf eliminates outliers
title('T8 Columns (No Outliers)', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 60]);

% Second subplot for rows without outliers
subplot(1, 2, 2);  % Second subplot (1 row, 2 columns, second one)
boxplot(T8_rows, 'Labels', {'Row0', 'Row1', 'Row2', 'Row3', 'Row4', 'Row5', 'Row6', 'Row7'},'Whisker', Inf);  % Setting 'Whisker' to Inf eliminates outliers
title('T8 Rows (No Outliers)', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 60]);

% Fine-tune spacing (to reduce gaps between subplots)
set(gcf, 'Units', 'Inches', 'Position', [0 0 20 10]);  % Resize figure for better display



% Create the figure with two subplots
figure;
set(gcf, 'Position', [100, 100, 1600, 800]);  % Increased the figure size for better visibility

% First subplot for columns
subplot(1, 2, 1);  % First subplot (1 row, 2 columns, first one)
boxplot(T9_columns, 'Labels', {'Col0', 'Col1', 'Col2', 'Col3', 'Col4', 'Col5', 'Col6'});
title('T8 Columns', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 60]);

% Second subplot for rows
subplot(1, 2, 2);  % Second subplot (1 row, 2 columns, second one)
boxplot(T8_rows, 'Labels', {'Row0', 'Row1', 'Row2', 'Row3', 'Row4', 'Row5', 'Row6', 'Row7'});
title('T8 Rows', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 60]);

% Fine-tune spacing (to reduce gaps between subplots)
set(gcf, 'Units', 'Inches', 'Position', [0 0 20 10]);  % Resize figure for better display


%% T9 Plots


% Create the figure with two subplots
figure;
set(gcf, 'Position', [100, 100, 1600, 800]);  % Increased the figure size for better visibility

% First subplot for columns without outliers
subplot(1, 2, 1);  % First subplot (1 row, 2 columns, first one)
boxplot(T9_columns, 'Labels', {'Col0', 'Col1', 'Col2', 'Col3', 'Col4', 'Col5', 'Col6'},'Whisker', Inf);  % Setting 'Whisker' to Inf eliminates outliers
title('T9 Columns (No Outliers)', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 60]);

% Second subplot for rows without outliers
subplot(1, 2, 2);  % Second subplot (1 row, 2 columns, second one)
boxplot(T9_rows, 'Labels', {'Row0', 'Row1', 'Row2', 'Row3', 'Row4', 'Row5', 'Row6', 'Row7'},'Whisker', Inf);  % Setting 'Whisker' to Inf eliminates outliers
title('T9 Rows (No Outliers)', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 60]);

% Fine-tune spacing (to reduce gaps between subplots)
set(gcf, 'Units', 'Inches', 'Position', [0 0 20 10]);  % Resize figure for better display


% Create the figure with two subplots
figure;
set(gcf, 'Position', [100, 100, 1600, 800]);  % Increased the figure size for better visibility

% First subplot for columns
subplot(1, 2, 1);  % First subplot (1 row, 2 columns, first one)
boxplot(T9_columns, 'Labels', {'Col0', 'Col1', 'Col2', 'Col3', 'Col4', 'Col5', 'Col6'});
title('T9 Columns', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 60]);

% Second subplot for rows
subplot(1, 2, 2);  % Second subplot (1 row, 2 columns, second one)
boxplot(T9_rows, 'Labels', {'Row0', 'Row1', 'Row2', 'Row3', 'Row4', 'Row5', 'Row6', 'Row7'});
title('T9 Rows', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 60]);

% Fine-tune spacing (to reduce gaps between subplots)
set(gcf, 'Units', 'Inches', 'Position', [0 0 20 10]);  % Resize figure for better display



function GraphTrial(values, RowCol, Outliers)
% Values are the values you are trying to graph
% RowCol is either "rows" or "columns" and decided which is graphed
% Outliers decides whether there are outliers
% Gmin is graph minimum
% Gmax is graph maximum

figure;
set(gcf, 'Position', [100, 100, 1600, 800]);  % Increased the figure size for better visibility

% First subplot for columns
subplot(1, 2, 1);  % First subplot (1 row, 2 columns, first one)
boxplot(T9_columns, 'Labels', {'Col0', 'Col1', 'Col2', 'Col3', 'Col4', 'Col5', 'Col6'});
title('T9 Columns', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 60]);

% Second subplot for rows
subplot(1, 2, 2);  % Second subplot (1 row, 2 columns, second one)
boxplot(T9_rows, 'Labels', {'Row0', 'Row1', 'Row2', 'Row3', 'Row4', 'Row5', 'Row6', 'Row7'});
title('T9 Rows', 'Fontsize',Fsize);
ylabel('Values');
ylim([0 60]);

% Fine-tune spacing (to reduce gaps between subplots)
set(gcf, 'Units', 'Inches', 'Position', [0 0 20 10]);  % Resize figure for better display


end 