clc 
clear
%close all 

%% Main file to use  during the DataCollection DAY --> serves to obtain the contrast maps 

dirPath  = cd;
Raw_Subjects_Data = fullfile(dirPath ,"Raw_Data");
Processed_Subjects_Data=fullfile(dirPath,"Processed_Data");
disp(Raw_Subjects_Data)
disp(Processed_Subjects_Data)



%% Which version of the trackpad are you using?
ttv = 1;
%%
for Session = 1:8
    for InitEnd = 1:2
    %% Creation of the filtered data 

        Raw_Subject = fullfile(Raw_Subjects_Data, strcat("Session" + num2str(Session) + num2str(InitEnd)));
        Processed_Subject = fullfile(Processed_Subjects_Data);

        FreeExploration_Rehab(Raw_Subject,Processed_Subjects_Data, "T",7,'T',ttv,225); %Patients do 7 

        %% Create the graphs
        CreateGraphs(Processed_Subjects_Data,4,8,1);
    end 
end 


function CreateGraphs(Processed_Subjects_Data, sbRow, sbCol, sbNum)
    load(fullfile(Processed_Subjects_Data,'TotalFiltered_180Hz'))
    diamondgap = 0.45;     % Distance between capacitive diamond-centers (in cm)
    nbins = 20;            % Number of bins to use for the histograms. 
    BeginTime = 0;         % Time Range 
    EndTime = 0.5;         % (min)
    Vlims = 6; Alims = 90;
    Vedges = linspace(-Vlims, Vlims, nbins+1);
    Aedges = linspace(-Alims, Alims, nbins+1);
    Xedges = linspace(diamondgap/2, 6.5*diamondgap, nbins+1); % 7 colomns 
    Yedges = linspace(diamondgap/2, 7.5*diamondgap, nbins+1); % 8 rows 
    
    Overall_EndTime=EndTime*60*7;     
    Samples = find(Data(:, 7) > BeginTime*60 & Data(:, 7) < Overall_EndTime);
    TruncatedData = Data(Samples, :); 
    if ttv == 1
        I1 = find(TruncatedData(:,2) < .225);                               %
        I2 = find(TruncatedData(:,1) < .225 | TruncatedData(:,1) > 2.925);  %
        I3 = find(TruncatedData(:,1) < .225 | TruncatedData(:,2) > 3.35);   %
        I4 = find(TruncatedData(:,1) < .68 & TruncatedData(:,2) > 2.925);   %
        I5 = find(TruncatedData(:,1) > 2.48 & TruncatedData(:,2) > 2.925);  %
    else 
        I1 = find(TruncatedData(:,2) < .225);
        I2 = find(TruncatedData(:,1) < .225 | TruncatedData(:,1) > 2.925);
        I3 = find(TruncatedData(:,1) < .225 | TruncatedData(:,2) > 3.35);
        I4 = find(TruncatedData(:,1) < .68 & TruncatedData(:,2) > 1.985);
        I5 = find(TruncatedData(:,1) > 2.48 & TruncatedData(:,2) > 1.985);
    end 
    I = [I1; I2; I3; I4; I5]; TruncatedData(I,:) = [];
    
    PositionX = TruncatedData(:, 1);
    PositionY = TruncatedData(:, 2);   
    
    %% Position Histogram
    figure()
    %Subplots
    subplot(sbRow,sbCol,sbNum);
    ph = histogram2(PositionX, PositionY, Xedges, Yedges, 'DisplayStyle','tile', 'FaceColor','flat','Normalization','count');
    ph.EdgeColor = 'none';
    phValues = ph.Values;
    newmap=newbluewhitered(256); colormap(newmap);
    xticks([]);  yticks([]);
    axis equal;
    %% Changed to set timestamp to total time
    % TimeStamp = 180 * 7 * 30; 
    TimeStamp = 180 * TruncatedData(end,7);
    NormalizedbyTimeStamp= (ph.Values)./TimeStamp; 
    MedFiltData = medfilt2(rot90(NormalizedbyTimeStamp), 'symmetric'); 
    if ttv ==1
        MedFiltData(1:3, 1:3) = 0; MedFiltData(1:3, 18:20) = 0; % Zeroing Out-Of-Bounds Bins
    else
        MedFiltData(1:8, 1:3) = 0; MedFiltData(1:8, 18:20) = 0; % Zeroing Out-Of-Bounds Bins
    end 
    maximum = max(max(MedFiltData));
    close()
    figure()
    colormap = whiteToRed(5122*512);
    DrawMedFilt(MedFiltData,'Position Map', 20, 0, 0.0153, colormap,0, zeros(20, 20),15,0,ttv); %0.0104 is the max of the position 
    
    sub(:,:) = MedFiltData;
    if ttv == 1
    sub(1:3, 1:3) = NaN; sub(1:3, 18:20) = NaN;
    else 
    sub(1:8, 1:3) = NaN; sub(1:8, 18:20) = NaN;
    end
    
    
    %%
    load(fullfile(cd,"Time Stamp-RandHistogramData-Pos-WVForder23H"));
    HealthyModel = mean(ModelData, 4);
    Reference = mean(HealthyModel,3);
    DEMaxAnd = max(max(0.0133 - Reference));
    
    Differences = 0.0133 - Reference;
    %MaxVal = max(max(MedFiltData - Reference));
    MaxVal = max(max(Differences));
    DS_maps = DefSur_Regions(MedFiltData,ModelData,0,ttv);
    
    
    figure(2)
    
    DefExcessMap  = custom_colormap();
    DrawMedFilt(MedFiltData - Reference, "Deficit Excess Map", 10, - MaxVal, MaxVal, DefExcessMap , 1, DS_maps,10,0,ttv);
    
    
    %%
    
    histogram_=MedFiltData;
    % Calculate the 5th percentile value
    percentile_value = prctile(histogram_(:), 5);
    % Count the number of bins above the 5th percentile
    bins_above_5th_percentile = sum(histogram_(:) > percentile_value);
    % Calculate the total number of bins in the histogram
    total_bins = numel(histogram_);
    % Compute the area coverage as a percentage
    coverageVals = (bins_above_5th_percentile / total_bins) * 100;
    disp('=====================================================================')
    disp('_____________________________________________________________________')
    
    fprintf('Area Coverage: %.2f%%\n', coverageVals);
    
    PositionX = TruncatedData(:, 1); PositionY = TruncatedData(:, 2);   
    Pos = [PositionX, PositionY]; 
    kurtosisVals = BivariateKurtosis(Pos);
    fprintf('Kurtosis: %.2f%\n', kurtosisVals);
    disp(" ")
    
    mat = DS_maps;
    Pixel_Count_Def = sum(sum(mat ==  1));
    Pixel_Count_Sur = sum(sum(mat == -1));
    def_perc = sum(sum(mat == 1) )/ (20 * 20 - 48);
    sur_perc = sum(sum(mat == -1)) / (20 * 20 - 48);
    
    fprintf('Surplus Area: %.0f% \n', Pixel_Count_Sur);
    disp(' ')
    fprintf('Deficit Area: %.0f% \n', Pixel_Count_Def);
    disp(' ')
    fprintf('Surplus Area: %.2f%% \n', sur_perc);
    fprintf('Deficit Area: %.2f%% \n', def_perc);
    
    disp('_____________________________________________________________________')
    disp('=====================================================================')
end 

function DrawMedFilt(values, figtitle, titleFontSize, min, maxi,cusMap,stars,MAP,fontsize_stars,centline,ttv)
    diamondgap = 0.45;
    

    % Define the coordinate system for the image
    xData = [diamondgap/2, 6.5*diamondgap];
    yData = [diamondgap/2, 7.5*diamondgap];
    xHalfWidth = ((6.5*diamondgap-diamondgap/2)/20)/2;
    yHalfWidth = ((7.5*diamondgap-diamondgap/2)/20)/2;
    leftside = diamondgap/2-xHalfWidth;
    rightside = 6.5*diamondgap+xHalfWidth;
    lowerside = diamondgap/2-yHalfWidth;
    upside = 7.5*diamondgap+yHalfWidth;


    % Use imagesc on the current axes
    h = imagesc(xData,yData,flipud(values));
    set(gca, 'YDir', 'normal') 
    colormap(gca(), cusMap); % Apply custom colormap to the current axes
    axis equal
    clim([min maxi]); % Set color axis scaling
    axis off; % Turn off axis lines and labels
    hold on 
    if ttv == 1
        OutlineX2 = [diamondgap/2 - xHalfWidth, diamondgap/2 - xHalfWidth, 1.5*diamondgap-xHalfWidth, 1.5*diamondgap-xHalfWidth, 5.5*diamondgap+xHalfWidth, 5.5*diamondgap+xHalfWidth, 6.5*diamondgap+xHalfWidth, 6.5*diamondgap+xHalfWidth, diamondgap/2-xHalfWidth];
        OutlineY2 = [diamondgap/2 - yHalfWidth, 6.5*diamondgap+yHalfWidth, 6.5*diamondgap+yHalfWidth, 7.5*diamondgap+yHalfWidth, 7.5*diamondgap+yHalfWidth, 6.5*diamondgap+yHalfWidth, 6.5*diamondgap+yHalfWidth, diamondgap/2-yHalfWidth, diamondgap/2 - yHalfWidth];
    else 
        OutlineX2 = [diamondgap/2 - xHalfWidth, diamondgap/2 - xHalfWidth, 1.5*diamondgap-xHalfWidth, 1.5*diamondgap-xHalfWidth, 5.5*diamondgap+xHalfWidth, 5.5*diamondgap+xHalfWidth, 6.5*diamondgap+xHalfWidth, 6.5*diamondgap+xHalfWidth, diamondgap/2-xHalfWidth];
        OutlineY2 = [diamondgap/2 - yHalfWidth, 4.5*diamondgap+yHalfWidth, 4.5*diamondgap+yHalfWidth, 7.5*diamondgap+yHalfWidth, 7.5*diamondgap+yHalfWidth, 4.5*diamondgap+yHalfWidth, 4.5*diamondgap+yHalfWidth, diamondgap/2-yHalfWidth, diamondgap/2 - yHalfWidth];

    end 
    hold on 
    plot(OutlineX2,OutlineY2,"black", 'LineWidth', 1);
    hold on 
    if (stars)
        hold on 

        diamondgap = 0.45;     % Distance between capacitive diamond-centers (in cm)
        nbins = 20;            % Number of bins to use for the histograms. 
      
        Xedges = linspace(leftside, rightside, nbins+1); % 7 colomns 
        Yedges = linspace(lowerside,upside, nbins+1); % 8 rows 
        
        [rows, cols] = find(abs(rot90(MAP, -1)) == 1);
        for k = 1:length(rows)
            % Calculate the center of the bin
            xPos = (Xedges(rows(k)) + Xedges(rows(k) + 1)) / 2;
            yPos = (Yedges(cols(k)) + Yedges(cols(k) + 1)) / 2;
            
            % Place the '*' text exactly at the center of the bin
            %text(xPos-0.02, yPos-0.02, '*', 'Color', 'k', 'FontSize', fontsize_stars, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
            hold on 
            plot(xPos, yPos, '*', 'Color', 'k', 'MarkerSize', fontsize_stars,'LineWidth',0.1);
            hold on;
            hold on;
        end


    end 
    if (centline)
        %plot([0.225,1.225],[0.17,0.17],'Color','k');
    end 
    % Set title and adjust font size
    title(gca(), figtitle,  'FontWeight','normal' ,'FontSize', titleFontSize, 'Interpreter', 'none');
end


function FreeExploration_Rehab(selpath, savedest, filestr, np, ns, ttv, threshold)    
    diamondgap = 0.45;  
    if ~isfolder(selpath)
        disp(strcat("Could not find folder: ", selpath));
        return
    end
    Files = dir(selpath);
    if length(Files) == 3
        disp("1 Data in " + selpath);
        %return
    end
    ResamplingFreq = 180;  % Sampling Freq
    RawPosx = []; CalcPosx = []; Posx = []; Vx = []; Ax = []; SplineX = []; 
    RawPosy = []; CalcPosy = []; Posy = []; Vy = []; Ay = []; SplineY = []; 

    TouchSizeUI = []; TouchSizeCC = [];

    RawT = []; T = []; SplineT= [];
    TotalTime = 0;       
    
    for k = 1 : np % tries to find max 30 files in one folder
            filename = filestr + k + ".txt";     
            
            if isfile(selpath + "\" + filename)
                disp(filename);
                processed = NoiseReductionV5(strcat(selpath, "\", filename), ResamplingFreq, threshold, 0, ttv); %tongue threshold=225
                
                Posx = [Posx, processed.filteredX]; % concatnating data to creat one long veriable containing all data
                Posy = [Posy, processed.filteredY];
                RawPosx = [RawPosx, processed.UIx];
                RawPosy = [RawPosy, processed.UIy];
                CalcPosx = [CalcPosx, processed.calcx];
                CalcPosy = [CalcPosy, processed.calcy];
                SplineX = [SplineX, processed.SplineX];
                SplineY = [SplineY, processed.SplineY];
                SplineT = [SplineT, processed.FitTime];
                Vx = [Vx, processed.vx];
                Vy = [Vy, processed.vy];
                Ax = [Ax, processed.ax];
                Ay = [Ay, processed.ay];
                BigM(k,:)=[processed.numNoTouch, processed.numOOB, processed.numTooShort, processed.rawSamples];
                
                RawT = [RawT, processed.rawTime' + TotalTime];
                T  = [T, processed.FiltTime + TotalTime];
                TotalTime = TotalTime + processed.TotalTime; 
                %TotalSamples = TotalSamples + processed.rawSamples;

                tempsizeUI = [processed.touchWidth_Left', processed.touchWidth_Right', processed.touchWidth_Up', processed.touchWidth_Down'];
                TouchSizeUI = [TouchSizeUI; tempsizeUI];
                tempsizeCC = [processed.touchWidthCC_Left', processed.touchWidthCC_Right', processed.touchWidthCC_Up', processed.touchWidthCC_Down'];
                TouchSizeCC = [TouchSizeCC; tempsizeUI];
                
            end
    end   
    Data(:,1) = Posx;
    Data(:,2) = Posy;
    Data(:,3) = Vx;
    Data(:,4) = Vy;
    Data(:,5) = Ax;
    Data(:,6) = Ay;
    Data(:,7) = T;

    RawData(:, 1) = RawPosx;
    RawData(:, 2) = RawPosy;
    RawData(:, 3) = RawT;

    CalcData(:, 1) = CalcPosx;
    CalcData(:, 2) = CalcPosy;
    CalcData(:, 3) = RawT;

    Spline(:,1) = SplineX;
    Spline(:,2) = SplineY;
    Spline(:,3) = SplineT;
    

    filestr = char(filestr);

    if (filestr =="FE_InitEval_")
        filename = strcat(savedest, '\', "TF_FE_InitEval_P", num2str(np), "_Session", num2str(ns), '_180Hz');
    elseif (filestr=="FE_EndEval_")
        filename = strcat(savedest, '\', "TF_FE_EndEval_P", num2str(np), "_Session", num2str(ns), '_180Hz');
    elseif (strcat(filestr(1:end-2),'_')=="FE_Pract_")
        disp('got here');
        filename = strcat(savedest, '\', "TF_FE_"+filestr+"P", num2str(np), "_Session", num2str(ns), '_180Hz');
    elseif (filestr=="T")
        filename = strcat(savedest, '\', 'TotalFiltered_180Hz');
    end 
   
    save(filename,"Data", "RawData", "TotalTime", "Spline", "CalcData", "TouchSizeUI", "TouchSizeCC");
    disp("Saved in:");
    disp(filename);
end

function [fwhm_minus, fwhm_plus] = find_fwhm(data, targetval)
    fwhm_minus = nan; fwhm_plus = nan;    
    [maxval, maxidx] = max(data);
    if maxval == 0
        return;
    end
    if ~exist('targetval', 'var')
        targetval = maxval/2;
    end 

    for i = maxidx:-1:1
        if data(i) < targetval && isnan(fwhm_minus)  
            x1 = i;
            x2 = i+1;
            y1 = data(i);
            y2 = data(i+1);
            m = (y2-y1)/(x2-x1);
            b = y1 - m*x1;
            fwhm_minus = (targetval-b)/m;            
        end
    end
    for i = maxidx:1:length(data)
        if data(i) < targetval && isnan(fwhm_plus)  
            x1 = i;
            x2 = i-1;
            y1 = data(i);
            y2 = data(i-1);
            m = (y2-y1)/(x2-x1);
            b = y1 - m*x1;
            fwhm_plus = (targetval-b)/m;            
        end
    end

end

function k = BivariateKurtosis(X)
    % Get the dimensions of the input matrix X
    [n, p] = size(X);
    
    % Initialize an empty array to store the differences between each column and its mean
    difT = [];
    
    % Loop through each column (variable) of the data matrix X
    for j = 1:p
        % Calculate the differences and append them to difT
        difT = [difT, (X(:,j) - mean(X(:,j)))];
    end
    
    % Calculate the covariance matrix S of the input data X
    S = cov(X);
    
    % Calculate the product of difT and the inverse of the covariance matrix S
    temp = difT * inv(S);
    
    % Transpose the difT array
    dT_transpose = difT';
    
    % Initialize a variable to store the result
    D = 0;
    
    % Loop through the rows (samples) of the data matrix
    for j = 1:n
        % Calculate the squared inner product of temp(j,:) and dT_transpose(:,j)
        D = D + (temp(j, :) * dT_transpose(:, j))^2;
    end
    
    % Calculate Mardia's bivariate kurtosis by dividing D by the number of samples (n)
    k = D / n;
end

function [New] = DefSur_Regions(MedFiltData,ModelData,fig,ttv)
    diamondgap=0.45;
    % MedFiltData is the 20X20 FILE
    % ModelName is the Pathway of the Healthy model
    
    sub(:,:) = MedFiltData;
    sub(1:8, 1:3) = NaN; sub(1:8, 18:20) = NaN;
    if(fig)
        figure(1)
        subplot(1,4,1)
        imagesc(sub)
    end 
    %% Model 
    
    %Import the 16 helthy patient data and Remove the TestData  
    HealthyModel = mean(ModelData, 4);          
    Mean_model = mean(HealthyModel,3);
    Mean_model(1:8, 1:3) = NaN; Mean_model(1:8, 18:20) = NaN;
    clear 'TestData';
    clear 'ModelData';
    fprintf('Size of the Healthy Data Imported: %dx%dx%d\n', size(HealthyModel,1),size(HealthyModel,2),size(HealthyModel,3));
    
    H = NaN(20,20);
    for j = 1 : 20
        for i = 1 : 20
            %rejection of the null hypothesis: 1 --> Not normal 
            %                                  0 --> Normal 
            [h, p] = lillietest(squeeze(HealthyModel(i,j,:)));
            H(i,j)= h;
        end 
    end 
    Normality = H;
    
    Matrix_of_Differences = zeros(20,20);
    posneg = zeros(20,20);
    Matrix_of_Differences(:,:) = Mean_model - sub;
    if (fig)
        figure(1)
        subplot(1,4,2)
        imagesc(Mean_model)
        subplot(1,4,3)
        imagesc(Matrix_of_Differences)
    end 
    Matrix_of_Boostrapped_differences = zeros(1000,20,20);
    for shu=1:1000
      supp_matrix2 = Mean_model - sub;
      supp_matrix2(1:8, 1:3) = NaN;
      supp_matrix2(1:8, 18:20) = NaN;
      shu_supp_matrix2 = shuffle_within_boundary(supp_matrix2);
      Matrix_of_Boostrapped_differences(shu,:,:) = shu_supp_matrix2;
    end 
    
    if (fig)
        figure(1)
        subplot(1,4,4) 
        for shu=1:1000
            imagesc(squeeze(Matrix_of_Boostrapped_differences(shu,:,:)))
            pause(0.01)
        end 
    end 
    %%
    quantile_matrices_95=nan(20,20);
    quantile_matrices_05=nan(20,20);
    for i = 1:20
        for j = 1:20 
            if(~((i < 4 || i > 17) && (j < 9)))
                quantile_matrices_95(j,i) = prctile(Matrix_of_Boostrapped_differences(:,j,i),97.5);
                quantile_matrices_05(j,i) = prctile(Matrix_of_Boostrapped_differences(:,j,i),2.5);
            end 
        end 
    end 
    
    % Hypothesys test 
    H_matrix = zeros( 20,20,11);
    condition95=find(Matrix_of_Differences>quantile_matrices_95); % Largest positive differences DEFICIT ! (because the patient went less)
    condition05=find(Matrix_of_Differences<quantile_matrices_05); % Largest negative differences SURPLUS ! (because the patient went more)
    H_matrix(condition95)=  1; % I put a negative 
    H_matrix(condition05)= -1; % I put a positive 
    
    CI_95pct= H_matrix;
    ztestresults = zeros(20, 20);
    
    for j = 1 : 20
        for i = 1 : 20  
    
            model_bin = HealthyModel(j, i, :); 
            patient_bin = sub(j,i);
            mean_model_bin  = mean(HealthyModel(j, i, :));
            patient_bin_to_test = mean_model_bin - patient_bin; 
            % this is the value to test ( the difference between the mean
            % model bin and the patient bin ) 
    
            %Mean and STD of the distribution that we assume is to be
            %normal
            Mod_diff = mean_model_bin - model_bin; %16 value diff 
            mean_model_diff = mean(Mod_diff);
            std_model_diff =  std(Mod_diff);
    
    
            % Calculate the difference between the mean of the model and patient data
            dif = mean_model_bin - patient_bin;
            posneg = dif / abs(dif); 
    
            % Perform a Z-test to compare the patient's data to the model data
            h = ztest(patient_bin_to_test, mean_model_diff, std_model_diff);
    
            % Check if the Z-test result is NaN (not a number)
            if isnan(h)
                ztestresults(j,i) = 0; % Set the result to 0 if it's NaN
            else
                % Multiply Z-test result by posneg to detect if it's higher or lower
                ztestresults(j,i) = posneg * h;
            end
        end
    end 
         
    % Find bins not normally distributed in Model
    New=zeros(20,20); %New Significance Matrix w/ combined tests 
    for i=1:20
        for j =1:20
            if Normality(i,j) == 0  %where its normal we use Z-test
                New(i,j)= ztestresults(i,j);
            else   %if not normal we use 95% method
                New(i,j)= CI_95pct(i,j);
            end
            
        end
    end
    %%
    if (fig)
        ContrastFig = figure();
        ContrastFig.Position = [0, 50, 875/2, 950/2];
        
        ax = gca; axValues = ax.Position; imagesc(New); 
        
        map =   [0.5, 0, 0;   
                 1, 1, 1;       % White for 0
                 0, 0, 0.5];  
        
        c=colormap(map);cim([-1,1]);
        xticklabels([]);yticklabels([]);xticks([]); yticks([]);
        ax = axes;ax.Position = axValues;boundary(ttv);hold on;
        plot(NaN, 's', 'MarkerEdgeColor', [1,0,0], 'MarkerFaceColor',[1,0,0], 'DisplayName','No VF Significance');
        plot(NaN, 's', 'MarkerEdgeColor', [0,0,1], 'MarkerFaceColor',[0,0,1], 'DisplayName','VF Significance');
        xlim([diamondgap/2, 6.5*diamondgap]);ylim([diamondgap/2, 7.5*diamondgap]);
        ax.Color = 'none'; P=ax.Position;   set(gca,'visible','off');
    end 
end 




%%
function shuffled_matrix = shuffle_within_boundary(matrix)
    % Find non-NaN indices
    nonNaN_indices = find(~isnan(matrix));
    
    % Shuffle non-NaN values
    shuffled_values = matrix(nonNaN_indices(randperm(numel(nonNaN_indices))));
    
    % Assign shuffled values back to non-NaN elements in the matrix
    matrix(nonNaN_indices) = shuffled_values;
    shuffled_matrix = matrix;
end 

function boundary()
% Define the size of the diamond gap, which controls the size of the figure
diamondgap = 0.45;


if (ttv)
    OutlineX = [0,1];
    OutlineY = [0,1];
else
    % Define the x and y coordinates of the points to create a diamond shape
    OutlineX = [diamondgap/2, diamondgap/2, 1.5*diamondgap, 1.5*diamondgap, 5.5*diamondgap, 5.5*diamondgap, 6.5*diamondgap, 6.5*diamondgap, diamondgap/2];
    OutlineY = [diamondgap/2, 4.5*diamondgap, 4.5*diamondgap, 7.5*diamondgap, 7.5*diamondgap, 4.5*diamondgap, 4.5*diamondgap, diamondgap/2, diamondgap/2];

end 
% Plot the points to create the diamond shape
plot(OutlineX, OutlineY, "black", 'LineWidth', 2, 'DisplayName', 'Board Boundary');

% The following coordinates define a diamond shape:
% 1. Top-left vertex
% 2. Top-right vertex
% 3. Right-top vertex
% 4. Right-bottom vertex
% 5. Bottom-right vertex
% 6. Bottom-left vertex
% 7. Left-bottom vertex
% 8. Left-top vertex
% 9. Closing point (back to the top-left vertex)
end 
 

function newmap = newbluewhitered(m)
%BLUEWHITERED   Blue, white, and red color map.
%   BLUEWHITERED(M) returns an M-by-3 matrix containing a blue to white
%   to red colormap, with white corresponding to the CAXIS value closest
%   to zero.  This colormap is most useful for images and surface plots
%   with positive and negative values.  BLUEWHITERED, by itself, is the
%   same length as the current colormap.
%
%   Examples:
%   ------------------------------
%   figure
%   imagesc(peaks(250));
%   colormap(bluewhitered(256)), colorbar
%
%   figure
%   imagesc(peaks(250), [0 8])
%   colormap(bluewhitered), colorbar
%
%   figure
%   imagesc(peaks(250), [-6 0])
%   colormap(bluewhitered), colorbar
%
  

%
%   See also HSV, HOT, COOL, BONE, COPPER, PINK, FLAG, 
%   COLORMAP, RGBPLOT.


if nargin < 1
   m = size(get(gcf,'colormap'),1);
end



% bottom = [0 0 0.5]; %used in confsuion matrices
% botmiddle = [0 0.5 1];
% middle = [1 1 1];
% topmiddle = [1 0 0];
% top = [0.5 0 0];


bottom = [1 1 1];
%bottom = [.88 .95 .97];
botmiddle = [0 .7 1];
middle = [1 .5 .5];
topmiddle = [1 0 0];
top = [0.5 0 0];

% Find middle
lims = get(gca, 'CLim'); %
lims(1) = -1; %
lims(2) = 1; 
% Find ratio of negative to positive
if (lims(1) < 0) & (lims(2) > 0)
    % It has both negative and positive
    % Find ratio of negative to positive
    ratio = abs(lims(1)) / (abs(lims(1)) + lims(2));
    neglen = round(m*ratio);
    poslen = m - neglen;
    
    % Just negative
    new = [bottom; botmiddle; middle];
    len = length(new);
    oldsteps = linspace(0, 1, len);
    newsteps = linspace(0, 1, neglen);
    newmap1 = zeros(neglen, 3);
    
    for i=1:3
        % Interpolate over RGB spaces of colormap
        newmap1(:,i) = min(max(interp1(oldsteps, new(:,i), newsteps)', 0), 1);
    end
    
    % Just positive
    new = [middle; topmiddle; top];
    len = length(new);
    oldsteps = linspace(0, 1, len);
    newsteps = linspace(0, 1, poslen);
    newmap = zeros(poslen, 3);
    
    for i=1:3
        % Interpolate over RGB spaces of colormap
        newmap(:,i) = min(max(interp1(oldsteps, new(:,i), newsteps)', 0), 1);
    end
    
    % And put 'em together
    newmap = [newmap1; newmap];
    
elseif lims(1) >= 0
    % Just positive
    new = [middle; topmiddle; top];
    len = length(new);
    oldsteps = linspace(0, 1, len);
    newsteps = linspace(0, 1, m);
    newmap = zeros(m, 3);
    
    for i=1:3
        % Interpolate over RGB spaces of colormap
        newmap(:,i) = min(max(interp1(oldsteps, new(:,i), newsteps)', 0), 1);
    end
    
else
    % Just negative
    new = [bottom; botmiddle; middle];
    len = length(new);
    oldsteps = linspace(0, 1, len);
    newsteps = linspace(0, 1, m);
    newmap = zeros(m, 3);
    
    for i=1:3
        % Interpolate over RGB spaces of colormap
        newmap(:,i) = min(max(interp1(oldsteps, new(:,i), newsteps)', 0), 1);
    end
    
end
% 
% m = 64;
% new = [bottom; botmiddle; middle; topmiddle; top];
% % x = 1:m;
% 
% oldsteps = linspace(0, 1, 5);
% newsteps = linspace(0, 1, m);
% newmap = zeros(m, 3);
% 
% for i=1:3
%     % Interpolate over RGB spaces of colormap
%     newmap(:,i) = min(max(interp1(oldsteps, new(:,i), newsteps)', 0), 1);
% end
% 
% % set(gcf, 'colormap', newmap), colorbar

end 

function my_colormap_WtR = whiteToRed(n)

    % Function to create a colormap that goes from white to red
    % n is the number of colors in the colormap

    if nargin < 1
        n = 256;  % Default to 256 colors if no input is provided
    end
    
    % Starting color (white)
    startColor = [1, 1, 1];  % RGB for white
    % Ending color (red)
    endColor = [1, 0, 0];  % RGB for red
    
    % Initialize the colormap array with zeros
    my_colormap_WtR = zeros(n, 3);
    
    % Fill each column of the colormap
    for i = 1:3  % For each RGB component
        my_colormap_WtR(:, i) = linspace(startColor(i), endColor(i), n);
    end
end

function cmap = custom_colormap()
    % Define the number of levels for the colormap
    numLevels = 256;

    % Calculate the number of levels for negative and positive values
    numNegLevels = floor(numLevels / 2);
    numPosLevels = numLevels - numNegLevels;

    % Initialize the colormap array with white
    cmap = ones(numLevels, 3);

    % Create the blue to white gradient for negative values
    cmap(1:numNegLevels, 1) = linspace(0, 1, numNegLevels); % Red component fades in
    cmap(1:numNegLevels, 2) = linspace(0, 1, numNegLevels); % Green component fades in
    cmap(1:numNegLevels, 3) = linspace(1, 1, numNegLevels); % Blue component stays at full

    % Create the white to red gradient for positive values
    cmap(end-numPosLevels+1:end, 1) = linspace(1, 1, numPosLevels); % Red component stays at full
    cmap(end-numPosLevels+1:end, 2) = linspace(1, 0, numPosLevels); % Green component fades out
    cmap(end-numPosLevels+1:end, 3) = linspace(1, 0, numPosLevels); % Blue component fades out
end

function results = NoiseReductionV5(filename, ResamplingFreq, filterthreshold, display,ttv)
   testV=0;  sensorResolution = 0.45;

    %read file
    m1 = readtable(filename); 
    RawTime = m1.T./10^6;  
    TotalTime = 30;    % fixing this to 30 sec to reflect teh correct time, specifically to account for cases where the subjetc stops exploring before end of 30 sec as we still record 30 sec

    grids = zeros(7,8,height(m1));    % used in centroid couples capacitence calculation 
    filteredgrids = zeros(7,8,height(m1));  % used in centroid couples capacitence calculation   
    UIx = NaN(1,height(m1)); UIy = NaN(1,height(m1)); % store x and y positions from the user interface
    calcx = NaN(1,height(m1)); calcy = NaN(1,height(m1)); % centroid locations 

    % used for touch size calculations

    LastValidMaxCol = 0; LastValidMaxRow = 0; LastValidTouchWidth_Right = nan; LastValidTouchWidth_Left = nan; LastValidTouchWidth_Up = nan; LastValidTouchWidth_Down = nan; 
    touchWidth_Left = NaN(1,height(m1)); touchWidth_Right = NaN(1,height(m1)); touchWidth_Up = NaN(1,height(m1)); touchWidth_Down = NaN(1,height(m1));

    LastValidMaxCC = 0; LastValidTouchWidthCC_Right = nan; LastValidTouchWidthCC_Left = nan; LastValidTouchWidthCC_Up = nan; LastValidTouchWidthCC_Down = nan;
    touchWidthCC_Left = NaN(1,height(m1)); touchWidthCC_Right = NaN(1,height(m1)); touchWidthCC_Up = NaN(1,height(m1)); touchWidthCC_Down = NaN(1,height(m1));


    %loop through all samples (x,y, 7 column responce (columnsns), 8 rows (rowssns), time )
    for i = 1 : height(m1)
        
        columnsns = table2array(m1(i, 4 : 10));
        rowsns = table2array(m1(i, 11 : 18));
        
        %find max column and row signal
        [maxcolval, maxcolidx] = max(columnsns);         
        [maxrowval, maxrowidx] = max(rowsns); 

        %% Enforce decreasing capacitance column filtering
        filteredcolumns = columnsns;
        filteredrows = rowsns;
        intermediategrid = zeros(7,8);
        lastvalid = maxcolval;
        c = maxcolidx;
        while c > 0
            if columnsns(c) > lastvalid
                filteredcolumns(c) = lastvalid;
            end 
            if columnsns(c) <= lastvalid
                lastvalid = columnsns(c);
            end  
            c = c - 1;
        end
        lastvalid = maxcolval;
        c = maxcolidx;
        while c < 8
            if columnsns(c) > lastvalid
                filteredcolumns(c) = lastvalid;
            end 
            if columnsns(c) <= lastvalid
                lastvalid = columnsns(c);
            end  
            c = c + 1;
        end

        %% Enforce decreasing capacitance row filtering
        lastvalid = maxrowval;
        r = maxrowidx;
        while r > 0
            if rowsns(r) > lastvalid
                filteredrows(r) = lastvalid;
            end 
            if rowsns(r) <= lastvalid
                lastvalid = rowsns(r);
            end  
            r = r - 1;
        end
        lastvalid = maxrowval;
        r = maxrowidx;
        while r < 9
            if rowsns(r) > lastvalid
                filteredrows(r) = lastvalid;
            end 
            if rowsns(r) <= lastvalid
                lastvalid = rowsns(r);
            end  
            r = r + 1;
        end
        
        %% Position Calulated by User Interface, and checks if it is the same as User Interface calculation
        numerator = 0; denominator = 0;
        for c = 1 : 7
            numerator = numerator + (c-1)*filteredcolumns(c);
            denominator = denominator + filteredcolumns(c);
        end
        UIxtemp = round((numerator/denominator)*sensorResolution + sensorResolution/2, 2);
        numerator = 0; denominator = 0;
        for r = 1 : 8
            numerator = numerator + (r-1)*filteredrows(r);
            denominator = denominator + filteredrows(r);
        end
        UIytemp = round((numerator/denominator)*sensorResolution + sensorResolution/2, 2);

        %% Edge Correction from Touch Size - Raw Sensor Values
        ColArray(i, :) = columnsns;
        edgeCol = zeros(1, 9); edgeCol(2:8) = columnsns;
        RowArray(i, :) = rowsns;
        edgeRow = zeros(1, 10); edgeRow(2:9) = rowsns;
        
        % Row Correction
        if maxrowidx ~= 1 && maxrowidx ~= 8     % touch is on board and size is well defined
            [D, U] = find_fwhm(edgeRow); % forward Half Max function Kyle Designed - fwhm of raw responces appended by zeros, index of fwhm Down and UP
            touchWidth_Down(i) = UIytemp - ((D-2)*sensorResolution + sensorResolution/2); % width of the touch from the centroid at bottom
            touchWidth_Up(i) = ((U-2)*sensorResolution + sensorResolution/2) - UIytemp; % width of the touch from the centroid at top
            LastValidTouchWidth_Down = touchWidth_Down(i);
            LastValidTouchWidth_Up = touchWidth_Up(i);
            LastValidMaxRow = maxrowval; % if it is not 1 o r 8 at the edge (InVASTIGATE the HALF DIAMOND EFFECT)

        elseif maxrowidx == 1    % touch is off board on bottom, use last Y size to determine touch center
            [D, U] = find_fwhm(edgeRow, LastValidMaxRow/2);
            UIytemp = ((U-2)*sensorResolution + sensorResolution/2) - LastValidTouchWidth_Up;

        elseif maxrowidx == 8   % touch is off board on top, use last Y size to determine touch center
            [D, U] = find_fwhm(edgeRow, LastValidMaxRow/2);
            UIytemp = ((D-2)*sensorResolution + sensorResolution/2) + LastValidTouchWidth_Down;

        end
        UIy(i) = UIytemp;

        % Column Correction
        if ttv == 1

            if UIytemp < 2.925      %if touch is on bottom half of board (remmber the board is not a perfect rectangle)
                if maxcolidx ~= 1 && maxcolidx ~= 7     % touch is on board and size is well defined
                    [L, R] = find_fwhm(edgeCol);
                    touchWidth_Left(i) = UIxtemp - ((L-2)*sensorResolution + sensorResolution/2);
                    touchWidth_Right(i) = ((R-2)*sensorResolution + sensorResolution/2) - UIxtemp;
                    LastValidTouchWidth_Left = touchWidth_Left(i);
                    LastValidTouchWidth_Right = touchWidth_Right(i);
                    LastValidMaxCol = maxcolval;
                elseif maxcolidx == 1    % touch is off board on right, use last X size to determine touch center
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCol/2);                
                    UIxtemp = ((R-2)*sensorResolution + sensorResolution/2) - LastValidTouchWidth_Right;
                elseif maxcolidx == 7   % touch is off board on left, use last X size to determine touch center
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCol/2);
                    UIxtemp = ((L-2)*sensorResolution + sensorResolution/2) + LastValidTouchWidth_Left;
                end
                UIx(i) = UIxtemp;
            else  %if touch is on top half of board
                if maxcolidx > 2 && maxcolidx < 6 % touch is on board and size is well defined
                    [L, R] = find_fwhm(edgeCol);
                    touchWidth_Left(i) = UIxtemp - ((L-2)*sensorResolution + sensorResolution/2);
                    touchWidth_Right(i) = ((R-2)*sensorResolution + sensorResolution/2) - UIxtemp;
                    LastValidTouchWidth_Left = touchWidth_Left(i);
                    LastValidTouchWidth_Right = touchWidth_Right(i);
                    LastValidMaxCol = maxcolval;
                elseif maxcolidx <= 2   % touch is off board on right, use last X size to determine touch center
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCol/2);
                    UIxtemp = ((R-2)*sensorResolution + sensorResolution/2) - LastValidTouchWidth_Right;
                elseif maxcolidx >= 6   % touch is off board on left, use last X size to determine touch center
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCol/2);
                    UIxtemp = ((L-2)*sensorResolution + sensorResolution/2) + LastValidTouchWidth_Left;
                end
                UIx(i) = UIxtemp;
            end       
        else 

            if UIytemp < 1.985      %if touch is on bottom half of board (remmber the board is not a perfect rectangle)
                if maxcolidx ~= 1 && maxcolidx ~= 7     % touch is on board and size is well defined
                    [L, R] = find_fwhm(edgeCol);
                    touchWidth_Left(i) = UIxtemp - ((L-2)*sensorResolution + sensorResolution/2);
                    touchWidth_Right(i) = ((R-2)*sensorResolution + sensorResolution/2) - UIxtemp;
                    LastValidTouchWidth_Left = touchWidth_Left(i);
                    LastValidTouchWidth_Right = touchWidth_Right(i);
                    LastValidMaxCol = maxcolval;
                elseif maxcolidx == 1    % touch is off board on right, use last X size to determine touch center
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCol/2);                
                    UIxtemp = ((R-2)*sensorResolution + sensorResolution/2) - LastValidTouchWidth_Right;
                elseif maxcolidx == 7   % touch is off board on left, use last X size to determine touch center
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCol/2);
                    UIxtemp = ((L-2)*sensorResolution + sensorResolution/2) + LastValidTouchWidth_Left;
                end
                UIx(i) = UIxtemp;
            else  %if touch is on top half of board
                if maxcolidx > 2 && maxcolidx < 6 % touch is on board and size is well defined
                    [L, R] = find_fwhm(edgeCol);
                    touchWidth_Left(i) = UIxtemp - ((L-2)*sensorResolution + sensorResolution/2);
                    touchWidth_Right(i) = ((R-2)*sensorResolution + sensorResolution/2) - UIxtemp;
                    LastValidTouchWidth_Left = touchWidth_Left(i);
                    LastValidTouchWidth_Right = touchWidth_Right(i);
                    LastValidMaxCol = maxcolval;
                elseif maxcolidx <= 2   % touch is off board on right, use last X size to determine touch center
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCol/2);
                    UIxtemp = ((R-2)*sensorResolution + sensorResolution/2) - LastValidTouchWidth_Right;
                elseif maxcolidx >= 6   % touch is off board on left, use last X size to determine touch center
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCol/2);
                    UIxtemp = ((L-2)*sensorResolution + sensorResolution/2) + LastValidTouchWidth_Left;
                end
                UIx(i) = UIxtemp;
            end       
        end 
        %% Coupled Capacitence Thresholding

        % multiply row and column where they meet 
        for c = 1 : 7
            for r = 1 : 8
                if(columnsns(c) > 0 && rowsns(r) > 0)
                    grids(c,r,i) = columnsns(c) * rowsns(r); % the grid of coupled raw sensor values
                    intermediategrid(c,r) = filteredcolumns(c) * filteredrows(r); % the grid of coupled filtered sensor values
                end            
            end
        end

        % finds nearest neighbors to include in centroid clculations

        xnumerator = 0; denominator = 0; ynumerator = 0;         
        for c = 1 : 7
            for r = 1 : 8
                neighbors = zeros(1,4);
                value = intermediategrid(c,r);   
                if c > 1
                    neighbors(1) = intermediategrid(c-1,r);
                end
                if c < 7
                    neighbors(2) = intermediategrid(c+1,r);
                end
                if r > 1
                    neighbors(3) = intermediategrid(c,r-1);
                end
                if r < 8
                    neighbors(4) = intermediategrid(c,r+1);
                end
                % if this cell or any of its neighbors are above the
                % threshold, we want to include it in our centroid
                if value > filterthreshold || max(neighbors) > filterthreshold                    
                    filteredgrids(c,r,i) = value;
                    xnumerator = xnumerator + value*(c-1);
                    ynumerator = ynumerator + value*(r-1);
                    denominator = denominator + value;                
                end
            end
        end
        % calculate the centroid in x and y and convert to cm
        if denominator > 0
            calcxtemp = (xnumerator/denominator)*sensorResolution + sensorResolution/2; %   calcxtemp and calcytemp are centroid canculations 
            calcytemp = (ynumerator/denominator)*sensorResolution + sensorResolution/2;
        end

        %% Edge Correction from Touch Size - Coupled Capacitence Values - THESE ARE EXACT SAME AS ABOVE
        [maxgridval,tempI] = max(filteredgrids(:,:,i),[],"all","linear");
        [maxgridCol, maxgridRow] = ind2sub(size(filteredgrids(:,:,i)),tempI);
        edgeCol = zeros(1, 9); edgeCol(2:8) = filteredgrids(:,maxgridRow,i);        
        edgeRow = zeros(1, 10); edgeRow(2:9) = filteredgrids(maxgridCol,:,i);

        if maxgridRow ~= 1 && maxgridRow ~= 8
            [D, U] = find_fwhm(edgeRow);
            touchWidthCC_Down(i) = calcytemp - ((D-2)*sensorResolution + sensorResolution/2);
            touchWidthCC_Up(i) = ((U-2)*sensorResolution + sensorResolution/2) - calcytemp;
            LastValidTouchWidthCC_Down = touchWidthCC_Down(i);
            LastValidTouchWidthCC_Up = touchWidthCC_Up(i);
            LastValidMaxCC = maxgridval;
        elseif maxgridRow == 1
            [D, U] = find_fwhm(edgeRow, LastValidMaxCC/2);
            calcytemp = ((U-2)*sensorResolution + sensorResolution/2) - LastValidTouchWidthCC_Up;
        elseif maxgridRow == 8
            [D, U] = find_fwhm(edgeRow, LastValidMaxCC/2);
            calcytemp = ((D-2)*sensorResolution + sensorResolution/2) + LastValidTouchWidthCC_Down;
        end
        calcy(i) = round(calcytemp, 1);
        if ttv == 1
            if calcytemp < 2.925 
                if maxgridCol ~= 1 && maxgridCol ~= 7
                    [L, R] = find_fwhm(edgeCol);
                    touchWidthCC_Left(i) = calcxtemp - ((L-2)*sensorResolution + sensorResolution/2);
                    touchWidthCC_Right(i) = ((R-2)*sensorResolution + sensorResolution/2) - calcxtemp;
                    LastValidTouchWidthCC_Left = touchWidthCC_Left(i);
                    LastValidTouchWidthCC_Right = touchWidthCC_Right(i);
                    LastValidMaxCC = maxgridval;
                elseif maxgridCol == 1
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCC/2);
                    calcxtemp = ((R-2)*sensorResolution + sensorResolution/2) - LastValidTouchWidthCC_Right;
                elseif maxgridCol == 7
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCC/2);
                    calcxtemp = ((L-2)*sensorResolution + sensorResolution/2) + LastValidTouchWidthCC_Left;
                end
                calcx(i) = round(calcxtemp,1);
            else
                if maxgridCol > 2 && maxgridCol < 6
                    [L, R] = find_fwhm(edgeCol);
                    touchWidthCC_Left(i) = calcxtemp - ((L-2)*sensorResolution + sensorResolution/2);
                    touchWidthCC_Right(i) = ((R-2)*sensorResolution + sensorResolution/2) - calcxtemp;
                    LastValidTouchWidthCC_Left = touchWidthCC_Left(i);
                    LastValidTouchWidthCC_Right = touchWidthCC_Right(i);
                    LastValidMaxCC = maxgridval;
                elseif maxgridCol <= 2
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCC/2);
                    calcxtemp = ((R-2)*sensorResolution + sensorResolution/2) - LastValidTouchWidthCC_Right;
                elseif maxgridCol >= 6
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCC/2);
                    calcxtemp = ((L-2)*sensorResolution + sensorResolution/2) + LastValidTouchWidthCC_Left;
                end
                calcx(i) = round(calcxtemp,1);
            end
        else 
            if calcytemp < 1.985 
                if maxgridCol ~= 1 && maxgridCol ~= 7
                    [L, R] = find_fwhm(edgeCol);
                    touchWidthCC_Left(i) = calcxtemp - ((L-2)*sensorResolution + sensorResolution/2);
                    touchWidthCC_Right(i) = ((R-2)*sensorResolution + sensorResolution/2) - calcxtemp;
                    LastValidTouchWidthCC_Left = touchWidthCC_Left(i);
                    LastValidTouchWidthCC_Right = touchWidthCC_Right(i);
                    LastValidMaxCC = maxgridval;
                elseif maxgridCol == 1
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCC/2);
                    calcxtemp = ((R-2)*sensorResolution + sensorResolution/2) - LastValidTouchWidthCC_Right;
                elseif maxgridCol == 7
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCC/2);
                    calcxtemp = ((L-2)*sensorResolution + sensorResolution/2) + LastValidTouchWidthCC_Left;
                end
                calcx(i) = round(calcxtemp,1);
            else
                if maxgridCol > 2 && maxgridCol < 6
                    [L, R] = find_fwhm(edgeCol);
                    touchWidthCC_Left(i) = calcxtemp - ((L-2)*sensorResolution + sensorResolution/2);
                    touchWidthCC_Right(i) = ((R-2)*sensorResolution + sensorResolution/2) - calcxtemp;
                    LastValidTouchWidthCC_Left = touchWidthCC_Left(i);
                    LastValidTouchWidthCC_Right = touchWidthCC_Right(i);
                    LastValidMaxCC = maxgridval;
                elseif maxgridCol <= 2
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCC/2);
                    calcxtemp = ((R-2)*sensorResolution + sensorResolution/2) - LastValidTouchWidthCC_Right;
                elseif maxgridCol >= 6
                    [L, R] = find_fwhm(edgeCol, LastValidMaxCC/2);
                    calcxtemp = ((L-2)*sensorResolution + sensorResolution/2) + LastValidTouchWidthCC_Left;
                end
                calcx(i) = round(calcxtemp,1);
            end
        end 
    end

    %Identify invalid touches (No Touch or OUT of BOUND)
    if ttv == 1
        I1 = find(isnan(calcx)| isnan(calcy)); % no touches
        I2 = find(calcx < 0.225 | calcx > 2.925); % Out of Bounds in X
        I3 = find(calcy < 0.225 | calcy > 3.35);  % Out of Bounds in Y
        I4 = find(calcx < 0.68 & calcy > 2.925);  % Out of Bounds in top left corner
        I5 = find(calcx > 2.48 & calcy > 2.925);  % Out of Bounds in top right corner
        tempI = [I1, I2, I3, I4, I5];   
    else
        I1 = find(isnan(calcx)| isnan(calcy)); % no touches
        I2 = find(calcx < 0.225 | calcx > 2.925); % Out of Bounds in X
        I3 = find(calcy < 0.225 | calcy > 3.35);  % Out of Bounds in Y
        I4 = find(calcx < 0.68 & calcy > 1.985);  % Out of Bounds in top left corner
        I5 = find(calcx > 2.48 & calcy > 1.985);  % Out of Bounds in top right corner
        tempI = [I1, I2, I3, I4, I5];   
    end 
    numNoTouch = length(I1);
    numOOB = length(I2) + length(I3) + length(I4) + length(I5);

    %% Spline Interpolation and Low-pass Filter     
    lastTouchBegin = 1; % assume we are touching on the first sample
    touching = false; % intiolizing - we are not touching 
    masterTimeFit = []; masterTimeFilt = [];
    masterXfit = []; masterXfilt = []; masterVx = []; masterAx = []; 
    masterYfit = []; masterYfilt = []; masterVy = []; masterAy = [];    

    numTooShort = 0;
    
    %loop through all calculated positions
    for i=1 : length(calcx)
        %if this sample is an invalid touch or the end of the data and we
        %were previously touching and have been touching for a least 2
        %samples
        
        if((ismember(i, tempI) || i == length(calcx)) && touching && lastTouchBegin < i-2)
            %then we want to fit a spline to the x and y independantly 
            Xtouches = calcx(lastTouchBegin : i-1);
            Ytouches = calcy(lastTouchBegin : i-1);
            TimeRs = RawTime(lastTouchBegin):1/ResamplingFreq:RawTime(i-1);
            %% SPLINE FITTING FUNCTION CSAPS ERROR CREATOR NEEDS FIXING/UNDERSTANDING WHY IT DO WHAT IT DO
            fitresultX = csaps(RawTime(lastTouchBegin : i-1), Xtouches, 0.99999, TimeRs);
            fitresultY = csaps(RawTime(lastTouchBegin : i-1), Ytouches, 0.99999, TimeRs);
            
            %%FFT and Butterworth Filter
            xfilt = [];
            yfilt = [];
            tfilt = [];
            velocityX = []; velocityY= [];
            accelerationX = []; accelerationY = []; 

            if display
                set(0, 'CurrentFigure', xfig); % if you set to 1 you see ectra information like teh spline 
                hold on;
                plot(RawTime(lastTouchBegin : i-1), Xtouches, 'b.', 'DisplayName', "X Centroid");
                plot(TimeRs, fitresultX, 'k', 'DisplayName', "Spline Fit");
                ylabel('X Position');
                xlabel('Time (s)');

                set(0, 'CurrentFigure', yfig);    
                hold on;
                plot(RawTime(lastTouchBegin : i-1), Ytouches, 'b.', 'DisplayName', "Y Centroid");
                plot(TimeRs, fitresultY, 'k', 'DisplayName', "Spline Fit");
                ylabel('Y Position');
                xlabel('Time (s)');
            end
            
            % if we have at least 35 samples in the spline fit, perform a
            % low-pass filter
            if length(fitresultX) > 35
                fc = 6; % cut-off frequency of 6 Hz
                cutOff = fc/(ResamplingFreq/2); [b,a] = butter(5, cutOff, 'low');
                xfilt = filtfilt(b, a, fitresultX); yfilt = filtfilt(b, a, fitresultY);
                tfilt = TimeRs;

                velocityX = [NaN, diff(xfilt).*ResamplingFreq];
                velocityY = [NaN, diff(yfilt).*ResamplingFreq];
                accelerationX = NaN;
                accelerationY = NaN;
                if(length(velocityX) > 1)
                    accelerationX = [NaN, NaN, diff(velocityX(2:end)).*ResamplingFreq];
                    accelerationY = [NaN, NaN, diff(velocityY(2:end)).*ResamplingFreq];
                end

                if display
                    set(0, 'CurrentFigure', xfig);
                    hold on;                    
                    plot(TimeRs, xfilt, 'm', "DisplayName", "Low-Pass Filtered Spline");                          
                                
                    set(0, 'CurrentFigure', yfig);    
                    hold on;                     
                    plot(TimeRs, yfilt, 'm', "DisplayName", "Low-Pass Filtered Spline");                       

                    set(0, 'CurrentFigure', FFTfig); 
                    NRs = length(fitresultX); NRsH =(NRs/2);f =(1:NRs)*(ResamplingFreq/NRs);
                    Fftx = abs(fft(fitresultX)); Ffty = abs(fft(fitresultY));
                    subplot(211),plot(f(1:NRsH-1),Fftx(2:NRsH)),title('FFT of X')
                    subplot(212),plot(f(1:NRsH-1),Ffty(2:NRsH),'r'),title('FFT of Y')
                end

            else
                numTooShort = numTooShort + length(Xtouches);
            end            
            
            masterXfilt = [masterXfilt, xfilt]; % concatenating all the splines
            masterYfilt = [masterYfilt, yfilt];
            masterTimeFit = [masterTimeFit, TimeRs];
            masterTimeFilt = [masterTimeFilt, tfilt];
            masterXfit = [masterXfit, fitresultX];
            masterYfit = [masterYfit, fitresultY];
            masterVx = [masterVx, velocityX];
            masterVy = [masterVy, velocityY];
            masterAx = [masterAx, accelerationX];
            masterAy = [masterAy, accelerationY];
        end
        
        if(~ismember(i, tempI) && ~touching)        
            lastTouchBegin = i;              
        end
        touching = ~ismember(i, tempI);
    end
    
    %% return results
    results.SplineX = masterXfit;
    results.SplineY = masterYfit;
    results.filteredX = masterXfilt;
    results.filteredY = masterYfilt;
    results.UIx = UIx;
    results.UIy = UIy;
    results.touchWidth_Left = touchWidth_Left;
    results.touchWidth_Right = touchWidth_Right;
    results.touchWidth_Up = touchWidth_Up;
    results.touchWidth_Down = touchWidth_Down;
    results.calcx = calcx;
    results.calcy = calcy; 
    results.touchWidthCC_Left = touchWidthCC_Left;
    results.touchWidthCC_Right = touchWidthCC_Right;
    results.touchWidthCC_Up = touchWidthCC_Up;
    results.touchWidthCC_Down = touchWidthCC_Down;
    results.rawTime = RawTime;
    results.TotalTime = TotalTime;
    results.FitTime = masterTimeFit;
    results.FiltTime = masterTimeFilt;
    results.vx = masterVx;
    results.vy = masterVy;
    results.ax = masterAx;
    results.ay = masterAy;    

    results.grids = grids;
    results.filteredgrids = filteredgrids;

    results.numNoTouch = numNoTouch;
    results.numOOB = numOOB;
    results.numTooShort = numTooShort;
    results.rawSamples  = height(m1);

    pctNoTouch = round(numNoTouch/height(m1)*100, 2); 
    pctOOB = round(numOOB/height(m1)*100, 2);
    pctTooShort = round(numTooShort/height(m1)*100, 2);
   
   disp(strcat("No Touches: ", num2str(pctNoTouch), "% OOB: ", num2str(pctOOB), "% Too Short to Fit: ", num2str(pctTooShort), "%"));
    

end














