%% Find Data
dirPath  = cd;
Raw_Subjects_Data = fullfile(dirPath ,"SalivaData"); %Change this if dif folder
Processed_Subjects_Data=fullfile(dirPath,"Processed_Data");
Old_Tongue = fullfile(Raw_Subjects_Data,"OldTongue");
Old_1mm = fullfile(Raw_Subjects_Data,"Old1mm");
Old_2mm = fullfile(Raw_Subjects_Data,"Old2mm");
%%
Old_3mm = fullfile(Raw_Subjects_Data,"Old3mm");

LDS_Tongue = fullfile(Raw_Subjects_Data,"LDSTongue");
LDS_1mm = fullfile(Raw_Subjects_Data,"LDS1mm");
LDS_2mm = fullfile(Raw_Subjects_Data,"LDS2mm");
LDS_3mm = fullfile(Raw_Subjects_Data,"LDS3mm");

% Flex_Tongue = fullfile(Raw_Subjects_Data,"FlexTongue");
% Flex_1mm = fullfile(Raw_Subjects_Data,"Flex1mm");
% Flex_2mm = fullfile(Raw_Subjects_Data,"Flex2mm");
% Flex_3mm = fullfile(Raw_Subjects_Data,"Flex3mm");

OLD_1mm1 = fullfile(Raw_Subjects_Data,"OLD1mm-1");
OLD_1mm2 = fullfile(Raw_Subjects_Data,"OLD1mm-2");
OLD_1mm3 = fullfile(Raw_Subjects_Data,"OLD1mm-3");
OLD_1mm4 = fullfile(Raw_Subjects_Data,"OLD1mm-4");
OLD_1mm5 = fullfile(Raw_Subjects_Data,"OLD1mm-5");
OLD_2mm1 = fullfile(Raw_Subjects_Data,"OLD2mm-1");
OLD_2mm2 = fullfile(Raw_Subjects_Data,"OLD2mm-2");
OLD_2mm3 = fullfile(Raw_Subjects_Data,"OLD2mm-3");
OLD_2mm4 = fullfile(Raw_Subjects_Data,"OLD2mm-4");
OLD_2mm5 = fullfile(Raw_Subjects_Data,"OLD2mm-5");
OLD_3mm1 = fullfile(Raw_Subjects_Data,"OLD3mm-1");
OLD_3mm2 = fullfile(Raw_Subjects_Data,"OLD3mm-2");
OLD_3mm3 = fullfile(Raw_Subjects_Data,"OLD3mm-3");
OLD_3mm4 = fullfile(Raw_Subjects_Data,"OLD3mm-4");
OLD_3mm5 = fullfile(Raw_Subjects_Data,"OLD3mm-5");


LDS_1mm1 = fullfile(Raw_Subjects_Data,"LDS1mm-1");
LDS_1mm2 = fullfile(Raw_Subjects_Data,"LDS1mm-2");
LDS_1mm3 = fullfile(Raw_Subjects_Data,"LDS1mm-3");
LDS_1mm4 = fullfile(Raw_Subjects_Data,"LDS1mm-4");
LDS_1mm5 = fullfile(Raw_Subjects_Data,"LDS1mm-5");
LDS_2mm1 = fullfile(Raw_Subjects_Data,"LDS2mm-1");
LDS_2mm2 = fullfile(Raw_Subjects_Data,"LDS2mm-2");
LDS_2mm3 = fullfile(Raw_Subjects_Data,"LDS2mm-3");
LDS_2mm4 = fullfile(Raw_Subjects_Data,"LDS2mm-4");
LDS_2mm5 = fullfile(Raw_Subjects_Data,"LDS2mm-5");
LDS_3mm1 = fullfile(Raw_Subjects_Data,"LDS3mm-1");
LDS_3mm2 = fullfile(Raw_Subjects_Data,"LDS3mm-2");
LDS_3mm3 = fullfile(Raw_Subjects_Data,"LDS3mm-3");
LDS_3mm4 = fullfile(Raw_Subjects_Data,"LDS3mm-4");
LDS_3mm5 = fullfile(Raw_Subjects_Data,"LDS3mm-5");



%% What we doing?
ttv = 1; %Tongue Trackpad Version
Subplots = 1;
TitleFont = 15;
Xfont = 12;
Yfont = 12;

%% FreeExploration_Rehab step in

disp("Old Tongue"); OTData = FreeExploration(Old_Tongue, Processed_Subjects_Data, "T",10,'T',ttv); 
disp("Old 01mm"); O1Data = FreeExploration(Old_1mm, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("Old 02mm"); O2Data = FreeExploration(Old_2mm, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("Old 03mm"); O3Data = FreeExploration(Old_3mm, Processed_Subjects_Data, "T",1,'T',ttv); 

disp("LDS Tongue"); LTData = FreeExploration(LDS_Tongue, Processed_Subjects_Data, "T",10,'T',ttv); 
disp("LDS 01mm"); L1Data = FreeExploration(LDS_1mm, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 02mm"); L2Data = FreeExploration(LDS_2mm, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 03mm"); L3Data = FreeExploration(LDS_3mm, Processed_Subjects_Data, "T",1,'T',ttv); 

% disp("Flex Tongue"); FTData = FreeExploration(Flex_Tongue, Processed_Subjects_Data, "T",10,'T',ttv); 
% disp("Flex 01mm"); F1Data = FreeExploration(Flex_1mm, Processed_Subjects_Data, "T",1,'T',ttv); 
% disp("Flex 02mm"); F2Data = FreeExploration(Flex_2mm, Processed_Subjects_Data, "T",1,'T',ttv); 
% disp("Flex 03mm"); F3Data = FreeExploration(Flex_3mm, Processed_Subjects_Data, "T",1,'T',ttv); 

%% Load all the Old saliva Data

% CHAT GPT SAYS THIS IS A SIMPLIFICATION
% % Define the levels for the OLD data
% levels = {'01mm', '02mm', '03mm'};
% numData = 5;  % Number of data points per level
% 
% % Loop through each level and process the data
% for i = 1:length(levels)
%     for j = 1:numData
%         disp(['OLD ', levels{i}, '-', num2str(j)]);  % Display the level and data point
%         % Create variable name dynamically (using eval)
%         eval([levels{i}, 'Data', num2str(j), ' = FreeExploration(OLD_', levels{i}, num2str(j), ', Processed_Subjects_Data, "T",1,''T'',ttv);']);
%     end
% end


disp("OLD 01mm-1"); O1Data1 = FreeExploration(OLD_1mm1, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 01mm-2"); O1Data2 = FreeExploration(OLD_1mm2, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 01mm-3"); O1Data3 = FreeExploration(OLD_1mm3, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 01mm-4"); O1Data4 = FreeExploration(OLD_1mm4, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 01mm-5"); O1Data5 = FreeExploration(OLD_1mm5, Processed_Subjects_Data, "T",1,'T',ttv); 

disp("OLD 02mm-1"); O2Data1 = FreeExploration(OLD_2mm1, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 02mm-2"); O2Data2 = FreeExploration(OLD_2mm2, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 02mm-3"); O2Data3 = FreeExploration(OLD_2mm3, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 02mm-4"); O2Data4 = FreeExploration(OLD_2mm4, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 02mm-5"); O2Data5 = FreeExploration(OLD_2mm5, Processed_Subjects_Data, "T",1,'T',ttv); 

disp("OLD 03mm-1"); O3Data1 = FreeExploration(OLD_3mm1, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 03mm-2"); O3Data2 = FreeExploration(OLD_3mm2, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 03mm-3"); O3Data3 = FreeExploration(OLD_3mm3, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 03mm-4"); O3Data4 = FreeExploration(OLD_3mm4, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("OLD 03mm-5"); O3Data5 = FreeExploration(OLD_3mm5, Processed_Subjects_Data, "T",1,'T',ttv); 




%% Load all the LDS saliva data
disp("LDS 01mm-1"); L1Data1 = FreeExploration(LDS_1mm1, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 01mm-2"); L1Data2 = FreeExploration(LDS_1mm2, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 01mm-3"); L1Data3 = FreeExploration(LDS_1mm3, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 01mm-4"); L1Data4 = FreeExploration(LDS_1mm4, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 01mm-5"); L1Data5 = FreeExploration(LDS_1mm5, Processed_Subjects_Data, "T",1,'T',ttv); 

disp("LDS 02mm-1"); L2Data1 = FreeExploration(LDS_2mm1, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 02mm-2"); L2Data2 = FreeExploration(LDS_2mm2, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 02mm-3"); L2Data3 = FreeExploration(LDS_2mm3, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 02mm-4"); L2Data4 = FreeExploration(LDS_2mm4, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 02mm-5"); L2Data5 = FreeExploration(LDS_2mm5, Processed_Subjects_Data, "T",1,'T',ttv); 

disp("LDS 03mm-1"); L3Data1 = FreeExploration(LDS_3mm1, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 03mm-2"); L3Data2 = FreeExploration(LDS_3mm2, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 03mm-3"); L3Data3 = FreeExploration(LDS_3mm3, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 03mm-4"); L3Data4 = FreeExploration(LDS_3mm4, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 03mm-5"); L3Data5 = FreeExploration(LDS_3mm5, Processed_Subjects_Data, "T",1,'T',ttv); 

%%


%% [OutData] = plotData3 (subX, subY, subNum, Data, name, TM, FullFirstLast, MaximumX,MaxXStats, TitleFont, Xfont, Yfont, yCustom, ymin, ymax)
%% Plot the old device data in a 5 by 4 plots Total
TitleFont = 12;
Xfont = 10;
Yfont = 12;

figure()
OTStats = plotData3(4,6,[1,2,3,4,5,6],OTData,"Tongue Saliva", "Tot", "Full", 300, 300, TitleFont,Xfont,Yfont,1,0,400);
O1Stats = plotData3(4,6,7,O1Data,"T1 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);
O2Stats = plotData3(4,6,13,O2Data,"T1 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);
O3Stats = plotData3(4,6,19,O3Data,"T1 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);

O1Stats1 = plotData3(4,6,8,O1Data1,"T2 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);
O1Stats2 = plotData3(4,6,9,O1Data2,"T3 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);
O1Stats3 = plotData3(4,6,10,O1Data3,"T4 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);
O1Stats4 = plotData3(4,6,11,O1Data4,"T5 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);
O1Stats5 = plotData3(4,6,12,O1Data5,"T6 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);

O2Stats1 = plotData3(4,6,14,O2Data1,"T2 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);
O2Stats2 = plotData3(4,6,15,O2Data2,"T3 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);
O2Stats3 = plotData3(4,6,16,O2Data3,"T4 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);
O2Stats4 = plotData3(4,6,17,O2Data4,"T5 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);
O2Stats5 = plotData3(4,6,18,O2Data5,"T6 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);

O3Stats1 = plotData3(4,6,20,O3Data1,"T2 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);
O3Stats2 = plotData3(4,6,21,O3Data2,"T3 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);
O3Stats3 = plotData3(4,6,22,O3Data3,"T4 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);
O3Stats4 = plotData3(4,6,23,O3Data4,"T5 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);
O3Stats5 = plotData3(4,6,24,O3Data5,"T6 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);
%% LDS figure Sum Capacitance
TitleFont = 12;
Xfont = 10;
Yfont = 12;

figure();
LTStats = plotData3(4,6,[1,2,3,4,5,6],LTData,"Tongue Saliva", "Tot", "Full", 300, 300, TitleFont,Xfont,Yfont,1,0,200);
L1Stats = plotData3(4,6,7,L1Data,"T1 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);
L2Stats = plotData3(4,6,13,L2Data,"T1 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);
L3Stats = plotData3(4,6,19,L3Data,"T1 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);

L1Stats1 = plotData3(4,6,8,L1Data1,"T2 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);
L1Stats2 = plotData3(4,6,9,L1Data2,"T3 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);
L1Stats3 = plotData3(4,6,10,L1Data3,"T4 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);
L1Stats4 = plotData3(4,6,11,L1Data4,"T5 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);
L1Stats5 = plotData3(4,6,12,L1Data5,"T6 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);

L2Stats1 = plotData3(4,6,14,L2Data1,"T2 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);
L2Stats2 = plotData3(4,6,15,L2Data2,"T3 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);
L2Stats3 = plotData3(4,6,16,L2Data3,"T4 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);
L2Stats4 = plotData3(4,6,17,L2Data4,"T5 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);
L2Stats5 = plotData3(4,6,18,L2Data5,"T6 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);

L3Stats1 = plotData3(4,6,20,L3Data1,"T2 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L3Stats2 = plotData3(4,6,21,L3Data2,"T3 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L3Stats3 = plotData3(4,6,22,L3Data3,"T4 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L3Stats4 = plotData3(4,6,23,L3Data4,"T5 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L3Stats5 = plotData3(4,6,24,L3Data5,"T6 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);


%%

%% One plot with all sum figures on it at once
TitleFont = 15;
Xfont = 9;
Yfont = 8;
figure()

OTStats = plotData3(8,6,[1,2,3,4,5,6],OTData,"OLD Tongue Saliva", "Tot", "Full", 300, 300, TitleFont,Xfont,Yfont,1,0,400);
TitleFont = 9;
O1Stats = plotData3(8,6,7,O1Data,"OLD T1 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);
O2Stats = plotData3(8,6,13,O2Data,"OLD T1 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);
O3Stats = plotData3(8,6,19,O3Data,"OLD T1 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);

O1Stats1 = plotData3(8,6,8,O1Data1,"OLD T2 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);
O1Stats2 = plotData3(8,6,9,O1Data2,"OLD T3 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);
O1Stats3 = plotData3(8,6,10,O1Data3,"OLD T4 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);
O1Stats4 = plotData3(8,6,11,O1Data4,"OLD T5 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);
O1Stats5 = plotData3(8,6,12,O1Data5,"OLD T6 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,80);

O2Stats1 = plotData3(8,6,14,O2Data1,"OLD T2 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);
O2Stats2 = plotData3(8,6,15,O2Data2,"OLD T3 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);
O2Stats3 = plotData3(8,6,16,O2Data3,"OLD T4 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);
O2Stats4 = plotData3(8,6,17,O2Data4,"OLD T5 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);
O2Stats5 = plotData3(8,6,18,O2Data5,"OLD T6 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,110);

O3Stats1 = plotData3(8,6,20,O3Data1,"OLD T2 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);
O3Stats2 = plotData3(8,6,21,O3Data2,"OLD T3 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);
O3Stats3 = plotData3(8,6,22,O3Data3,"OLD T4 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);
O3Stats4 = plotData3(8,6,23,O3Data4,"OLD T5 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);
O3Stats5 = plotData3(8,6,24,O3Data5,"OLD T6 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,150);

TitleFont=15;
LTStats = plotData3(8,6,[25,26,27,28,29,30],LTData,"LDS Tongue Saliva", "Tot", "Full", 300, 300, TitleFont,Xfont,Yfont,1,0,200);
TitleFont=9;
L1Stats = plotData3(8,6,31,L1Data,"LDS T1 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);
L2Stats = plotData3(8,6,37,L2Data,"LDS T1 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);
L3Stats = plotData3(8,6,43,L3Data,"LDS T1 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);

L1Stats1 = plotData3(8,6,32,L1Data1,"LDS T2 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);
L1Stats2 = plotData3(8,6,33,L1Data2,"LDS T3 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);
L1Stats3 = plotData3(8,6,34,L1Data3,"LDS T4 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);
L1Stats4 = plotData3(8,6,35,L1Data4,"LDS T5 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);
L1Stats5 = plotData3(8,6,36,L1Data5,"LDS T6 1mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,50);

L2Stats1 = plotData3(8,6,38,L2Data1,"LDS T2 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);
L2Stats2 = plotData3(8,6,39,L2Data2,"LDS T3 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);
L2Stats3 = plotData3(8,6,40,L2Data3,"LDS T4 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);
L2Stats4 = plotData3(8,6,41,L2Data4,"LDS T5 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);
L2Stats5 = plotData3(8,6,42,L2Data5,"LDS T6 2mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,100);

L3Stats1 = plotData3(8,6,44,L3Data1,"LDS T2 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L3Stats2 = plotData3(8,6,45,L3Data2,"LDS T3 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L3Stats3 = plotData3(8,6,46,L3Data3,"LDS T4 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L3Stats4 = plotData3(8,6,47,L3Data4,"LDS T5 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L3Stats5 = plotData3(8,6,48,L3Data5,"LDS T6 3mm Saliva", "Tot", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);



%% Multiplicative Old Device Data
TitleFont = 12;
Xfont = 10;
Yfont = 10;

figure()
OTStatsM = plotData3(4,6,[1,2,3,4,5,6],OTData,"Tongue Saliva", "Mult", "Full", 300, 300, TitleFont,Xfont,Yfont,1,0,2200);
O1StatsM = plotData3(4,6,7,O1Data,"T1 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);
O2StatsM = plotData3(4,6,13,O2Data,"T1 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);
O3StatsM = plotData3(4,6,19,O3Data,"T1 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);

O1StatsM1 = plotData3(4,6,8,O1Data1,"T2 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);
O1StatsM2 = plotData3(4,6,9,O1Data2,"T3 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);
O1StatsM3 = plotData3(4,6,10,O1Data3,"T4 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);
O1StatsM4 = plotData3(4,6,11,O1Data4,"T5 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);
O1StatsM5 = plotData3(4,6,12,O1Data5,"T6 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);

O2StatsM1 = plotData3(4,6,14,O2Data1,"T2 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);
O2StatsM2 = plotData3(4,6,15,O2Data2,"T3 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);
O2StatsM3 = plotData3(4,6,16,O2Data3,"T4 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);
O2StatsM4 = plotData3(4,6,17,O2Data4,"T5 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);
O2StatsM5 = plotData3(4,6,18,O2Data5,"T6 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);

O3StatsM1 = plotData3(4,6,20,O3Data1,"T2 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);
O3StatsM2 = plotData3(4,6,21,O3Data2,"T3 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);
O3StatsM3 = plotData3(4,6,22,O3Data3,"T4 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);
O3StatsM4 = plotData3(4,6,23,O3Data4,"T5 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);
O3StatsM5 = plotData3(4,6,24,O3Data5,"T6 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);

%% LDS figure Mult Capacitance
TitleFont = 12;
Xfont = 10;
Yfont = 10;

figure();
LTStatsM = plotData3(4,6,[1,2,3,4,5,6],LTData,"Tongue Saliva", "Mult", "Full", 300, 300, TitleFont,Xfont,Yfont,1,0,600);
L1StatsM = plotData3(4,6,7,L1Data,"T1 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L2StatsM = plotData3(4,6,13,L2Data,"T1 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);
L3StatsM = plotData3(4,6,19,L3Data,"T1 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);

L1StatsM1 = plotData3(4,6,8,L1Data1,"T2 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L1StatsM2 = plotData3(4,6,9,L1Data2,"T3 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L1StatsM3 = plotData3(4,6,10,L1Data3,"T4 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L1StatsM4 = plotData3(4,6,11,L1Data4,"T5 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L1StatsM5 = plotData3(4,6,12,L1Data5,"T6 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);

L2StatsM1 = plotData3(4,6,14,L2Data1,"T2 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);
L2StatsM2 = plotData3(4,6,15,L2Data2,"T3 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);
L2StatsM3 = plotData3(4,6,16,L2Data3,"T4 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);
L2StatsM4 = plotData3(4,6,17,L2Data4,"T5 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);
L2StatsM5 = plotData3(4,6,18,L2Data5,"T6 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);

L3StatsM1 = plotData3(4,6,20,L3Data1,"T2 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);
L3StatsM2 = plotData3(4,6,21,L3Data2,"T3 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);
L3StatsM3 = plotData3(4,6,22,L3Data3,"T4 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);
L3StatsM4 = plotData3(4,6,23,L3Data4,"T5 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);
L3StatsM5 = plotData3(4,6,24,L3Data5,"T6 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);

%% GPT simplification
% TitleFont = 12; Xfont = 10; Yfont = 10; figure();
% 
% datasets = { ...
%     {LTData, "Tongue Saliva", [1,2,3,4,5,6], 300}, ...
%     {L1Data, "T1 1mm Saliva", 7, 120}, ...
%     {L2Data, "T1 2mm Saliva", 13, 260}, ...
%     {L3Data, "T1 3mm Saliva", 19, 280} ...
% };
% 
% L1Datas = {L1Data1, L1Data2, L1Data3, L1Data4, L1Data5};
% L2Datas = {L2Data1, L2Data2, L2Data3, L2Data4, L2Data5};
% L3Datas = {L3Data1, L3Data2, L3Data3, L3Data4, L3Data5};
% saliva_types = {L1Datas, L2Datas, L3Datas};
% 
% % Store results in a structured array
% Results = struct();
% 
% % Plot main datasets
% for i = 1:length(datasets)
%     data = datasets{i};
%     field_name = sprintf('L%dStatsM', i);
%     Results.(field_name) = plotData3(4, 6, data{3}, data{1}, data{2}, 'Mult', 'First', 30, 8, TitleFont, Xfont, Yfont, 1, 0, data{4});
% end
% 
% % Plot saliva datasets
% for i = 1:length(saliva_types)
%     for j = 1:5
%         field_name = sprintf('L%dStatsM%d', i+1, j);
%         index = (i+1) * 6 + j;
%         Results.(field_name) = plotData3(4, 6, index, saliva_types{i}{j}, sprintf('T%d %dmm Saliva', j+1, i+1), ...
%             'Mult', 'First', 30, 8, TitleFont, Xfont, Yfont, 1, 0, datasets{i+1}{4});
%     end
% end

%% Multiplicative Both Devices in 1 fig
TitleFont = 15;
Xfont = 9;
Yfont = 8;

figure()
OTStatsM = plotData3(8,6,[1,2,3,4,5,6],OTData,"OLD Tongue Saliva", "Mult", "Full", 300, 300, TitleFont,Xfont,Yfont,1,0,2200);
TitleFont = 9;
O1StatsM = plotData3(8,6,7,O1Data,"T1 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);
O2StatsM = plotData3(8,6,13,O2Data,"T1 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);
O3StatsM = plotData3(8,6,19,O3Data,"T1 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);

O1StatsM1 = plotData3(8,6,8,O1Data1,"T2 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);
O1StatsM2 = plotData3(8,6,9,O1Data2,"T3 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);
O1StatsM3 = plotData3(8,6,10,O1Data3,"T4 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);
O1StatsM4 = plotData3(8,6,11,O1Data4,"T5 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);
O1StatsM5 = plotData3(8,6,12,O1Data5,"T6 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,270);

O2StatsM1 = plotData3(8,6,14,O2Data1,"T2 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);
O2StatsM2 = plotData3(8,6,15,O2Data2,"T3 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);
O2StatsM3 = plotData3(8,6,16,O2Data3,"T4 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);
O2StatsM4 = plotData3(8,6,17,O2Data4,"T5 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);
O2StatsM5 = plotData3(8,6,18,O2Data5,"T6 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,600);

O3StatsM1 = plotData3(8,6,20,O3Data1,"T2 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);
O3StatsM2 = plotData3(8,6,21,O3Data2,"T3 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);
O3StatsM3 = plotData3(8,6,22,O3Data3,"T4 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);
O3StatsM4 = plotData3(8,6,23,O3Data4,"T5 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);
O3StatsM5 = plotData3(8,6,24,O3Data5,"T6 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,800);

TitleFont = 15;

LTStatsM = plotData3(8,6,[25,26,27,28,29,30],LTData,"LDS Tongue Saliva", "Mult", "Full", 300, 300, TitleFont,Xfont,Yfont,1,0,600);
TitleFont = 9;
L1StatsM = plotData3(8,6,31,L1Data,"T1 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L2StatsM = plotData3(8,6,37,L2Data,"T1 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);
L3StatsM = plotData3(8,6,43,L3Data,"T1 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);

L1StatsM1 = plotData3(8,6,32,L1Data1,"T2 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L1StatsM2 = plotData3(8,6,33,L1Data2,"T3 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L1StatsM3 = plotData3(8,6,34,L1Data3,"T4 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L1StatsM4 = plotData3(8,6,35,L1Data4,"T5 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);
L1StatsM5 = plotData3(8,6,36,L1Data5,"T6 1mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,120);

L2StatsM1 = plotData3(8,6,38,L2Data1,"T2 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);
L2StatsM2 = plotData3(8,6,39,L2Data2,"T3 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);
L2StatsM3 = plotData3(8,6,40,L2Data3,"T4 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);
L2StatsM4 = plotData3(8,6,41,L2Data4,"T5 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);
L2StatsM5 = plotData3(8,6,42,L2Data5,"T6 2mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,260);

L3StatsM1 = plotData3(8,6,44,L3Data1,"T2 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);
L3StatsM2 = plotData3(8,6,45,L3Data2,"T3 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);
L3StatsM3 = plotData3(8,6,46,L3Data3,"T4 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);
L3StatsM4 = plotData3(8,6,47,L3Data4,"T5 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);
L3StatsM5 = plotData3(8,6,48,L3Data5,"T6 3mm Saliva", "Mult", "First", 30, 8, TitleFont,Xfont,Yfont,1,0,280);


%% Old Device SUM
MakeTable2(OTStats, O1Stats, O1Stats1, O1Stats2, O1Stats3, O1Stats4, O1Stats5, O2Stats, O2Stats1, O2Stats2, O2Stats3, O2Stats4, O2Stats5, O3Stats, O3Stats1, O3Stats2, O3Stats3, O3Stats4, O3Stats5, "OLD Device Summative");

%% LDS Device SUM
MakeTable2(LTStats, L1Stats, L1Stats1, L1Stats2, L1Stats3, L1Stats4, L1Stats5, L2Stats, L2Stats1, L2Stats2, L2Stats3, L2Stats4, L2Stats5, L3Stats, L3Stats1, L3Stats2, L3Stats3, L3Stats4, L3Stats5, "LDS Device Summative");

%% Old Device Mult
MakeTable2(OTStatsM, O1StatsM, O1StatsM1, O1StatsM2, O1StatsM3, O1StatsM4, O1StatsM5, O2StatsM, O2StatsM1, O2StatsM2, O2StatsM3, O2StatsM4, O2StatsM5, O3StatsM, O3StatsM1, O3StatsM2, O3StatsM3, O3StatsM4, O3StatsM5, "OLD Device Multiplicative");

%% LDS Device Mult
MakeTable2(LTStatsM, L1StatsM, L1StatsM1, L1StatsM2, L1StatsM3, L1StatsM4, L1StatsM5, L2StatsM, L2StatsM1, L2StatsM2, L2StatsM3, L2StatsM4, L2StatsM5, L3StatsM, L3StatsM1, L3StatsM2, L3StatsM3, L3StatsM4, L3StatsM5, "LDS Device Multiplicative");

%%
function MakeTable2 (OutData1,OutData2,OutData3,OutData4,OutData5,OutData6,OutData7, OutData8, OutData9,OutData10,OutData11,OutData12,OutData13,OutData14,OutData15, OutData16, OutData17, OutData18, OutData19, TableName)

    figure();
    Stats = {'Tongue', OutData1.meanVal, OutData1.stdDev, OutData1.GMin,OutData1.GMax;
           '1mm-1', OutData2.meanVal, OutData2.stdDev, OutData2.GMin,OutData2.GMax;
           '1mm-2', OutData3.meanVal, OutData3.stdDev, OutData3.GMin,OutData3.GMax;
           '1mm-3', OutData4.meanVal, OutData4.stdDev, OutData4.GMin,OutData4.GMax;
           '1mm-4', OutData5.meanVal, OutData5.stdDev, OutData5.GMin,OutData5.GMax;
           '1mm-5', OutData6.meanVal, OutData6.stdDev, OutData6.GMin,OutData6.GMax;
           '1mm-6', OutData7.meanVal, OutData7.stdDev, OutData7.GMin,OutData7.GMax;
           '2mm-1', OutData8.meanVal, OutData8.stdDev, OutData8.GMin,OutData8.GMax;
           '2mm-2', OutData9.meanVal, OutData9.stdDev, OutData9.GMin,OutData9.GMax;
           '2mm-3', OutData10.meanVal, OutData10.stdDev, OutData10.GMin,OutData10.GMax;
           '2mm-4', OutData11.meanVal, OutData11.stdDev, OutData11.GMin,OutData11.GMax;
           '2mm-5', OutData12.meanVal, OutData12.stdDev, OutData12.GMin,OutData12.GMax;
           '2mm-6', OutData13.meanVal, OutData13.stdDev, OutData13.GMin,OutData13.GMax;
           '3mm-1', OutData14.meanVal, OutData14.stdDev, OutData14.GMin,OutData14.GMax;
           '3mm-2', OutData15.meanVal, OutData15.stdDev, OutData15.GMin,OutData15.GMax;
           '3mm-3', OutData16.meanVal, OutData16.stdDev, OutData16.GMin,OutData16.GMax;
           '3mm-4', OutData17.meanVal, OutData17.stdDev, OutData17.GMin,OutData17.GMax;
           '3mm-5', OutData18.meanVal, OutData18.stdDev, OutData18.GMin,OutData18.GMax;
           '3mm-6', OutData19.meanVal, OutData19.stdDev, OutData19.GMin,OutData19.GMax};

    t = uitable('Data',Stats,'ColumnName',{'Trial','Mean','StdDev','Min','Max'},'Position',[110,10,410,365]);
    titleText = strcat(TableName + ' Stats');
    text(0.5, 0.95, titleText, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', 'FontSize', 14);
    axis off;
    

    
    figure();
    
    AvStats = {'Tongue', OutData1.meanVal, OutData1.stdDev, OutData1.GMin, OutData1.GMax;
                '1mm',round(mean(cell2mat(Stats(2:7,2))),2),round(mean(cell2mat(Stats(2:7,3))),2),round(mean(cell2mat(Stats(2:7,4))),2),round(mean(cell2mat(Stats(2:7,5))),2);
                '2mm',round(mean(cell2mat(Stats(8:13,2))),2),round(mean(cell2mat(Stats(8:13,3))),2),round(mean(cell2mat(Stats(8:13,4))),2),round(mean(cell2mat(Stats(8:13,5))),2);
                '3mm',round(mean(cell2mat(Stats(14:19,2))),2),round(mean(cell2mat(Stats(14:19,3))),2),round(mean(cell2mat(Stats(14:19,4))),2),round(mean(cell2mat(Stats(14:19,5))),2)};
    t = uitable('Data',AvStats,'ColumnName',{'Trial','Mean','StdDev','Min','Max'},'Position',[110,10,410,335]);
    titleText = strcat(TableName + ' Average Trial Stats');
    text(0.5, 0.95, titleText, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', 'FontSize', 14);
    axis off;
    


end 

function plotDataSameGraph (subX, subY, subNum, Data, name, TM, FullFirstLast, MaximumX, MaxXStats, TitleFont, Xfont, Yfont, yCustom, ymin, ymax)

end 

function [OutData] = plotData3 (subX, subY, subNum, Data, name, TM, FullFirstLast, MaximumX, MaxXStats, TitleFont, Xfont, Yfont, yCustom, ymin, ymax)
    %% Input names
    % subX - subplot x total
    % subY - subplot y total
    % subNum - subplot number
    % Data - The data you are inputting
    % name - the name on the graph
    % TM - "Tot" or "Mult" - if you want the total summative capacitance or the multiplicative capacitance
    % FullFirstLast - "Full" or "First" - If you want the full duration to be used for calculations or just the first however many seconds.
    % MaximumX - Maximum X displaayed on graph
    % MaxXStats - Maximum X used in calculations
    % TitleFont - How big you want the title to be
    % Xfont - Size of X font
    % Yfont - Size of Y font
    % yCustom - whether you want to use custom y values or have matlab choose. Good for an initial run to see where y should be
    % ymin - minimum Y on the graph to scale it
    % ymax - maximum Y on the graph to scale it

    %% Plotting Data

    SecTime = Data.TimeData;
    cap = Data.CapData;
    TotalCap = Data.TotalCap;
    MaxMultCap = Data.MultCap;
    MaxRow = Data.MaximumRowValue;
    MaxCol = Data.MaximumColumnValue;

    if FullFirstLast == "Full"
        if TM == "Tot"
            subplot(subX,subY,subNum);
            plot(SecTime,TotalCap);
            ax = gca;
            ax.Title.String = strcat(name + " 5 MIN FE Sum");
            ax.Title.FontSize = TitleFont;
            ax.XLabel.String = 'Time (Seconds)';
            ax.XAxis.FontSize = Xfont;
            ax.YLabel.String = 'Sum Capacitance';
            ax.YAxis.FontSize = Yfont;
            ax.XLim = [0,MaximumX];
            axlim = xlim;
            aGraphMaxX = axlim(2);
            ax.XLim = [0, aGraphMaxX]; 
            
            if yCustom ==1
                ax.YLim = [ymin,ymax];
            end             
            aylim = ax.YLim;
            aGraphMaxY = aylim(2);
            yticks(0:aGraphMaxY/5:aGraphMaxY); % 10 ticks

            TargetTime = MaxXStats;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            TotalCapS = TotalCap(1:TargetIndex);
            
            
            % Graph mean & +-STDev
            TotalCapNonZero = TotalCapS(TotalCapS > 0);
            GMin = min(TotalCapNonZero);
            GMax = max(TotalCapNonZero);
            meanVal = mean(TotalCapNonZero);
            stdDev = std(TotalCapNonZero);
            if isnan(meanVal)
                meanVal = 0;
            end 
            if isnan(stdDev)
                stdDev = 0;
            end 
            % Plot mean and SD ranges
        elseif TM == "Mult"
    
            %% Plotting the data
            subplot(subX,subY,subNum);
            plot(SecTime,MaxMultCap);
            bx = gca;
            bx.Title.String = strcat(name + ' 5 MIN FE Mult');
            bx.Title.FontSize = TitleFont;
            bx.XLabel.String = 'Time (Seconds)';
            bx.XAxis.FontSize = Xfont;
            bx.YLabel.String = 'Multiplicative Capacitance';
            bx.YAxis.FontSize = Yfont;    
            bx.XLim = [0,MaximumX];
            bxlim = xlim;
            bGraphMaxX = bxlim(2);
            bx.XLim = [0, bGraphMaxX]; %First 60 sec, for constant

            if yCustom ==1
                bx.YLim = [ymin,ymax];
            end 
            bylim=ylim;
            bGraphMaxY = bylim(2);
            yticks(0:bGraphMaxY/5:bGraphMaxY); % 10 ticks

            TargetTime = MaxXStats;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            MaxMultCapS = MaxMultCap(1:TargetIndex);
            

            % Graph mean & +-STDev
            MaxMultCapNonZero = MaxMultCapS(MaxMultCapS > 0);
            GMin = min(MaxMultCapNonZero);
            GMax = max(MaxMultCapNonZero);
            meanVal = mean(MaxMultCapNonZero);
            stdDev = std(MaxMultCapNonZero);
            if isnan(meanVal)
                meanVal = 0;
            end 
            if isnan(stdDev)
                stdDev = 0;
            end 
            
        end 
    elseif FullFirstLast == "First"
        if TM == "Tot"
            %% Plotting the data
            subplot(subX,subY,subNum);
            plot(SecTime,TotalCap);
            cx = gca;
            cx.Title.String = strcat(name + " First 30 sec FE");
            cx.Title.FontSize = TitleFont;
            cx.XLabel.String = 'Time (Seconds)';
            cx.XAxis.FontSize = Xfont;
            cx.YLabel.String = 'Sum Capacitance';
            cx.YAxis.FontSize = Yfont;
            cx.XLim = [0,MaximumX];

            
            cxlim = xlim;
            cGraphMaxX = cxlim(2);
            cx.XLim = [0, cGraphMaxX];

            if yCustom ==1
                cx.YLim = [ymin,ymax];
            end 
            cylim=ylim;
            cGraphMaxY = cylim(2);
            yticks(0:cGraphMaxY/5:cGraphMaxY); % 10 ticks
            
            % Plot mean and +-SD
            % Limit data to 30 seconds for calculations
            TargetTime = MaxXStats;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            TotalCapS = TotalCap(1:TargetIndex);

            % Calc Mean and SD
            TotalCapNonZero = TotalCapS(TotalCapS>0);
            GMin = min(TotalCapNonZero);
            GMax = max(TotalCapNonZero);
            meanVal = mean(TotalCapNonZero);
            stdDev = std(TotalCapNonZero);
            if isnan(meanVal)
                meanVal = 0;
            end 
            if isnan(stdDev)
                stdDev = 0;
            end 
            % Plot mean and SD ranges
        end 
        if TM == "Mult"
            %% Plotting the data
            subplot(subX,subY,subNum);
            plot(SecTime,MaxMultCap);
            dx = gca;
            dx.Title.String = strcat(name + " First 30sec FE");
            % bx.Title.String = 'Constant Saliva 30sec FE Peak Capacitance Multiplied';
            % bx.Title.String = 'Constant Saliva 30sec FE Peak Capacitance Multiplied';
            dx.Title.FontSize = TitleFont;
            dx.XLabel.String = 'Time (Seconds)';
            dx.XAxis.FontSize = Xfont;
            dx.YLabel.String = 'Multiplicative Capacitance';
            dx.YAxis.FontSize = Yfont;    
            dx.XLim = [0,MaximumX];

            bxlim = xlim;
            bGraphMaxX = bxlim(2);
            bx.XLim = [0, bGraphMaxX]; %First 60 sec, for constant

            if yCustom ==1
                dx.YLim = [ymin,ymax];
            end 
            dylim=ylim;
            dGraphMaxY = dylim(2);
            yticks(0:dGraphMaxY/5:dGraphMaxY); % 10 ticks

            % Graph mean & +-STDev
    
            % Remove any data past 30 seconds
            TargetTime = MaxXStats;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            MaxMultCapS = MaxMultCap(1:TargetIndex);
            


            % Remove Zeroes
            MaxMultCapNonZero = MaxMultCapS(MaxMultCapS > 0);
            GMin = min(MaxMultCapNonZero);
            GMax = max(MaxMultCapNonZero);
            meanVal = mean(MaxMultCapNonZero);
            stdDev = std(MaxMultCapNonZero);
            if isnan(meanVal)
                meanVal = 0;
            end 
            if isnan(stdDev)
                stdDev = 0;
            end 
        end 
    end 
    meanValR = round(meanVal,2);
    stdDevR = round(stdDev,2);
    OutData.meanVal = meanValR;
    OutData.stdDev = stdDevR;
    OutData.GMin = GMin;
    OutData.GMax = GMax;
end 


%%
function Data = FreeExploration(selpath, savedest, filestr,np,ns,ttv)    
%%
%   This function returns a variable called Data which has 4 different 
%   subvariables within it:
% 
%   Data.TimeData is the time value at each given point, given in seconds
% 
%   Data.CapData is the raw capacitance values
% 
%   Data.TotalCap is the total capacitance at each timepoint
% 
%   Data.MultCap is the peak multiplicative capacitance at each timepoint
% 
%   Data.MaximumRowValue is the maximum value at each row
% 
%   Data.MaximumColumnValue is the maximum value at each column
% 
%
%

    cap = [];
    time = [];
    MaxRow = [];
    MaxColumn = [];
    ResamplingFreq = 180;  
    for k = 1 : np % tries to find max 30 files in one folder
        filename = filestr + k + ".txt";     
            
        if isfile(selpath + "\" + filename)
            disp(filename);
            processed = NoiseReductionV5(strcat(selpath, "\", filename), ResamplingFreq, 225, 0, ttv); %tongue threshold=225
        end 
        cap = [cap; processed.Readings];
        if(k>1)
            ExtTime = processed.Time + time(end);
        else
            ExtTime = processed.Time;
        end 
        time = [time; ExtTime];
        MaxRow = [MaxRow; processed.MRow];
        MaxColumn = [MaxColumn; processed.MCol];
        
    end 
    %% Summative calculation
    TotCap = sum(cap(:,1:15),2);

    %% Multiplicative calculation
    MRL = length(time);
    MaxMultCap = zeros(MRL,1);
    for i= 1:MRL
        MaxMultCap(i,1) = MaxRow(i,1)*MaxColumn(i,1); 
    end 

    Data.TimeData = time(:,1)/10^6;
    Data.CapData = cap;
    Data.TotalCap = TotCap;
    Data.MultCap = MaxMultCap;
    Data.MaximumRowValue = MaxRow;
    Data.MaximumColumnValue = MaxColumn;
end 
%%





function results = NoiseReductionV5(filename, ResamplingFreq, filterthreshold, display,ttv)
    %% Readtable
    m1 = readtable(filename); 
    %% Initialize variables
    m1L = height(m1);
    TimeReadings = NaN(m1L,1);
    CapReadings = NaN(m1L,15);
    MaxRow = NaN(m1L,1);
    MaxColumn = NaN(m1L,1);
    for i = 1 : height(m1)
        %% Total Capacitance readings
        CapReading= table2array(m1(i, 4 : 18));
        TimeReading = table2array(m1(i,3));
        CapReadings(i,:) = CapReading;
        TimeReadings(i,:) = TimeReading;
        

        columnsns = table2array(m1(i, 4 : 10));
        rowsns = table2array(m1(i, 11 : 18));
        
        %find max column and row signal
        [maxcolval, maxcolidx] = max(columnsns);         
        [maxrowval, maxrowidx] = max(rowsns); 
        

        %% Enforce decreasing capacitance column filtering
        filteredcolumns = columnsns;
        filteredrows = rowsns;
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

        MaxRow(i,1) = max(filteredrows);
        MaxColumn(i,1) = max(filteredcolumns);
    end 

    results.Readings = CapReadings;
    results.Time = TimeReadings;
    results.MRow = MaxRow;
    results.MCol = MaxColumn;
end 


