%clc
%clear
%close all
%% Find Data
dirPath  = cd;
Raw_Subjects_Data = fullfile(dirPath ,"SalivaData");
Processed_Subjects_Data=fullfile(dirPath,"Processed_Data");
Old_Tongue = fullfile(Raw_Subjects_Data,"OldTongue");
Old_1mm = fullfile(Raw_Subjects_Data,"Old1mm");
Old_2mm = fullfile(Raw_Subjects_Data,"Old2mm");
Old_3mm = fullfile(Raw_Subjects_Data,"Old3mm");

LDS_Tongue = fullfile(Raw_Subjects_Data,"LDSTongue");
LDS_1mm = fullfile(Raw_Subjects_Data,"LDS1mm");
LDS_2mm = fullfile(Raw_Subjects_Data,"LDS2mm");
LDS_3mm = fullfile(Raw_Subjects_Data,"LDS3mm");

Flex_Tongue = fullfile(Raw_Subjects_Data,"FlexTongue");
Flex_1mm = fullfile(Raw_Subjects_Data,"Flex1mm");
Flex_2mm = fullfile(Raw_Subjects_Data,"Flex2mm");
Flex_3mm = fullfile(Raw_Subjects_Data,"Flex3mm");


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


%% FreeExploration_Rehab step in

disp("Old Tongue"); OTData = FreeExploration(Old_Tongue, Processed_Subjects_Data, "T",10,'T',ttv); 
disp("Old 01mm"); O1Data = FreeExploration(Old_1mm, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("Old 02mm"); O2Data = FreeExploration(Old_2mm, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("Old 03mm"); O3Data = FreeExploration(Old_3mm, Processed_Subjects_Data, "T",1,'T',ttv); 

disp("LDS Tongue"); LTData = FreeExploration(LDS_Tongue, Processed_Subjects_Data, "T",10,'T',ttv); 
disp("LDS 01mm"); L1Data = FreeExploration(LDS_1mm, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 02mm"); L2Data = FreeExploration(LDS_2mm, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("LDS 03mm"); L3Data = FreeExploration(LDS_3mm, Processed_Subjects_Data, "T",1,'T',ttv); 

disp("Flex Tongue"); FTData = FreeExploration(Flex_Tongue, Processed_Subjects_Data, "T",10,'T',ttv); 
disp("Flex 01mm"); F1Data = FreeExploration(Flex_1mm, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("Flex 02mm"); F2Data = FreeExploration(Flex_2mm, Processed_Subjects_Data, "T",1,'T',ttv); 
disp("Flex 03mm"); F3Data = FreeExploration(Flex_3mm, Processed_Subjects_Data, "T",1,'T',ttv); 

%%
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




%% Calculate total capacitance and accurate time vector
%Old Tongue
OTTotalCap = sum(OTData.CapData(:,1:15),2);
OTSecTime = (OTData.TimeData(:,1))/10^6;

O1TotalCap = sum(O1Data.CapData(:,1:15),2);
O1SecTime = (O1Data.TimeData(:,1))/10^6;

O2TotalCap = sum(O2Data.CapData(:,1:15),2);
O2SecTime = (O2Data.TimeData(:,1))/10^6;

O3TotalCap = sum(O3Data.CapData(:,1:15),2);
O3SecTime = (O3Data.TimeData(:,1))/10^6;

%LDS Tongue
LTTotalCap = sum(LTData.CapData(:,1:15),2);
LTSecTime = (LTData.TimeData(:,1))/10^6; 

L1TotalCap = sum(L1Data.CapData(:,1:15),2);
L1SecTime = (L1Data.TimeData(:,1))/10^6;

L2TotalCap = sum(L2Data.CapData(:,1:15),2);
L2SecTime = (L2Data.TimeData(:,1))/10^6;

L3TotalCap = sum(L3Data.CapData(:,1:15),2);
L3SecTime = (L3Data.TimeData(:,1))/10^6;

% Flex
FTTotalCap = sum(FTData.CapData(:,1:15),2);
FTSecTime = (FTData.TimeData(:,1))/10^6; 

F1TotalCap = sum(F1Data.CapData(:,1:15),2);
F1SecTime = (F1Data.TimeData(:,1))/10^6;

F2TotalCap = sum(F2Data.CapData(:,1:15),2);
F2SecTime = (F2Data.TimeData(:,1))/10^6;

F3TotalCap = sum(F3Data.CapData(:,1:15),2);
F3SecTime = (F3Data.TimeData(:,1))/10^6;




%% Subplots of Old Device
TitleFont = 15;
Xfont = 15;
Yfont = 15;
figure();
% function plotData2 (subX, subY, subNum, SecTime, TotalCap, MaxRow, MaxCol, name, TM, FullFirstLast, MaximumX .TitleFont, Xfont, Yfont, yCustom, ymin, ymax)
% Sum capacitance
[OTSMean,OTSStdDev,OTSMin,OTSMax] = plotData2(2,4,1,OTSecTime,OTTotalCap,OTData.MaximumRowValue,OTData.MaximumColumnValue, "Old Tongue", "Tot","Full",300, TitleFont,Xfont,Yfont,1,0,350);
[O1SMean,O1SStdDev,O1SMin,O1SMax] = plotData2(2,4,2,O1SecTime,O1TotalCap,O1Data.MaximumRowValue,O1Data.MaximumColumnValue, "Old 1mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,10);
[O2SMean,O2SStdDev,O2SMin,O2SMax] = plotData2(2,4,3,O2SecTime,O2TotalCap,O2Data.MaximumRowValue,O2Data.MaximumColumnValue, "Old 2mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,40);
[O3SMean,O3SStdDev,O3SMin,O3SMax] = plotData2(2,4,4,O3SecTime,O3TotalCap,O3Data.MaximumRowValue,O3Data.MaximumColumnValue, "Old 3mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,60);
% Mult Capacitance
[OTMMean,OTMStdDev,OTMMin,OTMMax] = plotData2(2,4,5,OTSecTime,OTTotalCap,OTData.MaximumRowValue,OTData.MaximumColumnValue, "Old Tongue", "Mult","Full",300, TitleFont,Xfont,Yfont,1,0,2200);
[O1MMean,O1MStdDev,O1MMin,O1MMax] = plotData2(2,4,6,O1SecTime,O1TotalCap,O1Data.MaximumRowValue,O1Data.MaximumColumnValue, "Old 1mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,-1,10);
[O2MMean,O2MStdDev,O2MMin,O2MMax] = plotData2(2,4,7,O2SecTime,O2TotalCap,O2Data.MaximumRowValue,O2Data.MaximumColumnValue, "Old 2mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,100);
[O3MMean,O3MStdDev,O3MMin,O3MMax] = plotData2(2,4,8,O3SecTime,O3TotalCap,O3Data.MaximumRowValue,O3Data.MaximumColumnValue, "Old 3mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,200);

close
% Sum Cap Table
figure();
OSStats = {'Tongue', OTSMean, OTSStdDev,OTSMin,OTSMax;
           '1mm'   , O1SMean, O1SStdDev,O1SMin,O1SMax;
           '2mm'   , O2SMean, O2SStdDev,O2SMin,O2SMax;
           '3mm'   , O3SMean, O3SStdDev,O3SMin,O3SMax};
MakeTable(OSStats, "Old Sum of Capacitance");
% Mult Cap Table
figure();
OMStats = {'Tongue', OTMMean, OTMStdDev,OTMMin,OTMMax;
           '1mm'   , O1MMean, O1MStdDev,O1MMin,O1MMax;
           '2mm'   , O2MMean, O2MStdDev,O2MMin,O2MMax;
           '3mm'   , O3MMean, O3MStdDev,O3MMin,O3MMax};
MakeTable(OMStats, "Old Capacitance Multiplied");



%% Subplots of LDS Device
figure();
% function plotData2 (subX, subY, subNum, SecTime, TotalCap, MaxRow, MaxCol, name, TM, FullFirstLast, MaximumX .TitleFont, Xfont, Yfont, yCustom, ymin, ymax)
% Sum capacitance
[LTSMean,LTSStdDev,LTSMin,LTSMax] = plotData2(2,4,1,LTSecTime,LTTotalCap,LTData.MaximumRowValue,LTData.MaximumColumnValue, "LDS Tongue", "Tot","Full",300, TitleFont,Xfont,Yfont,1,0,300);
[L1SMean,L1SStdDev,L1SMin,L1SMax] = plotData2(2,4,2,L1SecTime,L1TotalCap,L1Data.MaximumRowValue,L1Data.MaximumColumnValue, "LDS 1mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,-1,4);
[L2SMean,L2SStdDev,L2SMin,L2SMax] = plotData2(2,4,3,L2SecTime,L2TotalCap,L2Data.MaximumRowValue,L2Data.MaximumColumnValue, "LDS 2mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,20);
[L3SMean,L3SStdDev,L3SMin,L3SMax] = plotData2(2,4,4,L3SecTime,L3TotalCap,L3Data.MaximumRowValue,L3Data.MaximumColumnValue, "LDS 3mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,40);
% Mult Capacitance
[LTMMean,LTMStdDev,LTMMin,LTMMax] = plotData2(2,4,5,LTSecTime,LTTotalCap,LTData.MaximumRowValue,LTData.MaximumColumnValue, "LDS Tongue", "Mult","Full",300, TitleFont,Xfont,Yfont,1,0,300);
[L1MMean,L1MStdDev,L1MMin,L1MMax] = plotData2(2,4,6,L1SecTime,L1TotalCap,L1Data.MaximumRowValue,L1Data.MaximumColumnValue, "LDS 1mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,-1,4);
[L2MMean,L2MStdDev,L2MMin,L2MMax] = plotData2(2,4,7,L2SecTime,L2TotalCap,L2Data.MaximumRowValue,L2Data.MaximumColumnValue, "LDS 2mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,60);
[L3MMean,L3MStdDev,L3MMin,L3MMax] = plotData2(2,4,8,L3SecTime,L3TotalCap,L3Data.MaximumRowValue,L3Data.MaximumColumnValue, "LDS 3mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,80);


close
% Sum Cap Table
figure();
OSStats = {'Tongue', LTSMean, LTSStdDev,LTSMin,LTSMax;
           '1mm'   , L1SMean, L1SStdDev,L1SMin,L1SMax;
           '2mm'   , L2SMean, L2SStdDev,L2SMin,L2SMax;
           '3mm'   , L3SMean, L3SStdDev,L3SMin,L3SMax};
MakeTable(OSStats, "LDS Sum of Capacitance");
% Mult Cap Table
figure();
OMStats = {'Tongue', LTMMean, LTMStdDev,LTMMin,LTMMax;
           '1mm'   , L1MMean, L1MStdDev,L1MMin,L1MMax;
           '2mm'   , L2MMean, L2MStdDev,L2MMin,L2MMax;
           '3mm'   , L3MMean, L3MStdDev,L3MMin,L3MMax};
MakeTable(OMStats, "LDS Capacitance Multiplied");


%% Subplots of Flex Device
figure();
% function plotData2 (subX, subY, subNum, SecTime, TotalCap, MaxRow, MaxCol, name, TM, FullFirstLast, MaximumX .TitleFont, Xfont, Yfont, yCustom, ymin, ymax)
% Sum capacitance
[FTSMean,FTSStdDev,FTSMin,FTSMax] = plotData2(2,4,1,FTSecTime,FTTotalCap,FTData.MaximumRowValue,FTData.MaximumColumnValue, "Flex Tongue", "Tot","Full",200, TitleFont,Xfont,Yfont,1,0,100);
[F1SMean,F1SStdDev,F1SMin,F1SMax] = plotData2(2,4,2,F1SecTime,F1TotalCap,F1Data.MaximumRowValue,F1Data.MaximumColumnValue, "Flex 1mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,10);
[F2SMean,F2SStdDev,F2SMin,F2SMax] = plotData2(2,4,3,F2SecTime,F2TotalCap,F2Data.MaximumRowValue,F2Data.MaximumColumnValue, "Flex 2mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,10);
[F3SMean,F3SStdDev,F3SMin,F3SMax] = plotData2(2,4,4,F3SecTime,F3TotalCap,F3Data.MaximumRowValue,F3Data.MaximumColumnValue, "Flex 3mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,5);
% Mult Capacitance
[FTMMean,FTMStdDev,FTMMin,FTMMax] = plotData2(2,4,5,FTSecTime,FTTotalCap,FTData.MaximumRowValue,FTData.MaximumColumnValue, "Flex Tongue", "Mult","Full",200, TitleFont,Xfont,Yfont,1,0,200);
[F1MMean,F1MStdDev,F1MMin,F1MMax] = plotData2(2,4,6,F1SecTime,F1TotalCap,F1Data.MaximumRowValue,F1Data.MaximumColumnValue, "Flex 1mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,15);
[F2MMean,F2MStdDev,F2MMin,F2MMax] = plotData2(2,4,7,F2SecTime,F2TotalCap,F2Data.MaximumRowValue,F2Data.MaximumColumnValue, "Flex 2mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,15);
[F3MMean,F3MStdDev,F3MMin,F3MMax] = plotData2(2,4,8,F3SecTime,F3TotalCap,F3Data.MaximumRowValue,F3Data.MaximumColumnValue, "Flex 3mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,-1,4);

close
% Sum Cap Table
figure();
OSStats = {'Tongue', FTSMean, FTSStdDev,FTSMin,FTSMax;
           '1mm'   , F1SMean, F1SStdDev,F1SMin,F1SMax;
           '2mm'   , F2SMean, F2SStdDev,F2SMin,F2SMax;
           '3mm'   , F3SMean, F3SStdDev,F3SMin,F3SMax};
MakeTable(OSStats, "Flex Sum of Capacitance");
% Mult Cap Table
figure();
OMStats = {'Tongue', FTMMean, FTMStdDev,FTMMin,FTMMax;
           '1mm'   , F1MMean, F1MStdDev,F1MMin,F1MMax;
           '2mm'   , F2MMean, F2MStdDev,F2MMin,F2MMax;
           '3mm'   , F3MMean, F3MStdDev,F3MMin,F3MMax};
MakeTable(OMStats, "Flex Capacitance Multiplied");

%% Subplots of Capacitance Summation 
TitleFont = 15;
Xfont = 12;
Yfont = 12;

figure();
% Old Device
plotData2(3,4,1,OTSecTime,OTTotalCap,OTData.MaximumRowValue,OTData.MaximumColumnValue, "Old Tongue", "Tot","Full",300, TitleFont,Xfont,Yfont,1,0,350);
plotData2(3,4,2,O1SecTime,O1TotalCap,O1Data.MaximumRowValue,O1Data.MaximumColumnValue, "Old 1mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,10);
plotData2(3,4,3,O2SecTime,O2TotalCap,O2Data.MaximumRowValue,O2Data.MaximumColumnValue, "Old 2mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,40);
plotData2(3,4,4,O3SecTime,O3TotalCap,O3Data.MaximumRowValue,O3Data.MaximumColumnValue, "Old 3mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,60);

% LDS
plotData2(3,4,5,LTSecTime,LTTotalCap,LTData.MaximumRowValue,LTData.MaximumColumnValue, "LDS Tongue", "Tot","Full",300, TitleFont,Xfont,Yfont,1,0,300);
plotData2(3,4,6,L1SecTime,L1TotalCap,L1Data.MaximumRowValue,L1Data.MaximumColumnValue, "LDS 1mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,-1,4);
plotData2(3,4,7,L2SecTime,L2TotalCap,L2Data.MaximumRowValue,L2Data.MaximumColumnValue, "LDS 2mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,20);
plotData2(3,4,8,L3SecTime,L3TotalCap,L3Data.MaximumRowValue,L3Data.MaximumColumnValue, "LDS 3mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,40);

% Flex
plotData2(3,4,9,FTSecTime,FTTotalCap,FTData.MaximumRowValue,FTData.MaximumColumnValue, "Flex Tongue", "Tot","Full",200, TitleFont,Xfont,Yfont,1,0,100);
plotData2(3,4,10,F1SecTime,F1TotalCap,F1Data.MaximumRowValue,F1Data.MaximumColumnValue, "Flex 1mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,10);
plotData2(3,4,11,F2SecTime,F2TotalCap,F2Data.MaximumRowValue,F2Data.MaximumColumnValue, "Flex 2mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,0,10);
plotData2(3,4,12,F3SecTime,F3TotalCap,F3Data.MaximumRowValue,F3Data.MaximumColumnValue, "Flex 3mm Saliva", "Tot","First",8, TitleFont,Xfont,Yfont,1,-1,4);

%% Subplots of Capacitance Multiplication
TitleFont = 15;
Xfont = 12;
Yfont = 12;

% Old
plotData2(3,4,1,OTSecTime,OTTotalCap,OTData.MaximumRowValue,OTData.MaximumColumnValue, "Old Tongue", "Mult","Full",300, TitleFont,Xfont,Yfont,1,0,2200);
plotData2(3,4,2,O1SecTime,O1TotalCap,O1Data.MaximumRowValue,O1Data.MaximumColumnValue, "Old 1mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,-1,10);
plotData2(3,4,3,O2SecTime,O2TotalCap,O2Data.MaximumRowValue,O2Data.MaximumColumnValue, "Old 2mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,100);
plotData2(3,4,4,O3SecTime,O3TotalCap,O3Data.MaximumRowValue,O3Data.MaximumColumnValue, "Old 3mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,200);

% LDS
plotData2(3,4,5,LTSecTime,LTTotalCap,LTData.MaximumRowValue,LTData.MaximumColumnValue, "LDS Tongue", "Mult","Full",300, TitleFont,Xfont,Yfont,1,0,300);
plotData2(3,4,6,L1SecTime,L1TotalCap,L1Data.MaximumRowValue,L1Data.MaximumColumnValue, "LDS 1mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,-1,4);
plotData2(3,4,7,L2SecTime,L2TotalCap,L2Data.MaximumRowValue,L2Data.MaximumColumnValue, "LDS 2mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,60);
plotData2(3,4,8,L3SecTime,L3TotalCap,L3Data.MaximumRowValue,L3Data.MaximumColumnValue, "LDS 3mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,80);

% Flex
plotData2(3,4,9,FTSecTime,FTTotalCap,FTData.MaximumRowValue,FTData.MaximumColumnValue, "Flex Tongue", "Mult","Full",200, TitleFont,Xfont,Yfont,1,0,200);
plotData2(3,4,10,F1SecTime,F1TotalCap,F1Data.MaximumRowValue,F1Data.MaximumColumnValue, "Flex 1mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,15);
plotData2(3,4,11,F2SecTime,F2TotalCap,F2Data.MaximumRowValue,F2Data.MaximumColumnValue, "Flex 2mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,0,15);
plotData2(3,4,12,F3SecTime,F3TotalCap,F3Data.MaximumRowValue,F3Data.MaximumColumnValue, "Flex 3mm Saliva", "Mult","First",8, TitleFont,Xfont,Yfont,1,-1,4);

function MakeTable2 (OutData1,OutData2,OutData3,OutData4,OutData5,OutData6,OutData7, OutData8, OutData9,OutData10,OutData11,OutData12,OutData13,OutData14,OutData15, OutData16, OutData17, OutData18, OutData19, TableName)

    OutData.meanVal = meanValR;
    OutData.stdDev = stdDevR;
    OutData.GMin = GMin;
    OutData.GMax = GMax;
    
    Stats = {'Tongue', OutData1.meanVal, OutData1.stdDev, OutData1.GMin,OutData1.GMax;
           '1mm-1', OutData2.meanVal, OutData2.stdDev, OutData2.GMin,OutData2.GMax;
           '1mm-2', OutData3.meanVal, OutData3.stdDev, OutData3.GMin,OutData2.GMax;
           '1mm-3', OutData4.meanVal, OutData4.stdDev, OutData4.GMin,OutData2.GMax;
           '1mm-4', OutData5.meanVal, OutData5.stdDev, OutData5.GMin,OutData2.GMax;
           '1mm-5', OutData6.meanVal, OutData6.stdDev, OutData6.GMin,OutData2.GMax;
           '1mm-6', OutData7.meanVal, OutData7.stdDev, OutData7.GMin,OutData2.GMax;
           '2mm-1', OutData8.meanVal, OutData8.stdDev, OutData8.GMin,OutData2.GMax;
           '2mm-2', OutData9.meanVal, OutData9.stdDev, OutData9.GMin,OutData2.GMax;
           '2mm-3', OutData10.meanVal, OutData10.stdDev, OutData10.GMin,OutData2.GMax;
           '2mm-4', OutData11.meanVal, OutData11.stdDev, OutData11.GMin,OutData2.GMax;
           '2mm-5', OutData12.meanVal, OutData12.stdDev, OutData12.GMin,OutData2.GMax;
           '2mm-6', OutData13.meanVal, OutData13.stdDev, OutData13.GMin,OutData2.GMax;
           '3mm-1', OutData14.meanVal, OutData14.stdDev, OutData14.GMin,OutData2.GMax;
           '3mm-2', OutData15.meanVal, OutData15.stdDev, OutData15.GMin,OutData2.GMax;
           '3mm-3', OutData16.meanVal, OutData16.stdDev, OutData16.GMin,OutData2.GMax;
           '3mm-4', OutData17.meanVal, OutData17.stdDev, OutData17.GMin,OutData2.GMax;
           '3mm-5', OutData18.meanVal, OutData18.stdDev, OutData18.GMin,OutData2.GMax;
           '3mm-6', OutData19.meanVal, OutData19.stdDev, OutData19.GMin,OutData2.GMax;
           
           '2mm'   , F2SMean, F2SStdDev,F2SMin,F2SMax;
           '3mm'   , F3SMean, F3SStdDev,F3SMin,F3SMax};

    t = uitable('Data',Data,'ColumnName',{'Test','Mean','StdDev','Min','Max'},'Position',[100,250,410,100]);
    titleText = strcat(TableName + ' Stats');
    text(0.5, 0.95, titleText, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', 'FontSize', 14);
    axis off;

end 



function MakeTable (Data,TableName)
    t = uitable('Data',Data,'ColumnName',{'Test','Mean','StdDev','Min','Max'},'Position',[100,250,410,100]);
    titleText = strcat(TableName + ' Stats');
    text(0.5, 0.95, titleText, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', 'FontSize', 14);
    axis off;

end 




function [meanVal,stdDev,GMin,GMax] = plotData2 (subX, subY, subNum, SecTime, TotalCap, MaxRow, MaxCol, name, TM, FullFirstLast, MaximumX, TitleFont, Xfont, Yfont, yCustom, ymin, ymax)
    %% Plotting Data
    if FullFirstLast == "Full"
        if TM == "Tot"
            subplot(subX,subY,subNum);
            plot(SecTime,TotalCap);
            ax = gca;
            ax.Title.String = strcat(name + " 5 MIN FE Sum");
            ax.Title.FontSize = TitleFont;
            ax.XLabel.String = 'Time (Seconds)';
            ax.XAxis.FontSize = Xfont;
            ax.YLabel.String = 'Total Capacitance';
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

            TargetTime = MaximumX;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            TotalCapS = TotalCap(1:TargetIndex);
            
            GMin = min(TotalCapS);
            GMax = max(TotalCapS);

            % Graph mean & +-STDev
            TotalCapNonZero = TotalCapS(TotalCapS > 0);
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
    
            MRL = length(MaxRow);
            MaxMultCap = zeros(MRL,1);
            for i= 1:MRL
                MaxMultCap(i,1) = MaxRow(i,1)*MaxCol(i,1); 
            end 
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

            TargetTime = MaximumX;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            MaxMultCapS = MaxMultCap(1:TargetIndex);
            
            GMin = min(MaxMultCapS);
            GMax = max(MaxMultCapS);

            % Graph mean & +-STDev
            MaxMultCapNonZero = MaxMultCapS(MaxMultCapS > 0);
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
            cx.Title.String = strcat(name + " First 30 sec FE Sum");
            cx.Title.FontSize = TitleFont;
            cx.XLabel.String = 'Time (Seconds)';
            cx.XAxis.FontSize = Xfont;
            cx.YLabel.String = 'Total Capacitance';
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
            TargetTime = MaximumX;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            TotalCapS = TotalCap(1:TargetIndex);
            
            GMin = min(TotalCap);
            GMax = max(TotalCap);

            % Calc Mean and SD
            TotalCapNonZero = TotalCapS(TotalCapS>0);
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
            %% Mult Calculation
            MRL = length(MaxRow);
            MaxMultCap = zeros(MRL,1);
            for i= 1:MRL
                MaxMultCap(i,1) = MaxRow(i,1)*MaxCol(i,1); 
            end 
            %% Plotting the data
            subplot(subX,subY,subNum);
            plot(SecTime,MaxMultCap);
            dx = gca;
            dx.Title.String = strcat(name + " First 30sec FE Mult");
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
            TargetTime = MaximumX;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            MaxMultCapS = MaxMultCap(1:TargetIndex);
            
            GMin = min(MaxMultCapS);
            GMax = max(MaxMultCapS);



            % Remove Zeroes
            MaxMultCapNonZero = MaxMultCapS(MaxMultCapS > 0);
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
    meanVal = round();
    stdDev = round();
    
end 






function Data = FreeExploration(selpath, savedest, filestr,np,ns,ttv)    

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
    Data.TimeData = time;
    Data.CapData = cap;
    Data.MaximumRowValue = MaxRow;
    Data.MaximumColumnValue = MaxColumn;
    %filename = strcat(savedest, '\', 'TotalFiltered_180Hz');
    %save(filename,"Data");
    %disp("Saved in:");
    %disp(filename);
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

        









function plotData (subX, subY, subNum, SecTime, TotalCap, MaxRow, MaxCol, name, TM, FullFirstLast, TitleFont, Xfont, Yfont, ytickmin, ytickstep, ytickmax)
    %% Plotting Data
    if FullFirstLast == "Full"
        if TM == "Tot"
            subplot(subX,subY,subNum);
            plot(SecTime,TotalCap);
            ax = gca;
            ax.Title.String = strcat(name + " 5 MIN FE Total Capacitance");
            ax.Title.FontSize = TitleFont;
            ax.XLabel.String = 'Time (Seconds)';
            ax.XAxis.FontSize = Xfont;
            ax.YLabel.String = 'Total Capacitance';
            ax.YAxis.FontSize = Yfont;
            axlim = xlim;
            aGraphMaxX = axlim(2);
            ax.XLim = [0, aGraphMaxX]; %First 60 sec, for constant
            aylim=ylim;
            aGraphMaxY = aylim(2);
            if ytickmin == 1
                yticks(0:aGraphMaxY/10:aGraphMaxY); % 10 ticks
            else
                yticks(ytickmin, ytickstep, ytickmax)
            end 
            grid on;
            TotalCapNonZero = TotalCap(TotalCap>0);
            meanTotVal = mean(TotalCapNonZero);
            stdDevTot = std(TotalCapNonZero);
            % Plot mean and SD ranges
            hold on;
            plot(SecTime, repmat(meanTotVal, size(SecTime)), 'LineWidth', 2, 'Color', 'b');
            plot(SecTime, repmat(meanTotVal + stdDevTot, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean + std
            plot(SecTime, repmat(meanTotVal - stdDevTot, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean - std
            % Add Mean and SD ranges to the graph 
            text(aGraphMaxX, meanTotVal, sprintf('Mean: %.2f', meanTotVal), 'Color', 'b', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(aGraphMaxX, meanTotVal + stdDevTot, sprintf('+1 SD: %.2f', meanTotVal + stdDevTot), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(aGraphMaxX, meanTotVal - stdDevTot, sprintf('-1 SD: %.2f', meanTotVal - stdDevTot), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
        elseif TM == "Mult"
    
            MRL = length(MaxRow);
            MaxMultCap = zeros(MRL,1);
            for i= 1:MRL
                MaxMultCap(i,1) = MaxRow(i,1)*MaxCol(i,1); 
            end 
            %% Plotting the data
            subplot(subX,subY,subNum);
            plot(SecTime,MaxMultCap);
            bx = gca;
            bx.Title.String = strcat(name + ' 5 MIN FE Peak Capacitance Multiplied');
            bx.Title.FontSize = TitleFont;
            bx.XLabel.String = 'Time (Seconds)';
            bx.XAxis.FontSize = Xfont;
            bx.YLabel.String = 'Multiplicative Capacitance';
            bx.YAxis.FontSize = Yfont;    
            bxlim = xlim;
            bGraphMaxX = bxlim(2);
            bylim = ylim;
            bGraphMaxY = bylim(2);
            bx.XLim = [0,bGraphMaxX]; % Full time
            if ytickmin == 1
                yticks(0:bGraphMaxY/10:bGraphMaxY); % 10 ticks
            else
                yticks(ytickmin, ytickstep, ytickmax)
            end 
            grid on;
            
            % Graph mean & +-STDev
            MaxMultCapNonZero = MaxMultCap(MaxMultCap > 0);
            meanMultVal = mean(MaxMultCapNonZero);
            stdDevMult = std(MaxMultCapNonZero);
            hold on; % Hold the current plot
            plot(SecTime, repmat(meanMultVal, size(SecTime)), 'LineWidth', 2, 'Color', 'b'); % Red solid line for mean
            plot(SecTime, repmat(meanMultVal + stdDevMult, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean + std
            plot(SecTime, repmat(meanMultVal - stdDevMult, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean - std
            hold off; % Release the plot hold
            %Add Mean +- SD to graph numerically
            text(bGraphMaxX, meanMultVal, sprintf('Mean: %.2f', meanMultVal), 'Color', 'b', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(bGraphMaxX, meanMultVal + stdDevMult, sprintf('+1 SD: %.2f', meanMultVal + stdDevMult), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(bGraphMaxX, meanMultVal - stdDevMult, sprintf('-1 SD: %.2f', meanMultVal - stdDevMult), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            
        end 
    elseif FullFirstLast == "First"
        if TM == "Tot"
            %% Plotting the data
            subplot(subX,subY,subNum);
            plot(SecTime,TotalCap);
            cx = gca;
            cx.Title.String = strcat(name + " First 30 sec FE Total Capacitance");
            cx.Title.FontSize = TitleFont;
            cx.XLabel.String = 'Time (Seconds)';
            cx.XAxis.FontSize = Xfont;
            cx.YLabel.String = 'Total Capacitance';
            cx.YAxis.FontSize = Yfont;
            cx.XLim = [0,30];
            cxlim = xlim;
            cGraphMaxX = cxlim(2);
            cx.XLim = [0, cGraphMaxX];
            cylim=ylim;
            cGraphMaxY = cylim(2);
            if ytickmin == 1
                yticks(0:cGraphMaxY/10:cGraphMaxY); % 10 ticks
            else
                yticks(ytickmin, ytickstep, ytickmax)
            end 
            grid on;
            
            
            % Plot mean and +-SD
            % Limit data to 30 seconds for calculations
            TargetTime = 30;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            TotalCapS = TotalCap(1:TargetIndex);
    
            
            % Calc Mean and SD
            TotalCapNonZero = TotalCapS(TotalCapS>0);
            meanTotVal = mean(TotalCapNonZero);
            stdDevTot = std(TotalCapNonZero);
            % Plot mean and SD ranges
            hold on;
            plot(SecTime, repmat(meanTotVal, size(SecTime)), 'LineWidth', 2, 'Color', 'b');
            plot(SecTime, repmat(meanTotVal + stdDevTot, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean + std
            plot(SecTime, repmat(meanTotVal - stdDevTot, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean - std
            % Add Mean and SD ranges to the graph 
            text(cGraphMaxX, meanTotVal, sprintf('Mean: %.2f', meanTotVal), 'Color', 'b', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(cGraphMaxX, meanTotVal + stdDevTot, sprintf('+1 SD: %.2f', meanTotVal + stdDevTot), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(cGraphMaxX, meanTotVal - stdDevTot, sprintf('-1 SD: %.2f', meanTotVal - stdDevTot), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
        
            hold off;
        end 
        if TM == "Mult"
            %% Mult Calculation
            MRL = length(MaxRow);
            MaxMultCap = zeros(MRL,1);
            for i= 1:MRL
                MaxMultCap(i,1) = MaxRow(i,1)*MaxCol(i,1); 
            end 
            %% Plotting the data
            subplot(subX,subY,subNum);
            plot(SecTime,MaxMultCap);
            dx = gca;
            dx.Title.String = strcat(name + " First 30sec FE Peak Capacitance Multiplied");
            % bx.Title.String = 'Constant Saliva 30sec FE Peak Capacitance Multiplied';
            % bx.Title.String = 'Constant Saliva 30sec FE Peak Capacitance Multiplied';
            dx.Title.FontSize = TitleFont;
            dx.XLabel.String = 'Time (Seconds)';
            dx.XAxis.FontSize = Xfont;
            dx.YLabel.String = 'Multiplicative Capacitance';
            dx.YAxis.FontSize = Yfont;    
            dylim = ylim;
            dGraphMaxY = dylim(2);
            dx.XLim = [0,30];
            dxlim = xlim;
            dGraphMaxX = dxlim(2);
            if ytickmin == 1
                yticks(0:dGraphMaxY/10:dGraphMaxY); % 10 ticks
            else
                yticks(ytickmin, ytickstep, ytickmax)
            end 
            grid on;
            
            % Graph mean & +-STDev
    
            % Remove any data past 30 seconds
            TargetTime = 30;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            MaxMultCapS = MaxMultCap(1:TargetIndex);
    
            % Remove Zeroes
            MaxMultCapNonZero = MaxMultCapS(MaxMultCapS > 0);
            meanMultVal = mean(MaxMultCapNonZero);
            stdDevMult = std(MaxMultCapNonZero);
            hold on; % Hold the current plot
            plot(SecTime, repmat(meanMultVal, size(SecTime)), 'LineWidth', 2, 'Color', 'b'); % Red solid line for mean
            plot(SecTime, repmat(meanMultVal + stdDevMult, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean + std
            plot(SecTime, repmat(meanMultVal - stdDevMult, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean - std
            hold off; % Release the plot hold
            
            %Add Mean +- SD to graph numerically
            text(dGraphMaxX, meanMultVal, sprintf('Mean: %.2f', meanMultVal), 'Color', 'b', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(dGraphMaxX, meanMultVal + stdDevMult, sprintf('+1 SD: %.2f', meanMultVal + stdDevMult), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(dGraphMaxX, meanMultVal - stdDevMult, sprintf('-1 SD: %.2f', meanMultVal - stdDevMult), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
    
        end 

    elseif FullFirstLast == "Last"
        %% Plotting the last second (Doesn't fully work atm)
        if TM == "Tot"
            %% Plotting the data
            figure();
            plot(SecTime,TotalCap);
            ex = gca;
            ex.Title.String = 'LDS Tongue Last 30 sec FE Total Capacitance';
            ex.Title.FontSize = 45;
            ex.XLabel.String = 'Time (Seconds)';
            ex.XAxis.FontSize = 30;
            ex.YLabel.String = 'Total Capacitance';
            ex.YAxis.FontSize = 50;
            exlim = xlim;
            eGraphMaxX = exlim(2);
            ex.XLim = [eGraphMaxX-30, eGraphMaxX];
            eylim=ylim;
            eGraphMaxY = eylim(2);
            yticks(0:eGraphMaxY/10:eGraphMaxY); % 10 ticks
            grid on;
            
            
            
            % Plot mean and +-SD
            % Limit data to 30 seconds for calculations
            TargetTime = eGraphMaxX-30;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            TotalCapS = TotalCap(TargetIndex:end);
    
            
            % Calc Mean and SD
            TotalCapNonZero = TotalCapS(TotalCapS>0);
            meanTotVal = mean(TotalCapNonZero);
            stdDevTot = std(TotalCapNonZero);
            % Plot mean and SD ranges
            hold on;
            plot(SecTime, repmat(meanTotVal, size(SecTime)), 'LineWidth', 2, 'Color', 'b');
            plot(SecTime, repmat(meanTotVal + stdDevTot, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean + std
            plot(SecTime, repmat(meanTotVal - stdDevTot, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean - std
            % Add Mean and SD ranges to the graph 
            text(eGraphMaxX, meanTotVal, sprintf('Mean: %.2f', meanTotVal), 'Color', 'b', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(eGraphMaxX, meanTotVal + stdDevTot, sprintf('+1 SD: %.2f', meanTotVal + stdDevTot), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(eGraphMaxX, meanTotVal - stdDevTot, sprintf('-1 SD: %.2f', meanTotVal - stdDevTot), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
        
            hold off;
        end 
        if TM == "Mult"
            %% Mult Calculation
            MRL = length(MaxRow);
            MaxMultCap = zeros(MRL,1);
            for i= 1:MRL
                MaxMultCap(i,1) = MaxRow(i,1)*MaxCol(i,1); 
            end 
            %% Plotting the data
            figure();
            plot(SecTime,MaxMultCap);
            fx = gca;
            fx.Title.String = 'LDS Tongue Last 30sec FE Peak Capacitance Multiplied';
            % bx.Title.String = 'Constant Saliva 30sec FE Peak Capacitance Multiplied';
            % bx.Title.String = 'Constant Saliva 30sec FE Peak Capacitance Multiplied';
            fx.Title.FontSize = 45;
            fx.XLabel.String = 'Time (Seconds)';
            fx.XAxis.FontSize = 30;
            fx.YLabel.String = 'Multiplicative Capacitance';
            fx.YAxis.FontSize = 50;    
            fylim = ylim;
            fGraphMaxY = fylim(2);
            fxlim = xlim;
            fGraphMaxX = fxlim(2);
            fx.XLim = [fGraphMaxX-30,fGraphMaxX];        
            yticks(0:fGraphMaxY/10:fGraphMaxY); 
            yticks(0:200:2000);
            grid on;
            
            % Graph mean & +-STDev
    
            % Remove any data past 30 seconds
            TargetTime = fGraphMaxX-30;
            [~, TargetIndex] = min(abs(SecTime - TargetTime));
            MaxMultCapS = MaxMultCap(TargetIndex:end);
    
            % Remove Zeroes
            MaxMultCapNonZero = MaxMultCapS(MaxMultCapS > 0);
            meanMultVal = mean(MaxMultCapNonZero);
            stdDevMult = std(MaxMultCapNonZero);
            hold on; % Hold the current plot
            plot(SecTime, repmat(meanMultVal, size(SecTime)), 'LineWidth', 2, 'Color', 'b'); % Red solid line for mean
            plot(SecTime, repmat(meanMultVal + stdDevMult, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean + std
            plot(SecTime, repmat(meanMultVal - stdDevMult, size(SecTime)), '--', 'LineWidth', 2, 'Color', 'r'); % Blue dashed line for mean - std
            hold off; % Release the plot hold
            
            %Add Mean +- SD to graph numerically
            text(fGraphMaxX, meanMultVal, sprintf('Mean: %.2f', meanMultVal), 'Color', 'b', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(fGraphMaxX, meanMultVal + stdDevMult, sprintf('+1 SD: %.2f', meanMultVal + stdDevMult), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
            text(fGraphMaxX, meanMultVal - stdDevMult, sprintf('-1 SD: %.2f', meanMultVal - stdDevMult), 'Color', 'r', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');

        end 

    end 

        

end 
