function a25
%ALBA-25 example lattice definition file
% Created 11/21/99
%

% new lenghts
Leff_QD1=0.229461036229344;
Leff_QF4=0.229925397373565;
Leff_QF1=0.290162591216293;
Leff_QF2=0.289076322974338;
Leff_QF3=0.290050455701024;
Leff_QD2=0.289137158793229;
Leff_QD3=0.289210179039298;
Leff_QF5=0.309585300051539;
Leff_QF8=0.308817938383968;
Leff_QF6=0.527653513646467;
Leff_QF7=0.528184007720045;


Leff_SD1=0.17086697576;
Leff_SD2=0.17041858771;
Leff_SD3=0.17000351367;
Leff_SD5=0.16991020052;
Leff_SF1=0.172958010486228;
Leff_SF4=0.171819968084414;
Leff_SD4=0.240773319561292;
Leff_SF2=0.240764887993104;
Leff_SF3=0.240698339722994;

Leff_QD1_0=0.23;
Leff_QF4_0=0.23;
Leff_QF1_0=0.29;
Leff_QF2_0=0.29;
Leff_QF3_0=0.29;
Leff_QD2_0=0.29;
Leff_QD3_0=0.29;
Leff_QF5_0=0.31;
Leff_QF8_0=0.31;
Leff_QF6_0=0.53;
Leff_QF7_0=0.53;


Leff_SD1_0=0.15;
Leff_SD2_0=0.15;
Leff_SD3_0=0.15;
Leff_SD5_0=0.15;
Leff_SF1_0=0.15;
Leff_SF4_0=0.15;
Leff_SD4_0=0.22;
Leff_SF2_0=0.22;
Leff_SF3_0=0.22;

D_BPM_1=(0.2-Leff_QD1/2);
D_BPM_2=(0.163-Leff_SD1/2);
D_BPM_3=(0.212-Leff_QF3/2);
D_BPM_4=(0.229-Leff_QF5/2);
D_BPM_5=(0.162-Leff_SD3/2);
D_BPM_6=((0.1968+0.1978+0.1968)/3-Leff_SD4/2);
D_BPM_7=((0.2168+0.2258+0.2168)/3-Leff_QD2/2);
D_BPM_8=((0.1795+0.171)/2-Leff_SD5/2);
D_BPM_9=((0.1655+0.1665)/2-Leff_SF4/2);

D_BPM_1_s2=(0.190-Leff_QD1/2);
D_BPM_2_s2=(0.163-Leff_SD1/2);
D_BPM_3_s2=(0.211-Leff_QF3/2);
D_BPM_4_s2=(0.1935-Leff_QF4/2);  % respect to QF4 instead of QF5!!
D_BPM_5_s2=(0.223-Leff_SD3/2);
D_BPM_6_s2=((0.1968+0.1978+0.1978)/3-Leff_SD4/2);
D_BPM_7_s2=((0.2258+0.2258+0.2168)/3-Leff_QD2/2);
D_BPM_8_s2=((0.1795+0.171)/2-Leff_SD5/2);
D_BPM_9_s2=((0.1655+0.1665)/2-Leff_SF4/2);

% SSS2
LBPM_SSS=3.082;
DSBPM=0.708;
DSBPM2=2.394;
DSEXC=1.89;
D_DBPM_SSS2_1=DSBPM-D_BPM_9-Leff_SF4;
D_DBPM_SSS2_2=LBPM_SSS/2-DSBPM;
D_DBPM_SSS2_3=DSEXC-LBPM_SSS/2;
D_DBPM_SSS2_5=LBPM_SSS-DSBPM2-D_BPM_9-Leff_SF4;
D_DBPM_SSS2_4=DSBPM2-DSEXC;
% SSS3
LBPM_SSS=3.082;
DSBPM=0.708;
DFFBKH=1.694;
DFFBKV=0.297;
D_DBPM_SSS3_1=DSBPM-D_BPM_9_s2-Leff_SF4;
D_DBPM_SSS3_2=LBPM_SSS/2-DSBPM;
D_DBPM_SSS3_3=DFFBKH-LBPM_SSS/2;
D_DBPM_SSS3_4=DFFBKV;
D_DBPM_SSS3_5=LBPM_SSS-DFFBKH-DFFBKV-D_BPM_9_s2-Leff_SF4;



phimean=0.103476208774844; %5.92875??
Leff_BEND=1.373885080906250;
Leff_BEND_0=1.383684;
 
global FAMLIST THERING GLOBVAL

E_0 = .51099891e6;
GLOBVAL.E0 = 3e9-E_0;
GLOBVAL.LatticeFile = 'a25';
FAMLIST = cell(0);
THERING = cell(0);
%disp('   Loading ALBA lattice in a25. Version 0.95, including injection elements');

%APLim = aperture('APLim', [-0.036 0.036 -0.005 0.005],'AperturePass');
APLim =  marker('APLim' ,'IdentityPass');

% Cavity
%L0 =  268.8003;	% design length  [m]a25_AllInOne(1)
L0 = 2.688003280000004e+02; % to get a true zero cod.
C0 =   299792458; 	% speed of light [m/s]
HarmNumber = 448;
%CAV	= rfcavity('CAV1' , 0 , 3.5e+6 ,499.653487E6, HarmNumber ,'CavityPass');
CAV	= rfcavity('CAV1' , 0 , 2.5e+6 , HarmNumber*C0/L0, HarmNumber ,'CavityPass');

L_BPM_1=drift('L_BPM_1',D_BPM_1,'DriftPass');
L_BPM_2=drift('L_BPM_2',D_BPM_2,'DriftPass');
L_BPM_3=drift('L_BPM_3',D_BPM_3,'DriftPass');
L_BPM_4=drift('L_BPM_4',D_BPM_4,'DriftPass');
L_BPM_5=drift('L_BPM_5',D_BPM_5,'DriftPass');
L_BPM_6=drift('L_BPM_6',D_BPM_6,'DriftPass');
L_BPM_7=drift('L_BPM_7',D_BPM_7,'DriftPass');
L_BPM_8=drift('L_BPM_8',D_BPM_8,'DriftPass');
L_BPM_9=drift('L_BPM_9',D_BPM_9,'DriftPass');

L_BPM_1_s2=drift('L_BPM_1',D_BPM_1_s2,'DriftPass');
L_BPM_2_s2=drift('L_BPM_2',D_BPM_2_s2,'DriftPass');
L_BPM_3_s2=drift('L_BPM_3',D_BPM_3_s2,'DriftPass');
L_BPM_4_s2=drift('L_BPM_4',D_BPM_4_s2,'DriftPass');
L_BPM_5_s2=drift('L_BPM_5',D_BPM_5_s2,'DriftPass');
L_BPM_6_s2=drift('L_BPM_6',D_BPM_6_s2,'DriftPass');
L_BPM_7_s2=drift('L_BPM_7',D_BPM_7_s2,'DriftPass');
L_BPM_8_s2=drift('L_BPM_8',D_BPM_8_s2,'DriftPass');
L_BPM_9_s2=drift('L_BPM_9',D_BPM_9_s2,'DriftPass');



L_IDS     =    drift('L_ID', (3.985+(Leff_QD1_0-Leff_QD1)/2)/4,'DriftPass');
L_IDS_BPM     =    drift('L_ID', (3.985+(Leff_QD1_0-Leff_QD1)/2)/4-D_BPM_1,'DriftPass');
L_ID    = [L_IDS L_IDS L_IDS L_IDS_BPM];
D11      =    drift('D11' ,0.17+(Leff_QD1_0-Leff_QD1)/2+(Leff_QF1_0-Leff_QF1)/2,'DriftPass');
D12      =    drift('D12', 0.150+(Leff_QF1_0-Leff_QF1)/2+(Leff_SF1_0-Leff_SF1)/2,'DriftPass');
D13      =    drift('D13' , 0.150+(Leff_QF2_0-Leff_QF2)/2+(Leff_SF1_0-Leff_SF1)/2,'DriftPass');
D14      =    drift('D14', 0.375+(Leff_QF2_0-Leff_QF2)/2+(Leff_SD1_0-Leff_SD1)/2-D_BPM_2,'DriftPass');
D15      =    drift('D15',0.260+(Leff_SD1_0-Leff_SD1)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D21      =    drift('D21',0.26+(Leff_SD2_0-Leff_SD2)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D22      =    drift('D22',0.15+(Leff_QF3_0-Leff_QF3)/2+(Leff_SD2_0-Leff_SD2)/2-D_BPM_3,'DriftPass');
D23      =    drift('D23',0.375 +(Leff_QF4_0-Leff_QF4)/2+(Leff_QF3_0-Leff_QF3)/2,'DriftPass');
D24      =    drift('D24',0.15 +(Leff_QF4_0-Leff_QF4)/2+(Leff_SF2_0-Leff_SF2)/2,'DriftPass');
D25      =    drift('D25',0.165 +(Leff_QF5_0-Leff_QF5)/2+(Leff_SF2_0-Leff_SF2)/2-D_BPM_4,'DriftPass');
D26      =    drift('D26',0.470 +(Leff_QF5_0-Leff_QF5)/2+(Leff_SD3_0-Leff_SD3)/2-D_BPM_5,'DriftPass');
D28      =    drift('D28',0.26+(Leff_SD3_0-Leff_SD3)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D31      =    drift('D31',0.260+(Leff_SD4_0-Leff_SD4)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D32      =    drift('D32',0.37+(Leff_QF6_0-Leff_QF6)/2+(Leff_SD4_0-Leff_SD4)/2-D_BPM_6,'DriftPass');
D33      =    drift('D33',0.175+(Leff_QF6_0-Leff_QF6)/2+(Leff_SF3_0-Leff_SF3)/2 ,'DriftPass');
D34      =    drift('D34',0.15+(Leff_QD2_0-Leff_QD2)/2+(Leff_SF3_0-Leff_SF3)/2,'DriftPass');

D31_b      =    drift('D31',0.260+(Leff_SD4_0-Leff_SD4)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D32_b      =    drift('D32',0.37+(Leff_QF7_0-Leff_QF7)/2+(Leff_SD4_0-Leff_SD4)/2-D_BPM_6,'DriftPass');
D33_b      =    drift('D33',0.175+(Leff_QF7_0-Leff_QF7)/2+(Leff_SF3_0-Leff_SF3)/2 ,'DriftPass');
D34_b      =    drift('D34',0.15+(Leff_QD3_0-Leff_QD3)/2+(Leff_SF3_0-Leff_SF3)/2,'DriftPass');

D41      =    drift('D41',0.26 +(Leff_SD5_0-Leff_SD5)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D42      =    drift('D42',0.54+(Leff_QF8_0-Leff_QF8)/2+(Leff_SD5_0-Leff_SD5)/2-D_BPM_8,'DriftPass');
D43      =    drift('D43',0.165+(Leff_QF8_0-Leff_QF8)/2+(Leff_SF4_0-Leff_SF4)/2-D_BPM_9,'DriftPass');
S_ID     =    drift('S_ID',1.30+(Leff_SF4_0-Leff_SF4)/2 ,'DriftPass');
M_IDS     =    drift('M_ID', (2.096767+(Leff_QD2_0-Leff_QD2)/2)/4,'DriftPass');
M_IDS_BPM     =    drift('M_ID', (2.096767+(Leff_QD2_0-Leff_QD2)/2)/4-D_BPM_7,'DriftPass');
M_ID   =  [M_IDS_BPM M_IDS M_IDS M_IDS ];
M_IDS_b     =    drift('M_ID_b', (2.096767+(Leff_QD3_0-Leff_QD3)/2)/4,'DriftPass');
M_IDS_b_BPM     =    drift('M_ID_b', (2.096767+(Leff_QD3_0-Leff_QD3)/2)/4-D_BPM_7,'DriftPass');
M_ID_b   =  [M_IDS_b M_IDS_b M_IDS_b M_IDS_b_BPM ];



L_IDS_s2     =    drift('L_ID', (3.985+(Leff_QD1_0-Leff_QD1)/2)/4,'DriftPass');
L_IDS_BPM_s2    =    drift('L_ID', (3.985+(Leff_QD1_0-Leff_QD1)/2)/4-D_BPM_1_s2,'DriftPass');
L_ID_s2    = [L_IDS_s2 L_IDS_s2 L_IDS_s2 L_IDS_BPM_s2];
D11_s2      =    drift('D11' ,0.17+(Leff_QD1_0-Leff_QD1)/2+(Leff_QF1_0-Leff_QF1)/2,'DriftPass');
D12_s2      =    drift('D12', 0.150+(Leff_QF1_0-Leff_QF1)/2+(Leff_SF1_0-Leff_SF1)/2,'DriftPass');
D13_s2      =    drift('D13' , 0.150+(Leff_QF2_0-Leff_QF2)/2+(Leff_SF1_0-Leff_SF1)/2,'DriftPass');
D14_s2      =    drift('D14', 0.375+(Leff_QF2_0-Leff_QF2)/2+(Leff_SD1_0-Leff_SD1)/2-D_BPM_2_s2,'DriftPass');
D15_s2      =    drift('D15',0.260+(Leff_SD1_0-Leff_SD1)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D21_s2      =    drift('D21',0.26+(Leff_SD2_0-Leff_SD2)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D22_s2      =    drift('D22',0.15+(Leff_QF3_0-Leff_QF3)/2+(Leff_SD2_0-Leff_SD2)/2-D_BPM_3_s2,'DriftPass');
D23_s2      =    drift('D23',0.375 +(Leff_QF4_0-Leff_QF4)/2+(Leff_QF3_0-Leff_QF3)/2,'DriftPass');
D24_s2      =    drift('D24',0.15 +(Leff_QF4_0-Leff_QF4)/2+(Leff_SF2_0-Leff_SF2)/2-D_BPM_4_s2,'DriftPass');
D25_s2      =    drift('D25',0.165 +(Leff_QF5_0-Leff_QF5)/2+(Leff_SF2_0-Leff_SF2)/2,'DriftPass');
D26_s2      =    drift('D26',0.470 +(Leff_QF5_0-Leff_QF5)/2+(Leff_SD3_0-Leff_SD3)/2-D_BPM_5_s2,'DriftPass');
D28_s2      =    drift('D28',0.26+(Leff_SD3_0-Leff_SD3)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D31_s2      =    drift('D31',0.260+(Leff_SD4_0-Leff_SD4)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D32_s2      =    drift('D32',0.37+(Leff_QF6_0-Leff_QF6)/2+(Leff_SD4_0-Leff_SD4)/2-D_BPM_6_s2,'DriftPass');
D33_s2      =    drift('D33',0.175+(Leff_QF6_0-Leff_QF6)/2+(Leff_SF3_0-Leff_SF3)/2 ,'DriftPass');
D34_s2      =    drift('D34',0.15+(Leff_QD2_0-Leff_QD2)/2+(Leff_SF3_0-Leff_SF3)/2,'DriftPass');

D31_b_s2      =    drift('D31',0.260+(Leff_SD4_0-Leff_SD4)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D32_b_s2      =    drift('D32',0.37+(Leff_QF7_0-Leff_QF7)/2+(Leff_SD4_0-Leff_SD4)/2-D_BPM_6_s2,'DriftPass');
D33_b_s2      =    drift('D33',0.175+(Leff_QF7_0-Leff_QF7)/2+(Leff_SF3_0-Leff_SF3)/2 ,'DriftPass');
D34_b_s2      =    drift('D34',0.15+(Leff_QD3_0-Leff_QD3)/2+(Leff_SF3_0-Leff_SF3)/2,'DriftPass');

D41_s2      =    drift('D41',0.26 +(Leff_SD5_0-Leff_SD5)/2+(Leff_BEND_0-Leff_BEND)/2,'DriftPass');
D42_s2      =    drift('D42',0.54+(Leff_QF8_0-Leff_QF8)/2+(Leff_SD5_0-Leff_SD5)/2-D_BPM_8_s2,'DriftPass');
D43_s2      =    drift('D43',0.165+(Leff_QF8_0-Leff_QF8)/2+(Leff_SF4_0-Leff_SF4)/2-D_BPM_9_s2,'DriftPass');
S_ID_s2     =    drift('S_ID',1.30+(Leff_SF4_0-Leff_SF4)/2 ,'DriftPass');
M_IDS_s2     =    drift('M_ID', (2.096767+(Leff_QD2_0-Leff_QD2)/2)/4,'DriftPass');
M_IDS_BPM_s2     =    drift('M_ID', (2.096767+(Leff_QD2_0-Leff_QD2)/2)/4-D_BPM_7_s2,'DriftPass');
M_ID_s2   =  [M_IDS_BPM_s2 M_IDS_s2 M_IDS_s2 M_IDS_s2 ];
M_IDS_b_s2     =    drift('M_ID_b', (2.096767+(Leff_QD3_0-Leff_QD3)/2)/4,'DriftPass');
M_IDS_b_BPM_s2    =    drift('M_ID_b', (2.096767+(Leff_QD3_0-Leff_QD3)/2)/4-D_BPM_7_s2,'DriftPass');
M_ID_b_s2   =  [M_IDS_b_s2 M_IDS_b_s2 M_IDS_b_s2 M_IDS_b_BPM_s2 ];
S_ID_SSS2_1     = drift('S_ID',D_DBPM_SSS2_1,'DriftPass');
S_ID_SSS2_2     = drift('S_ID',D_DBPM_SSS2_2,'DriftPass');
S_ID_SSS2_3     = drift('S_ID',D_DBPM_SSS2_3,'DriftPass');
S_ID_SSS2_4     = drift('S_ID',D_DBPM_SSS2_4,'DriftPass');
S_ID_SSS2_5     = drift('S_ID',D_DBPM_SSS2_5,'DriftPass');

S_ID_SSS3_1     = drift('S_ID',D_DBPM_SSS3_1,'DriftPass');
S_ID_SSS3_2     = drift('S_ID',D_DBPM_SSS3_2,'DriftPass');
S_ID_SSS3_3     = drift('S_ID',D_DBPM_SSS3_3,'DriftPass');
S_ID_SSS3_4     = drift('S_ID',D_DBPM_SSS3_4,'DriftPass');
S_ID_SSS3_5     = drift('S_ID',D_DBPM_SSS3_5,'DriftPass');


LKICK = 0.715;
LSEPTA = 1.099;
LI0=1.1629-0.2-LKICK/2;
LI1= 1.445-LKICK;
LI2 = 1.5356-LKICK/2-LSEPTA/2;
LI3= 1.3346-LKICK/2-LSEPTA/2;
LI4= 1.445-LKICK;
LI5=1.2769-0.19-LKICK/2;
SEPTA    = drift('SEPTA', LSEPTA/2,'DriftPass');
L_I0     = drift('L_I0', LI0,'DriftPass');
L_I1     = drift('L_I1', LI1,'DriftPass');
L_I2     = drift('L_I2', LI2,'DriftPass');
L_I3     = drift('L_I3', LI3,'DriftPass');
L_I4     = drift('L_I4', LI4,'DriftPass');
L_I5    = drift('L_I5', LI5,'DriftPass');



% Mark1_1= marker ('MARK1_1' ,'IdentityPass');
% Mark1_2= marker ('MARK1_2' ,'IdentityPass');
% Mark1_3= marker ('MARK1_3' ,'IdentityPass');
% Mark2_1= marker ('MARK2_1' ,'IdentityPass');
% Mark2_2= marker ('MARK2_2' ,'IdentityPass');
% Mark2_3= marker ('MARK2_3' ,'IdentityPass');
% Mark3= marker ('MARK3' ,'IdentityPass');
% Mark4= marker ('MARK4' ,'IdentityPass');
% Mark5= marker ('MARK5' ,'IdentityPass');
% Mark6= marker ('MARK6' ,'IdentityPass');

% 18.1550 8.3625  
Kmean= -0.568120443069375*(1-2e-3);
kf1=1.5610778752;
kf2=1.8791346193;
kf3=1.6508713549;
kf4=1.4219680829;
kf5=1.7704191923;
kf6=2.0898498873;
kf7=2.0522960625;
kf8=2.0053093484;
kd1=-1.8020940184;
kd2=-1.9312740825;
kd3=-1.9265917716;

% 18.1555    8.3620 
Kmean= -0.568120443069375*(1-0.00185);
kf1=1.5540089412;
kf2=1.8811441692;
kf3=1.6391651273;
kf4=1.4322176525;
kf5=1.7705642756;
kf6=2.0887601834;
kf7=2.0512282663;
kf8=2.0054382265;
kd1=-1.7948933173;
kd2=-1.9236509868;
kd3=-1.9215517712;

% 18.1556    8.3620
Kmean= -0.568120443069375*(1-0.00215);
kf1=1.5714233471;
kf2=1.8467110296;
kf3=1.6411758378;
kf4=1.3996706175;
kf5=1.7973034973;
kf6=2.0906389994;
kf7=2.0544279307;
kf8=2.0063457695;
kd1=-1.7744576263;
kd2=-1.9372823356;
kd3=-1.9350284972;


% QD1 =    quadrupole('QD1',  Leff_QD1, kd1,'StrMPoleSymplectic4Pass');
% QD2 =    quadrupole('QD2',  Leff_QD2, kd2,'StrMPoleSymplectic4Pass');
% QD3 =    quadrupole('QD3',  Leff_QD3, kd3,'StrMPoleSymplectic4Pass');
% QF1 =    quadrupole('QF1',  Leff_QF1,  kf1,'StrMPoleSymplectic4Pass');
% QF2 =    quadrupole('QF2',  Leff_QF2,  kf2,'StrMPoleSymplectic4Pass');
% QF3 =    quadrupole('QF3',  Leff_QF3,  kf3, 'StrMPoleSymplectic4Pass');
% QF4 =    quadrupole('QF4',  Leff_QF4,  kf4,'StrMPoleSymplectic4Pass');
% QF5 =    quadrupole('QF5',  Leff_QF5,  kf5,'StrMPoleSymplectic4Pass');
% QF6 =    quadrupole('QF6',  Leff_QF6,  kf6,'StrMPoleSymplectic4Pass');
% QF7 =    quadrupole('QF7',  Leff_QF7,  kf7,'StrMPoleSymplectic4Pass');
% QF8 =    quadrupole('QF8',  Leff_QF8,  kf8,'StrMPoleSymplectic4Pass');
% 
% FAMLIST{QD1}.ElemData.NumIntSteps=20;
% FAMLIST{QD2}.ElemData.NumIntSteps=20;
% FAMLIST{QD3}.ElemData.NumIntSteps=20;
% FAMLIST{QF1}.ElemData.NumIntSteps=20;
% FAMLIST{QF2}.ElemData.NumIntSteps=20;
% FAMLIST{QF3}.ElemData.NumIntSteps=20;
% FAMLIST{QF4}.ElemData.NumIntSteps=20;
% FAMLIST{QF5}.ElemData.NumIntSteps=20;
% FAMLIST{QF6}.ElemData.NumIntSteps=20;
% FAMLIST{QF7}.ElemData.NumIntSteps=20;
% FAMLIST{QF8}.ElemData.NumIntSteps=20;

QV01 =    quadrupole('QV01',  Leff_QD1, kd1,'StrMPoleSymplectic4Pass');
QV02 =    quadrupole('QV02',  Leff_QD2, kd2,'StrMPoleSymplectic4Pass');
QV03 =    quadrupole('QV03',  Leff_QD3, kd3,'StrMPoleSymplectic4Pass');
QV04 =    quadrupole('QV04',  Leff_QD3, kd3,'StrMPoleSymplectic4Pass');
QH01 =    quadrupole('QH01',  Leff_QF1,  kf1,'StrMPoleSymplectic4Pass');
QH02 =    quadrupole('QH02',  Leff_QF2,  kf2,'StrMPoleSymplectic4Pass');
QH03 =    quadrupole('QH03',  Leff_QF3,  kf3, 'StrMPoleSymplectic4Pass');
QH04 =    quadrupole('QH04',  Leff_QF4,  kf4,'StrMPoleSymplectic4Pass');
QH05 =    quadrupole('QH05',  Leff_QF5,  kf5,'StrMPoleSymplectic4Pass');
QH06 =    quadrupole('QH06',  Leff_QF6,  kf6,'StrMPoleSymplectic4Pass');
QH07 =    quadrupole('QH07',  Leff_QF7,  kf7,'StrMPoleSymplectic4Pass');
QH08 =    quadrupole('QH08',  Leff_QF8,  kf8,'StrMPoleSymplectic4Pass');
QH09 =    quadrupole('QH09',  Leff_QF8,  kf8,'StrMPoleSymplectic4Pass');
QH10 =    quadrupole('QH10',  Leff_QF7,  kf7,'StrMPoleSymplectic4Pass');

FAMLIST{QV01}.ElemData.NumIntSteps=20;
FAMLIST{QV02}.ElemData.NumIntSteps=20;
FAMLIST{QV03}.ElemData.NumIntSteps=20;
FAMLIST{QV04}.ElemData.NumIntSteps=20;
FAMLIST{QH01}.ElemData.NumIntSteps=20;
FAMLIST{QH02}.ElemData.NumIntSteps=20;
FAMLIST{QH03}.ElemData.NumIntSteps=20;
FAMLIST{QH04}.ElemData.NumIntSteps=20;
FAMLIST{QH05}.ElemData.NumIntSteps=20;
FAMLIST{QH06}.ElemData.NumIntSteps=20;
FAMLIST{QH07}.ElemData.NumIntSteps=20;
FAMLIST{QH08}.ElemData.NumIntSteps=20;
FAMLIST{QH09}.ElemData.NumIntSteps=20;
FAMLIST{QH10}.ElemData.NumIntSteps=20;

%test skew quad
QS = skewquad('QS', 1E-6, 0.0, 'StrMPoleSymplectic4Pass');
% Fitted values to produce normalized chromaticities 0,0

% find solution
% sd1=3.773552757295;
% sd2=3.450533977090;
% sd3=4.235518338263;
% sd4=5.622368749844;
% sd5=4.695698015019;
% sf1=2.088833235258;
% sf2=5.475748492716;
% sf3=6.255217090623;
% sf4=3.154775077847;


CS=1;
% SD1    = sextupole('SD1' ,Leff_SD1/2, -CS*sd1/Leff_SD1 ,'StrMPoleSymplectic4Pass');
% SD2    = sextupole('SD2' ,Leff_SD2/2, -CS*sd2/Leff_SD2 ,'StrMPoleSymplectic4Pass');
% SD3    = sextupole('SD3' ,Leff_SD3/2, -CS*sd3/Leff_SD3 ,'StrMPoleSymplectic4Pass');
% SD4    = sextupole('SD4' ,Leff_SD4/2, -CS*sd4/Leff_SD4 ,'StrMPoleSymplectic4Pass');
% SD5    = sextupole('SD5' ,Leff_SD5/2, -CS*sd5/Leff_SD5 ,'StrMPoleSymplectic4Pass');
% SF1    = sextupole('SF1' ,Leff_SF1/2, CS*sf1/Leff_SF1 ,'StrMPoleSymplectic4Pass');
% SF2    = sextupole('SF2' ,Leff_SF2/2, CS*sf2/Leff_SF2 ,'StrMPoleSymplectic4Pass');
% SF3    = sextupole('SF3' ,Leff_SF3/2, CS*sf3/Leff_SF3 ,'StrMPoleSymplectic4Pass');
% SF4    = sextupole('SF4' ,Leff_SF4/2, CS*sf4/Leff_SF4 ,'StrMPoleSymplectic4Pass');

 mf1=12.898596683536061;
 mf2=23.410740673575742;
 mf3=26.377133507916781;
 mf4=19.089768793840463;
 md1=-23.097598645993827;
 md2=-20.895986578560620;
 md3=-26.530119301768281;
 md4=-25.770220164013391;
 md5=-31.088865442719019;
    
SD1    = sextupole('SD1' ,Leff_SD1/2, CS*md1 ,'StrMPoleSymplectic4Pass');
SD2    = sextupole('SD2' ,Leff_SD2/2, CS*md2 ,'StrMPoleSymplectic4Pass');
SD3    = sextupole('SD3' ,Leff_SD3/2, CS*md3 ,'StrMPoleSymplectic4Pass');
SD4    = sextupole('SD4' ,Leff_SD4/2, CS*md4 ,'StrMPoleSymplectic4Pass');
SD5    = sextupole('SD5' ,Leff_SD5/2, CS*md5 ,'StrMPoleSymplectic4Pass');
SF1    = sextupole('SF1' ,Leff_SF1/2, CS*mf1 ,'StrMPoleSymplectic4Pass');
SF2    = sextupole('SF2' ,Leff_SF2/2, CS*mf2 ,'StrMPoleSymplectic4Pass');
SF3    = sextupole('SF3' ,Leff_SF3/2, CS*mf3 ,'StrMPoleSymplectic4Pass');
SF4    = sextupole('SF4' ,Leff_SF4/2, CS*mf4,'StrMPoleSymplectic4Pass');


bangle = 2*pi/32;
gap=0.036;
fint=0.7;
sext_dip_0 =-0.221129858946660;
% BEND = sbend ('BEND', 1.383684, bangle, bangle/2, bangle/2,...
%                  -0.565618, 'BndMPoleSymplectic4Pass');
BENDa = sbend ('BEND',Leff_BEND/2, bangle/2, phimean, 0,Kmean, 'BndMPoleSymplectic4Pass');
BENDb = sbend ('BEND',Leff_BEND/2, bangle/2,0, phimean,Kmean, 'BndMPoleSymplectic4Pass');
FAMLIST{BENDa}.ElemData.PolynomB(3)=sext_dip_0;
FAMLIST{BENDb}.ElemData.PolynomB(3)=sext_dip_0;
FAMLIST{BENDa}.ElemData.FringeInt1=fint;
FAMLIST{BENDb}.ElemData.FringeInt2=fint;
FAMLIST{BENDa}.ElemData.FringeInt2=0;
FAMLIST{BENDb}.ElemData.FringeInt1=0;
FAMLIST{BENDa}.ElemData.FullGap=gap;
FAMLIST{BENDb}.ElemData.FullGap=gap;
% FAMLIST{BENDa}.ElemData.NumIntSteps=20;
%FAMLIST{BENDb}.ElemData.NumIntSteps=20;
BEND=[BENDa BENDb];

cor = corrector('COR', 0, [0 0],'CorrectorPass');
BPM  =  [marker('BPM','IdentityPass') marker('BLM','IdentityPass')];
DBPM=marker('DBPM','IdentityPass');
SEXC=corrector('SEXC' ,0, [0 0],'CorrectorPass');
FFBKV=corrector('FFBKV' ,0, [0 0],'CorrectorPass');
FFBKH=corrector('FFBKH' ,0, [0 0],'CorrectorPass');
sm = marker('SM' ,'IdentityPass');
wiggmark = marker('WMK' ,'IdentityPass');
sep_entry = marker ('sep_entry','IdentityPass');
sep_center = marker ('SEPTUM','IdentityPass');
sep_exit = marker ('sep_exit','IdentityPass');
IK    = corrector('IK' ,LKICK, [0 0],'CorrectorPass');
xrs = marker ('xrs' ,'IdentityPass');
medium = marker ('medium' ,'IdentityPass');
long = marker ('long' ,'IdentityPass');
short = marker ('short' ,'IdentityPass');

% Begin Lattice
hcm = cor;

cSD1 = [SD1 hcm SD1];
cSD2 = [SD2 QS SD2];
cSD3 = [SD3 QS SD3];
cSD4 = [SD4 hcm SD4];
cSD5 = [SD5 QS SD5];
cSF1 = [SF1 hcm SF1];
cSF2 = [SF2 hcm SF2];
cSF3 = [SF3 hcm SF3];
cSF4 = [SF4 hcm SF4];
KICKER = IK;

% OCTED_match=[Mark3 L_ID BPM L_BPM_1 QD1 D11 QF1 D12 cSF1 D13 QF2 D14 BPM L_BPM_2 cSD1 D15 BEND...
%     D21 cSD2 D22 BPM L_BPM_3 QF3 D23 QF4 D24 cSF2 D25 BPM L_BPM_4 QF5 D26 BPM L_BPM_5 cSD3 D28 BENDa Mark1_1 BENDb...
%     D31 cSD4 L_BPM_6 BPM D32 QF6h Mark2_1 QF6h D33 cSF3 D34 QD2 L_BPM_7 BPM M_ID...
%     Mark4 M_ID_b BPM L_BPM_7 QD3 D34_b cSF3 D33_b QF7h Mark2_2 QF7h D32_b BPM L_BPM_6 cSD4 D31_b BENDa Mark1_2 BENDb...
%     D41 cSD5 L_BPM_8 BPM D42 QF8 D43 BPM L_BPM_9 cSF4 S_ID...
%     Mark5 S_ID cSF4 L_BPM_9 BPM D43 QF8 D42 BPM L_BPM_8 cSD5 D41 BENDa Mark1_3 BENDb...
%     D31_b L_BPM_6 cSD4 BPM D32_b QF7h Mark2_3 QF7h D33_b cSF3 D34_b QD3 L_BPM_7 BPM M_ID_b Mark6      
%     ];

% BLOCK1  = [L_ID BPM L_BPM_1 QD1 D11 QF1 D12 cSF1 D13 QF2 D14 BPM L_BPM_2 cSD1 D15];
% BLOCK1Ia = [L_I0 KICKER L_I1 KICKER L_I2 sep_entry SEPTA];
% BLOCK1Ib = [ sep_center SEPTA sep_exit L_I3 KICKER L_I4 KICKER L_I5];
% BLOCK1ia  = [BPM L_BPM_1 QD1 D11 QF1 D12 cSF1 D13 QF2 D14 BPM L_BPM_2 cSD1 D15];
% BLOCK2  = [D21 cSD2 D22 BPM L_BPM_3 QF3 D23 QF4 D24 cSF2 D25 BPM L_BPM_4 QF5 D26 BPM L_BPM_5 cSD3 D28];
% BLOCK31 = [D31 cSD4 L_BPM_6 BPM D32 QF6 D33 cSF3 D34 QD2 L_BPM_7 BPM M_ID];
% BLOCK32 = [M_ID_b BPM L_BPM_7 QD3 D34_b cSF3 D33_b QF7 D32_b BPM L_BPM_6 cSD4 D31_b];
% BLOCK4  = [D41 cSD5 L_BPM_8 BPM D42 QF8 D43 BPM L_BPM_9 cSF4 S_ID];
% 
% BLOCK32_b = [M_ID_b BPM L_BPM_7 QD3 D34_b cSF3 D33_b QF7 D32_b BPM L_BPM_6 cSD4 D31_b];
% BLOCK4_b  = [D41 cSD5 L_BPM_8 BPM D42 QF8 D43 BPM L_BPM_9 cSF4 S_ID];


FQH01 = marker ('FQH01' ,'IdentityPass');
FQH02 = marker ('FQH02' ,'IdentityPass');
FQH03 = marker ('FQH03' ,'IdentityPass');
FQH04 = marker ('FQH04' ,'IdentityPass');
FQH05 = marker ('FQH05' ,'IdentityPass');
FQH06 = marker ('FQH06' ,'IdentityPass');
FQH07 = marker ('FQH07' ,'IdentityPass');
FQH08 = marker ('FQH08' ,'IdentityPass');
FQH09 = marker ('FQH09' ,'IdentityPass');
FQH10 = marker ('FQH10' ,'IdentityPass');
FQV01 = marker ('FQV01' ,'IdentityPass');
FQV02 = marker ('FQV02' ,'IdentityPass');
FQV03 = marker ('FQV03' ,'IdentityPass');
FQV04 = marker ('FQV04' ,'IdentityPass');

FAMLIST{FQV01}.ElemData.K=kd1;
FAMLIST{FQV02}.ElemData.K=kd2;
FAMLIST{FQV03}.ElemData.K=kd3;
FAMLIST{FQV04}.ElemData.K=kd3;
FAMLIST{FQH01}.ElemData.K=kf1;
FAMLIST{FQH02}.ElemData.K=kf2;
FAMLIST{FQH03}.ElemData.K=kf3;
FAMLIST{FQH04}.ElemData.K=kf4;
FAMLIST{FQH05}.ElemData.K=kf5;
FAMLIST{FQH06}.ElemData.K=kf6;
FAMLIST{FQH07}.ElemData.K=kf7;
FAMLIST{FQH08}.ElemData.K=kf8;
FAMLIST{FQH09}.ElemData.K=kf8;
FAMLIST{FQH10}.ElemData.K=kf7;


BLOCK1  = [L_ID BPM L_BPM_1 QV01 FQV01 D11 QH01 FQH01 D12 cSF1 D13 QH02 FQH02 D14 BPM L_BPM_2 cSD1 D15];
BLOCK1Ia = [L_I0 KICKER L_I1 KICKER L_I2 sep_entry SEPTA];
BLOCK1Ib = [ sep_center SEPTA sep_exit L_I3 KICKER L_I4 KICKER L_I5];
BLOCK1ia  = [BPM L_BPM_1 QV01 FQV01 D11 QH01 FQH01 D12 cSF1 D13 QH02 FQH02 D14 BPM L_BPM_2 cSD1 D15];
BLOCK2  = [D21 cSD2 D22 BPM L_BPM_3 QH03 FQH03 D23 QH04 FQH04 D24 cSF2 D25 BPM L_BPM_4 QH05 FQH05 D26 BPM L_BPM_5 cSD3 D28];
BLOCK31 = [D31 cSD4 L_BPM_6 BPM D32 QH06 FQH06 D33 cSF3 D34 QV02 FQV02 L_BPM_7 BPM M_ID];
BLOCK32 = [M_ID_b BPM L_BPM_7 QV03 FQV03 D34_b cSF3 D33_b QH07 FQH07 D32_b BPM L_BPM_6 cSD4 D31_b];
BLOCK4  = [D41 cSD5 L_BPM_8 BPM D42 QH08 FQH08 D43 BPM L_BPM_9 cSF4 S_ID];
BLOCK32_b = [M_ID_b BPM L_BPM_7 QV04 FQV04 D34_b cSF3 D33_b QH10 FQH10 D32_b BPM L_BPM_6 cSD4 D31_b];
BLOCK4_b  = [D41 cSD5 L_BPM_8 BPM D42 QH09 FQH09 D43 BPM L_BPM_9 cSF4 S_ID];

BLOCK1_s2  = [L_ID_s2 BPM L_BPM_1_s2 QV01 FQV01 D11_s2 QH01 FQH01 D12_s2 cSF1 D13_s2 QH02 FQH02 D14_s2 BPM L_BPM_2_s2 cSD1 D15_s2];
BLOCK1ia_s2  = [BPM L_BPM_1_s2 QV01 FQV01 D11_s2 QH01 FQH01 D12_s2 cSF1 D13_s2 QH02 FQH02 D14_s2 BPM L_BPM_2 cSD1 D15_s2];
BLOCK2_s2  = [D21_s2 cSD2 D22_s2 BPM L_BPM_3_s2 QH03 FQH03 D23_s2 QH04 FQH04 D24_s2  BPM L_BPM_4_s2 cSF2 D25_s2 QH05 FQH05 D26_s2 BPM L_BPM_5_s2 cSD3 D28_s2];
BLOCK31_s2 = [D31_s2 cSD4 L_BPM_6_s2 BPM D32_s2 QH06 FQH06 D33_s2 cSF3 D34_s2 QV02 FQV02 L_BPM_7_s2 BPM M_ID_s2];
BLOCK32_s2 = [M_ID_b_s2 BPM L_BPM_7_s2 QV03 FQV03 D34_b_s2 cSF3 D33_b_s2 QH07 FQH07 D32_b_s2 BPM L_BPM_6_s2 cSD4 D31_b_s2];
BLOCK4_s2  = [D41_s2 cSD5 L_BPM_8_s2 BPM D42_s2 QH08 FQH08 D43_s2 BPM L_BPM_9_s2 cSF4 S_ID_s2];
BLOCK32_b_s2=[M_ID_b_s2 BPM L_BPM_7_s2 QV04 FQV04 D34_b_s2 cSF3 D33_b_s2 QH10 FQH10 D32_b_s2 BPM L_BPM_6_s2 cSD4 D31_b_s2];
BLOCK4_b_s2  = [D41_s2 cSD5 L_BPM_8_s2 BPM D42_s2 QH09 FQH09 D43_s2 BPM L_BPM_9_s2 cSF4 S_ID_s2];

S_ID_SSS2_L=[S_ID_SSS2_1 DBPM S_ID_SSS2_2];
S_ID_SSS2_R=[S_ID_SSS2_5 DBPM S_ID_SSS2_4 SEXC S_ID_SSS2_3];
S_ID_SSS3_L=[S_ID_SSS3_1 DBPM S_ID_SSS3_2];
S_ID_SSS3_R=[S_ID_SSS3_5 DBPM S_ID_SSS3_4 FFBKV S_ID_SSS3_3 FFBKH];
BLOCK4_SSS2_L  = [D41 cSD5 L_BPM_8 BPM D42 QH08 FQH08 D43 BPM L_BPM_9 cSF4 S_ID_SSS2_L];
BLOCK4_b_SSS2_R  = [D41 cSD5 L_BPM_8 BPM D42 QH09 FQH09 D43 BPM L_BPM_9 cSF4 S_ID_SSS2_R];
BLOCK4_b_s2_SSS3_L  = [D41_s2 cSD5 L_BPM_8_s2 BPM D42_s2 QH08 FQH08 D43_s2 BPM L_BPM_9_s2 cSF4 S_ID_SSS3_L];
BLOCK4_s2_SSS3_R  = [D41_s2 cSD5 L_BPM_8_s2 BPM D42_s2 QH09 FQH09 D43_s2 BPM L_BPM_9_s2 cSF4 S_ID_SSS3_R];

SECTOR1 =  [ ...
    sm BLOCK1ia BEND BLOCK2 BEND ...
    BLOCK31  wiggmark medium xrs BLOCK32 BEND BLOCK4_SSS2_L short reverse(BLOCK4_b_SSS2_R)  BEND...
    reverse(BLOCK32_b) medium xrs wiggmark wiggmark BLOCK32_b_s2 BEND BLOCK4_b_s2_SSS3_L short reverse(BLOCK4_s2_SSS3_R) BEND ...
    reverse(BLOCK32_s2) wiggmark medium xrs reverse(BLOCK31_s2) BEND reverse(BLOCK2_s2) BEND ...
    reverse(BLOCK1_s2) long xrs sm ];

SECTOR2 =  [ ...
    sm BLOCK1 BEND BLOCK2 BEND ...
    BLOCK31 medium xrs BLOCK32 BEND BLOCK4 short reverse(BLOCK4_b)  BEND...
    reverse(BLOCK32_b) medium xrs BLOCK32_b_s2 BEND BLOCK4_b_s2 short reverse(BLOCK4_s2) BEND ...
    reverse(BLOCK32_s2) medium xrs reverse(BLOCK31_s2) BEND reverse(BLOCK2_s2) BEND ...
    reverse(BLOCK1_s2) long xrs sm];

SECTOR3 =  [ ...
    sm BLOCK1 BEND BLOCK2 BEND ...
    BLOCK31 medium xrs BLOCK32 BEND BLOCK4 short reverse(BLOCK4_b)  BEND...
    reverse(BLOCK32_b) medium xrs  BLOCK32_b_s2 BEND BLOCK4_b_s2 short reverse(BLOCK4_s2) BEND ...
    reverse(BLOCK32_s2) medium xrs reverse(BLOCK31_s2) BEND reverse(BLOCK2_s2) BEND ...
    reverse(BLOCK1_s2) long xrs sm];

SECTOR4 =  [ ...
    sm APLim  BLOCK1 BEND BLOCK2 BEND ...
    BLOCK31 medium xrs BLOCK32 BEND BLOCK4 short reverse(BLOCK4_b)  BEND...
    reverse(BLOCK32_b) medium xrs BLOCK32_b_s2 BEND BLOCK4_b_s2 short reverse(BLOCK4_s2) BEND ...
    reverse(BLOCK32_s2) medium xrs reverse(BLOCK31_s2) BEND reverse(BLOCK2_s2) BEND ...
    reverse(BLOCK1ia_s2) long sm];

MACHINE = [BLOCK1Ib SECTOR1 SECTOR2 CAV SECTOR3 SECTOR4 BLOCK1Ia];

buildlat(MACHINE);

% Set all magnets to same energy
THERING = setcellstruct(THERING,'Energy',1:length(THERING),GLOBVAL.E0); 


evalin('caller','global THERING FAMLIST GLOBVAL');

%atsummary;

if nargout
    varargout{1} = THERING;
end
