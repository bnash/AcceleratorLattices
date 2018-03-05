function varargout = lat_nano_155_229_122BPM_bxSDL01_09_11m 
% betax = 5 m dans les sections droites longues
% solamor2 - soleil lattice w/o ID
% Lattice definition file
% Lattice for SOLEIL: perfect lattice no magnetic errors

% Compiled by Laurent Nadolski and Amor Nadji
% 09/01/02, ALS
% mai 2006 : mis a jour vraies cotes BPM, correcteurs, dipole (coins,
% chamd de fuite et gradient)
% A. Nadji et P. Brunelle
% Controlroom : set linearpass for quad (closed orbit)
%               No cavity; No Radiation PassMethod
% April 20th 2007, Laurent S. nadolski
% BPM downstream injection section had wrong location by
% 30 mm, 2 FCOR in injection straight section was not at their proper
% location
% November 24th 2007, Laurent S. Nadolski
% Bpms 5 on the wrong side of sextupole in cell 4, 8, 12 and 16
% December 7th, 2007, Laurent S. Nadolski
% Added KEM V & H, K1 & K2 markers modelled as thin element
% October 1, 2008
% Lattice with tunes 18.2020 and 10.3170
% Octobre 27, 2008
% Lattice with tunes 18.2020 and 10.3170
% Lattice with chromaticities 2.0 and 2.0
% March 4, 2009
% FHCOR and FVCOR [1 1] steerer moved 2180 mm upstream, 
% closed to entrance of vertical kicker
% March 2009 - New quadrupole model from MAT with intermediate length
% June 2009 - magnetcoefficient with index June 9 was changed 
%             for sextupoles calibration
%             for quadrupole Just all ranges for quad variation with fit are present
% July 2009 - Add PX2 Chicane
% Novembre 2010 - S11 added, QT0 removed
% 18 April 2011 - Tunes update 0.2017,  0.3169 moved 0.1990  0.3169
% 29 Mai 2011 - Add Scrapers + straight sections
% July 2011 - Add PX2 as rbend, Nanoscopium, new circumference 354.09702 m
% (200 um larger)

global FAMLIST THERING GLOBVAL

GLOBVAL.E0 = 2.7391e9; % Ring energy
GLOBVAL.LatticeFile = mfilename;
FAMLIST = cell(0);

disp(['** Loading SOLEIL magnet lattice ', mfilename]);

L0 = 3.5409702042030095e+02;% design length [m]
C0 = PhysConstant.speed_of_light_in_vacuum.value;          % speed of light [m/s]
HarmNumber = 416;

%% RF Cavity
%              NAME   L     U[V]       f[Hz]          h        method
CAV = rfcavity('RF' , 0.0 , 2.472e+6 , HarmNumber*C0/L0, HarmNumber ,'CavityPass');

%% Marker and apertures
SECT1  =  marker('SECT1', 'IdentityPass');
SECT2  =  marker('SECT2', 'IdentityPass');
SECT3  =  marker('SECT3', 'IdentityPass');
SECT4  =  marker('SECT4', 'IdentityPass');
DEBUT  =  marker('DEBUT', 'IdentityPass');
FIN    =  marker('FIN', 'IdentityPass');

%% SCRAPER
HSCRAP =  marker('HSCRAP', 'IdentityPass');
VSCRAP =  marker('VSCRAP', 'IdentityPass');

%INJ = aperture('INJ',[-0.035 0.035 -0.0125 0.0125]*100,'AperturePass');

%% Elements in Injection section
PtINJ = marker('PtINJ', 'IdentityPass');
K1 = corrector('K1',0.0,[0 0],'CorrectorPass');
K2 = corrector('K2',0.0,[0 0],'CorrectorPass');
K3 = corrector('K3',0.0,[0 0],'CorrectorPass');
K4 = corrector('K4',0.0,[0 0],'CorrectorPass');

%% BPM
BPM    =  marker('BPM', 'IdentityPass');

%% QUADRUPOLES (compensation de l'effet des defauts de focalisation des
LQC = 0.180100E+00*2 ;
LQL = 0.248100E+00*2 ;

QPassMethod = 'StrMPoleSymplectic4Pass';

Q1   =  quadrupole('Q1' , LQC, -1.210124e+00, QPassMethod);
Q2   =  quadrupole('Q2' , LQL,  1.687181e+00, QPassMethod);
Q3   =  quadrupole('Q3' , LQC, -6.375736e-01, QPassMethod);
Q4   =  quadrupole('Q4' , LQC, -1.229389e+00, QPassMethod);
Q5   =  quadrupole('Q5' , LQC,  1.713696e+00, QPassMethod);
Q6   =  quadrupole('Q6' , LQC, -1.163583e+00, QPassMethod);
Q7   =  quadrupole('Q7' , LQL,  2.034258e+00, QPassMethod);
Q8   =  quadrupole('Q8' , LQC, -1.357527e+00, QPassMethod);
Q9   =  quadrupole('Q9' , LQC, -1.356975e+00, QPassMethod);
Q10  =  quadrupole('Q10', LQC,  1.736498e+00, QPassMethod);
Q11  =  quadrupole('Q11', LQC, -1.671113e+00, QPassMethod);
Q12  =  quadrupole('Q12', LQL,  1.667791e+00, QPassMethod);

%% SEXTUPOLES CHROMATICITES NULLES dans TracyII
%avec defauts de focalisation des dipoles
%P. Brunelle 02/05/06
F = 1e8;
Finv = 1/F;
SPassMethod = 'StrMPoleSymplectic4Pass';

S1  =  sextupole('S1' , Finv,  0.281*5*F, SPassMethod);
S2  =  sextupole('S2' , Finv, -0.654*5*F, SPassMethod);
S3  =  sextupole('S3' , Finv, -0.338*5*F, SPassMethod);
S4  =  sextupole('S4' , Finv,  0.697*5*F, SPassMethod);
S5  =  sextupole('S5' , Finv, -0.714*5*F, SPassMethod);
S6  =  sextupole('S6' , Finv,  0.667*5*F, SPassMethod);
S7  =  sextupole('S7' , Finv, -0.992*5*F, SPassMethod);
S8  =  sextupole('S8' , Finv,  0.778*5*F, SPassMethod);
S9  =  sextupole('S9' , Finv, -0.8434*5*F, SPassMethod);
S10 =  sextupole('S10', Finv,  0.5063*5*F, SPassMethod);
S11 =  sextupole('S11', Finv,  0.242*5*F, SPassMethod);
S12 =  sextupole('S12', Finv,  1.000E-10*F, SPassMethod); % to be drawn by drawlattice

%% Skew quadrupoles
SQPassMethod = SPassMethod;
QT  =  skewquad('SkewQuad', 1e-8, 0.0, SQPassMethod);
QTPX2    =  skewquad('QTPX2', 1e-10, 0.0, SPassMethod); % PX2

%% Slow feedback correctors
COR =  corrector('COR',0.0,[0 0],'CorrectorPass');

%% Machine study kickers
KEMH =  corrector('KEMH',0.0,[0 0],'CorrectorPass');
KEMV =  corrector('KEMV',0.0,[0 0],'CorrectorPass');

%% PX2C H-correctors
% Tuners
PX2 =  corrector('PX2C',0.0,[0 0],'CorrectorPass');
% Main magnets
CHIPX2D1 = rbend2('PX2', 0.026, -2.25e-3,  0.00e-3, -2.25e-3, 0,0,'BndMPoleSymplectic4Pass');
CHIPX2D2 = rbend2('PX2', 0.052,  4.50e-3, -2.25e-3,  2.25e-3, 0,0,'BndMPoleSymplectic4Pass');
CHIPX2D3 = rbend2('PX2', 0.026, -2.25e-3,  2.25e-3,  0.00e-3, 0,0,'BndMPoleSymplectic4Pass');
PX2C= [QTPX2 PX2];

%% NANOC magnets for nanoscopium
% Tuners
CHINANO   = corrector('NANOC',0.0,[0 0],'CorrectorPass'); % tuning magnet
% Main magnets
CHINANOD1   =  rbend2('NANO', 0.069, -0.50e-3,  0.00e-3, -0.50e-3, 0,0,'BndMPoleSymplectic4Pass');
CHINANOD2   =  rbend2('NANO', 0.069, -5.38e-3, -0.50e-3, -5.88e-3, 0,0,'BndMPoleSymplectic4Pass');
CHINANOD3   =  rbend2('NANO', 0.138, 11.88e-3, -5.88e-3, +6.00e-3, 0,0,'BndMPoleSymplectic4Pass');
CHINANOD4   =  rbend2('NANO', 0.069, -6.00e-3,  6.00e-3,  0.00e-3, 0,0,'BndMPoleSymplectic4Pass');

%% HU640
HCMHU640 =  corrector('HCMHU640',0.0,[0 0],'CorrectorPass');
VCMHU640 =  corrector('VCMHU640',0.0,[0 0],'CorrectorPass');

%% Fast feedback correctors
FCOR =  corrector('FCOR',0.0,[0 0],'CorrectorPass');

%% Feedforward correctors
FFWDCOR =  corrector('FFWDCOR',0.0,[0 0],'CorrectorPass');

%% Slow correctors in sextupole magnets
SX1   = [S1  COR  QT];
SX2   = [S2  COR  QT];
SX3   = [S3  COR  QT];
SX4   = [S4  COR  QT];
SX5   = [S5  COR  QT];
SX6   = [S6  COR  QT];
SX7   = [S7  COR  QT];
SX8   = [S8  COR  QT];
SX9   = [S9  COR  QT];
SX10  = [S10 COR  QT];
SX11  = [S11 COR  QT];
SX12  = [S12 COR  QT];


%% DIPOLES
% {** 1.3815 factor to fit with BETA ??? strange **}
%theta = 2*pi/32;
%fullgap = 0.105*0.724*2/6*1.3815*0.;
% BEND  =  rbend2('BEND', L, theta, theta/2, theta/2, 0.0, ...
%                 fullgap,'BendLinearFringeTiltPass');
theta = 2*pi/32;
%theta2 = theta/2;
thetae = theta/2 - 0.6e-3;
thetas = theta/2 + 0.9e-3;
K = 0.00204;
fullgap = 0.037*0.724*2;
%BEND  =  rbend2('BEND', 1.05243, theta, thetae, thetas, K,fullgap,'BendLinearPass');
BEND  =  rbend2('BEND', 1.05243, theta, thetae, thetas, K,fullgap,'BndMPoleSymplectic4Pass');

% BEND1  =  rbend2('BEND', 1.05243*1/3, theta*1/3, thetae, 0, K,fullgap,'BndMPoleSymplectic4Pass');
% BEND2  =  rbend2('BEND', 1.05243*1/3, theta*1/3, 0, 0, K,fullgap,'BndMPoleSymplectic4Pass');
% BEND3  =  rbend2('BEND', 1.05243*1/3, theta*1/3, 0, thetas, K,fullgap,'BndMPoleSymplectic4Pass');
% BEND=[BEND1  BEND2 BEND3];

%% IDS
% file='/Users/nadolski/Documents/Travail/codes/tracy/maille/soleil/w50/kick_w50_g55_p60.txt';  % made with RADIA
% nslice=10;
% [SWSV50 SWSV50Length] = idtable('SWSV50', nslice,file, (GLOBVAL.E0)/1e9,'IdTablePass');
% 
% SDWSV50 = drift('SDWSV50',  3.141452-SWSV50Length/2, 'DriftPass');


%% DRIFT SPACES

SD1a = drift('SD1a',  1.4125, 'DriftPass');
SD1b = drift('SD1b',  0.7575, 'DriftPass');
SD2 = drift('SD2',  0.369900, 'DriftPass');
SD3 = drift('SD3',   0.181900, 'DriftPass');
SD5 = drift('SD5',  0.179900, 'DriftPass');
SD6 = drift('SD6',  0.79000, 'DriftPass');
SD7 = drift('SD7',  0.419900, 'DriftPass');
SD8 = drift('SD8',  0.1799000, 'DriftPass');
SD12= drift('SD12', 0.44990, 'DriftPass');
SD12u= drift('SD12', (0.36565-LQC/2), 'DriftPass'); % upstream V V-scraper 
SD12d= drift('SD12', 0.44990-(0.36565-LQC/2), 'DriftPass'); % downstream H-scraper
SD12u2= drift('SD12', 0.36565-LQC/2, 'DriftPass'); % upstream H-scraper exterior Q5.1/S4 C16
SD12d2= drift('SD12', 0.44990-(0.36565-LQC/2), 'DriftPass'); % H-scraper exterior
SD1d = drift('SD1d',  0.5170, 'DriftPass');
SD14a = drift('SD14a', 0.38500000, 'DriftPass');
SD9a = drift('SD9a',  0.204200	, 'DriftPass');
SD10a = drift('SD10a', 0.172300	, 'DriftPass');
SDAC1 = drift('SDAC1', 1.48428	, 'DriftPass');
SD13a= drift('SD13a', 3.141452 	, 'DriftPass');
SD1e = drift('SD1e',  5.6589, 'DriftPass');
SD1c1 = drift('SD1c1',  0.8410, 'DriftPass'); % K3 - FCOR
SD1c2 = drift('SD1c2',  0.601, 'DriftPass');  % FCOR KEMH
SD1c3u= drift('SD1c3u', 0.683, 'DriftPass');  % KEMH - VSCRAPER
SD1c3d= drift('SD1c3u', 1.560-0.683, 'DriftPass');  % VSCRAPER - K4
SD91 = drift('SD91',  0.251240, 'DriftPass');
SD41 = drift('SD41',  0.2521, 'DriftPass');
SD42 = drift('SD42',  0.205, 'DriftPass');
SD92 = drift('SD92',  0.204300, 'DriftPass');
SD93 = drift('SD93',  0.251300	, 'DriftPass');
SD43 = drift('SD43', 0.2051	, 'DriftPass');
SD141 = drift('SD141', 0.431900, 'DriftPass');
SDB1 = drift('SDB1', 0.29100, 'DriftPass');
SDB2 = drift('SDB2', 0.16680000, 'DriftPass');
SDB3 = drift('SDB3', 0.252,  'DriftPass');
SDB4 = drift('SDB4', 0.2776 ,'DriftPass');
SDB5 = drift('SDB5', 0.205  ,'DriftPass');
SDB6 = drift('SDB6', 0.119800 ,'DriftPass');
SDB7 = drift('SDB7', 0.166900 , 'DriftPass');
SDB8 = drift('SDB8', 0.252 , 'DriftPass');
SDB9 = drift('SDB9', 0.119800 ,'DriftPass');
SDB10= drift('SDB10',0.166900 , 'DriftPass');
SDB11= drift('SDB11',0.2519, 'DriftPass');
SDB12= drift('SDB12',0.2049, 'DriftPass');
SDB13= drift('SDB13',0.119800, 'DriftPass');
SDB14= drift('SDB14',0.1668000, 'DriftPass');
SDB15= drift('SDB15',0.252 , 'DriftPass');
SDB17= drift('SDB17',0.205 , 'DriftPass');
SDB18= drift('SDB18',0.1199000 , 'DriftPass');
SDC1 = drift('SDC1' , 0.241900 ,  'DriftPass');
SDC2 = drift('SDC2' , 0.079 ,  'DriftPass');
SDC3 = drift('SDC3' , 0.07845, 'DriftPass');
SDC4 = drift('SDC4' , 0.3358,  'DriftPass');
SDC5 = drift('SDC5' , 0.0846,  'DriftPass');
SDC6 = drift('SDC6' , 0.079,   'DriftPass');
SDC7 = drift('SDC7' , 0.342 ,  'DriftPass');
SDC8 = drift('SDC8' , 0.241900 ,  'DriftPass');
SDC9 = drift('SDC9' , 0.079  , 'DriftPass');
DRFT10= drift('DRFT10',0.07845, 'DriftPass');
DRFT11= drift('DRFT11',0.2419000  , 'DriftPass');
DRFT12= drift('DRFT12',0.3358 , 'DriftPass');
DRFT13= drift('DRFT13',0.0846 , 'DriftPass');
DRFT14= drift('DRFT14',0.0788 , 'DriftPass');
DRFT15= drift('DRFT15',0.3422 , 'DriftPass');
DRFT16= drift('DRFT16',0.241900  , 'DriftPass');
DRFT17= drift('DRFT17',0.079  , 'DriftPass');
DRFT18= drift('DRFT18',0.07845, 'DriftPass');
DRFT19= drift('DRFT19',0.24190  , 'DriftPass');
SDC20= drift('SDC20',0.241900  , 'DriftPass');
SDC21= drift('SDC21',0.079  , 'DriftPass');
SDC22= drift('SDC22',0.29090  , 'DriftPass');
SDC24= drift('SDC24',1.379  , 'DriftPass');
%SDC23a= drift('SDC23a',0.632  , 'DriftPass'); % BPM - K1
SDC23b= drift('SDC23b',1.983  , 'DriftPass'); % K1 - KEMV
SDC23c= drift('SDC23c',1.019  , 'DriftPass'); % KEMV - K2
SDC23d= drift('SDC23d',0.676  , 'DriftPass'); % K2 - FCOR
SDC23e= drift('SDC23a',0.147  , 'DriftPass'); % BPM - FCOR [1 1]
SDC23f= drift('SDC23a',0.485  , 'DriftPass'); % FCOR [1 1] next SD

% HU640 straight section
SDHU640a = drift('SDHU640a',  1.7394, 'DriftPass');
SDHU640b = drift('SDHU640b',  0.6400, 'DriftPass');
SDHU640c = drift('SDHU640c',  3.2795, 'DriftPass');
SDHU640d = drift('SDHU640d',  3.1195, 'DriftPass');
SDHU640e = drift('SDHU640e',  0.6400, 'DriftPass');
SDHU640f = drift('SDHU640f',  1.8994, 'DriftPass');

% PX2 straights
SDPX2a= drift('SDPX2a', 0.363902-FAMLIST{CHIPX2D1}.ElemData.Length/2, 'DriftPass'); % BPM - CHI.1
SDPX2b= drift('SDPX2b', 2.857550-FAMLIST{CHIPX2D1}.ElemData.Length/2-FAMLIST{CHIPX2D2}.ElemData.Length/2, 'DriftPass'); % CHI.1 - CHI.2
SDPX2c= drift('SDPX2c', 0.203902-FAMLIST{CHIPX2D1}.ElemData.Length/2, 'DriftPass'); % CHI.3 - BPM

% Nanoscopium straigths (upstream)
SDNANO1 = drift('SDNANO1',  0.4501-FAMLIST{CHINANOD1}.ElemData.Length/2, 'DriftPass'); % BPM - CHI.1
SDNANO2 = drift('SDNANO2',  0.5529-FAMLIST{CHINANOD1}.ElemData.Length/2, 'DriftPass'); % CHI.1 - FFWDCOR
SDNANO3 = drift('SDNANO3',  2.5630, 'DriftPass'); % FFWDCOR - FFWDCOR
SDNANO4 = drift('SDNANO4',  0.4330-FAMLIST{CHINANOD2}.ElemData.Length/2, 'DriftPass'); % FFWDCOR - CHI.2
SDNANO5 = drift('SDNANO5',  0.2683-FAMLIST{CHINANOD2}.ElemData.Length/2, 'DriftPass'); % CHI.2 - BPM
SDNANO6 = drift('SDNANO6',  0.0780, 'DriftPass'); % BPM - FCOR
SDNANO6a= drift('SDNANO6a', 0.5017-0.0780-FAMLIST{Q11}.ElemData.Length/2, 'DriftPass'); % BPM - Q11.1
SDNANO7 = drift('SDNANO7',  0.4100-FAMLIST{Q11}.ElemData.Length/2-FAMLIST{S12}.ElemData.Length/2, 'DriftPass'); % Q11.1 - S12
SDNANO8 = drift('SDNANO8',  0.4800-FAMLIST{Q12}.ElemData.Length/2-FAMLIST{S12}.ElemData.Length/2, 'DriftPass'); % S12 - Q11
% Nanoscopium straigths (downstream)
SDNANO9 = drift('SDNANO9',  0.4628-0.0780-FAMLIST{Q11}.ElemData.Length/2, 'DriftPass'); % Q11.2 - FOFB
SDNANO10= drift('SDNANO10', 0.3072-FAMLIST{CHINANOD3}.ElemData.Length/2, 'DriftPass'); % BPM - CHI.3
SDNANO11= drift('SDNANO11', 0.4330-FAMLIST{CHINANOD3}.ElemData.Length/2, 'DriftPass'); % FFWDCOR - FFWDCOR


%% STRAIGHT SECTIONS (between BPMs)
% 4 long straight sections (12 m, available part 10.50 m)

%SDL01 (injection) is split in upstream and downstrem parts
SDL01d = [SD1a   PtINJ   SD1b   K3  SD1c1 FCOR  SD1c2  KEMH SD1c3u VSCRAP SD1c3d   K4     SD1d];
SDL01u = [SDC23e  FCOR SDC23f K1 SDC23b KEMV SDC23c K2 SDC23d SDC24];
% SDL05 HU640 straight section
HU640upstream   = [SDHU640a VCMHU640 SDHU640b HCMHU640 SDHU640c];
HU640downstream = [SDHU640d HCMHU640 SDHU640e VCMHU640 SDHU640f];
SDL05  = [HU640upstream HU640downstream]; % DESIRS HU640
SDL09  = [SD1e SD1e];
% TOMOGRAPHY U18 CRYO + NANOSCOPIUM U20 
SDL13u  = [SDNANO1 CHINANO CHINANOD1 SDNANO2 FFWDCOR SDNANO3 FFWDCOR SDNANO4 CHINANOD2 CHINANO SDNANO5 ...
           BPM SDNANO6 FCOR SDNANO6a Q11 SDNANO7 SX12 SDNANO8];
SDL13d  = [SDNANO8 SX12 SDNANO7 Q11 SDNANO9 FCOR SDNANO6 BPM  ...
           SDNANO10 CHINANO CHINANOD3 SDNANO11 FFWDCOR SDNANO3 FFWDCOR SDNANO2 CHINANOD4 CHINANO SDNANO1];
SDL13 = [SDL13u Q12 SDL13d];
%SDL13  = [SD1e SD1e]; % NANOSCOPIUM U20 + TOMOGRAPHY U18 CRYO

% 12 medium straigt sections (7 m, available part for IDs 5.46 m)
SDM02 = [SD13a CAV SD13a]; % CRYOMODULE #2
SDM03 = [SD13a SD13a]; % CRYOMUDULE #1 not put in the model for simplicity
SDM04 = [SD13a SD13a]; % PLEIADES HU256 + HU80
SDM06 = [SD13a SD13a]; % PUMA future Wiggler
%SDM06 = [SDWSV50 SWSV50 SDWSV50]; % PUMA future Wiggler
SDM07 = [SD13a SD13a]; % DEIMOS HU52+EMPHU65
SDM08 = [SD13a SD13a]; % TEMPO HU80+HU44
SDM10 = [SD13a SD13a]; % HERMES HU64+HU42
SDM11 = [SDPX2a PX2C CHIPX2D1 SDPX2b PX2C CHIPX2D2 SDPX2b CHIPX2D3 PX2C SDPX2c]; % PX2 U24
SDM12 = [SD13a SD13a]; % ANTARES HU256 + HU60
SDM14 = [SD13a SD13a]; % SEXTANTS (ex microFocus) HU44 + HU80
SDM15 = [SD13a SD13a]; % CASSIOPEE HU256 + HU80
SDM16 = [SD13a SD13a]; % LUCIA HU52

% 8 short straigt sections (3.6 m, available part for IDs 2.8 m)
SDC02 = [SDAC1 SDAC1];% LIGNE ALPHA
SDC03 = [SDAC1 SDAC1];% PSICHE WSV50
SDC06 = [SDAC1 SDAC1];% CRISTAL U20
SDC07 = [SDAC1 SDAC1];% GALAXIES U20
SDC10 = [SDAC1 SDAC1];% PX1 U20
SDC11 = [SDAC1 SDAC1];% SWING U20
SDC14 = [SDAC1 SDAC1];% SIXS U20
SDC15 = [SDAC1 SDAC1];% SIRIUS HU34


%% Lattice
% Superperiods

% SUPERPERIOD #1
SUP1  = [...
    BPM  SDB1   Q1     SD2    SX1   SD3     Q2 ...
    SDB2  BPM    SD14a   Q3      SD5    SX2    SD6 ...
    BEND    SD7     Q4  SD8     SX3    ...
    SDB3  BPM     SD9a   Q5     SD12u HSCRAP SD12d  SX4 ...
    SDB4  BPM     SD10a    Q5     SD91     ...
    BPM  SDB5  SX3    SD8   Q4      SD7     BEND ...
    SD7     Q6      SD5    SX5     SD41    ...
    BPM  SDB6  Q7    SD3     SX6      SD2     Q8 ...
    SDC1 FCOR SDC2   BPM    SDM02 BPM ...
    SDC3    FCOR   SDC1 ...
    Q8      SD2    SX8     SD3    Q7  SDB7 ...
    BPM   SD42     SX7      SD5     Q6     SD7 ...
    BEND   SD7    Q9    SD8     SX9  SDB8 ...
    BPM     SD9a    Q10    SD8     SX10  SDC4  ...
    FCOR SDC5  BPM   SDC02 ...
    BPM   SDC6  FCOR  SDC7 SX10    SD8    Q10    SD91 ...
    BPM   SD42  SX9      SD8     Q9     SD7    ...
    BEND   SD7    Q6    SD5     SX7    SD41   ...
    BPM  SDB9  Q7      SD3    SX8    SD2   Q8 SDC8 ...
    FCOR  SDC9  BPM     SDM03  ...
    BPM  DRFT10   FCOR  DRFT11  Q8     SD2   SX8   SD3   Q7 ...
    SDB10  BPM   SD42    SX7    SD5   Q6      SD7  ...
    BEND    SD7     Q9     SD8     SX9  SDB11    ...
    BPM    SD92   Q10     SD8     SX10 DRFT12 ...
    FCOR  DRFT13  BPM    SDC03   ...
    BPM  DRFT14  FCOR   DRFT15   SX10   SD8     Q10    SD93 ...
    BPM  SDB12  SX9    SD8   Q9      SD7 ...
    BEND    SD7    Q6      SD5    SX7    SD41 ...
    BPM  SDB13   Q7      SD3    SX8     SD2    Q8  DRFT16 ...
    FCOR DRFT17  BPM    SDM04   ...
    BPM   DRFT18  FCOR  DRFT19   Q8     SD2     SX6    SD3    Q7 ...
    SDB14  BPM    SD43    SX5     SD5    Q6      SD7    ...
    BEND   SD7   Q4      SD8     SX3  SDB15 ...
    BPM     SD9a   Q5      SD12   ...
    SX4  SDB4  BPM     SD10a Q5     SD93 ...
    BPM  SDB17  SX3     SD8    Q4     SD7   ...
    BEND    SD6     SX2      SD5     Q3     SD141 ...
    BPM  SDB18  Q2     SD3   SX1     SD2     Q1 ...
    SDC20 FCOR  SDC21 BPM];

% SUPERPERIOD #2
SUP2  = [  ...
    BPM SDC2 FCOR SDC1   ...
    Q1     SD2    SX1   SD3     Q2 ...
    SDB7  BPM    SD14a   Q3      SD5    SX2    SD6 ...
    BEND    SD7     Q4  SD8     SX3    ...
    SDB3  BPM     SD9a   Q5     SD12  SX4 ...
    SDB4  BPM     SD10a    Q5     SD93     ...
    BPM  SDB5  SX3    SD8   Q4      SD7     BEND ...
    SD7     Q6      SD5    SX5     SD41    ...
    BPM  SDB6  Q7    SD3     SX6      SD2     Q8 ...
    SDC1 FCOR SDC2   BPM    SDM06  BPM ...
    SDC2    FCOR   SDC1 ...
    Q8      SD2    SX8     SD3    Q7  SDB7 ...
    BPM   SDB5     SX7      SD5     Q6     SD7 ...
    BEND   SD7    Q9    SD8     SX9  SDB3 ...
    BPM     SD9a    Q10    SD8     SX10  SDC4  ...
    FCOR SDC5  BPM   SDC06 ...
    BPM   DRFT14  FCOR  DRFT15 SX10    SD8    Q10    SD93 ...
    BPM   SDB12  SX9      SD8     Q9     SD7    ...
    BEND   SD7    Q6    SD5     SX7    SD41   ...
    BPM  SDB6  Q7      SD3    SX8    SD2   Q8 SDC1 ...
    FCOR  SDC2  BPM     SDM07  ...
    BPM  SDC2   FCOR  SDC1  Q8     SD2   SX8   SD3   Q7 ...
    SDB7  BPM   SDB5    SX7    SD5   Q6      SD7  ...
    BEND    SD7     Q9     SD8     SX9   SDB3    ...
    BPM    SD9a   Q10     SD8     SX10  SDC4 ...
    FCOR  SDC5  BPM    SDC07   ...
    BPM  DRFT14  FCOR   DRFT15   SX10   SD8     Q10    SD93 ...
    BPM  SDB12  SX9    SD8   Q9      SD7 ...
    BEND    SD7    Q6      SD5    SX7    SD41 ...
    BPM  SDB6   Q7      SD3    SX8     SD2    Q8  SDC1 ...
    FCOR SDC2  BPM    SDM08   ...
    BPM   SDC2  FCOR  SDC1   Q8     SD2     SX6    SD3    Q7 ...
    SDB7  BPM    SD42    SX5     SD5    Q6      SD7    ...
    BEND   SD7   Q4      SD8     SX3  SDB3 ...
    BPM     SD9a   Q5      SD12   ...
    SX4   SDB4  BPM     SD10a   Q5     SD93 ...
    BPM  SD42  SX3     SD8    Q4     SD7   ...
    BEND    SD6     SX2      SD5     Q3     SD141 ...
    BPM  SDB18  Q2     SD3   SX1     SD2     Q1 ...
    SDC1 FCOR  SDC2   BPM];

% SUPERPERIOD #3
SUP3  = [  ...
    BPM SDC2 FCOR SDC1   ...
    Q1     SD2    SX1   SD3     Q2 ...
    SDB7  BPM    SD14a   Q3      SD5    SX2    SD6 ...
    BEND    SD7     Q4  SD8     SX3    ...
    SDB3  BPM     SD9a   Q5     SD12  SX4 ...
    SDB4  BPM     SD10a    Q5     SD93     ...
    BPM  SDB5  SX3    SD8   Q4      SD7     BEND ...
    SD7     Q6      SD5    SX5     SD41    ...
    BPM  SDB6  Q7    SD3     SX6      SD2     Q8 ...
    SDC1 FCOR SDC2   BPM    SDM10  BPM ...
    SDC2    FCOR   SDC1 ...
    Q8      SD2    SX8     SD3    Q7  SDB7 ...
    BPM   SDB5     SX7      SD5     Q6     SD7 ...
    BEND   SD7    Q9    SD8     SX9  SDB3 ...
    BPM     SD9a    Q10    SD8     SX10  SDC4  ...
    FCOR SDC5  BPM   SDC10 ...
    BPM   DRFT14  FCOR  DRFT15 SX10    SD8    Q10    SD93 ...
    BPM   SDB12  SX9      SD8     Q9     SD7    ...
    BEND   SD7    Q6    SD5     SX7    SD41   ...
    BPM  SDB6  Q7      SD3    SX8    SD2   Q8 SDC1 ...
    FCOR  SDC2  BPM     SDM11  ...
    BPM  SDC2   FCOR  SDC1  Q8     SD2   SX8   SD3   Q7 ...
    SDB7  BPM   SDB5    SX7    SD5   Q6      SD7  ...
    BEND    SD7     Q9     SD8     SX9   SDB3    ...
    BPM    SD9a   Q10     SD8     SX10  SDC4 ...
    FCOR  SDC5  BPM    SDC11   ...
    BPM  DRFT14  FCOR   DRFT15   SX10   SD8     Q10    SD93 ...
    BPM  SDB12  SX9    SD8   Q9      SD7 ...
    BEND    SD7    Q6      SD5    SX7    SD41 ...
    BPM  SDB6   Q7      SD3    SX8     SD2    Q8  SDC1 ...
    FCOR SDC2  BPM    SDM12   ...
    BPM   SDC2  FCOR  SDC1   Q8     SD2     SX6    SD3    Q7 ...
    SDB7  BPM    SD42    SX5     SD5    Q6      SD7    ...
    BEND   SD7   Q4      SD8     SX3  SDB3 ...
    BPM     SD9a   Q5      SD12   ...
    SX4   SDB4  BPM     SD10a    Q5     SD93 ...
    BPM  SD42  SX3     SD8    Q4     SD7   ...
    BEND    SD6     SX2      SD5     Q3     SD141 ...
    BPM  SDB18  Q2     SD3   SX11     SD2     Q1 ...
    SDC1 FCOR  SDC2   BPM];

% SUPERPERIOD #4
SUP4  = [  ...
    BPM SDC2 FCOR SDC1   ...
    Q1     SD2    SX11   SD3     Q2 ...
    SDB7  BPM    SD14a   Q3      SD5    SX2    SD6 ...
    BEND    SD7     Q4  SD8     SX3    ...
    SDB3  BPM     SD9a   Q5     SD12  SX4 ...
    SDB4  BPM     SD10a    Q5     SD93     ...
    BPM  SDB5  SX3    SD8   Q4      SD7     BEND ...
    SD7     Q6      SD5    SX5     SD41    ...
    BPM  SDB6  Q7    SD3     SX6      SD2     Q8 ...
    SDC1 FCOR SDC2   BPM    SDM14  BPM ...
    SDC2    FCOR   SDC1 ...
    Q8      SD2    SX8     SD3    Q7  SDB7 ...
    BPM   SDB5     SX7      SD5     Q6     SD7 ...
    BEND   SD7    Q9    SD8     SX9  SDB3 ...
    BPM     SD9a    Q10    SD8     SX10  SDC4  ...
    FCOR SDC5  BPM   SDC14 ...
    BPM   DRFT14  FCOR  DRFT15 SX10    SD8    Q10    SD93 ...
    BPM   SDB12  SX9      SD8     Q9     SD7    ...
    BEND   SD7    Q6    SD5     SX7    SD41   ...
    BPM  SDB6  Q7      SD3    SX8    SD2   Q8 SDC1 ...
    FCOR  SDC2  BPM     SDM15  ...
    BPM  SDC2   FCOR  SDC1  Q8     SD2   SX8   SD3   Q7 ...
    SDB7  BPM   SDB5    SX7    SD5   Q6      SD7  ...
    BEND    SD7     Q9     SD8     SX9   SDB3    ...
    BPM    SD9a   Q10     SD8     SX10  SDC4 ...
    FCOR  SDC5  BPM    SDC15   ...
    BPM  DRFT14  FCOR   DRFT15   SX10   SD8     Q10    SD93 ...
    BPM  SDB12  SX9    SD8   Q9      SD7 ...
    BEND    SD7    Q6      SD5    SX7    SD41 ...
    BPM  SDB6   Q7      SD3    SX8     SD2    Q8  SDC1 ...
    FCOR SDC2  BPM    SDM16   ...
    BPM   SDC2  FCOR  SDC1   Q8     SD2     SX6    SD3    Q7 ...
    SDB7  BPM    SD42    SX5     SD5    Q6      SD7    ...
    BEND   SD7   Q4      SD8     SX3  SDB3 ...
    BPM     SD9a   Q5      SD12u2 HSCRAP   SD12d2   ...
    SX4   SDB4  BPM     SD10a    Q5     SD93 ...
    BPM  SD42  SX3     SD8    Q4     SD7   ...
    BEND    SD6     SX2      SD5     Q3     SD141 ...
    BPM  SDB18  Q2     SD3   SX1     SD2     Q1 ...
    SDC22 BPM];

%THE STORAGE RING
ELIST = [...
    DEBUT ...
    SECT1 SDL01d SUP1 ...
    SECT2 SDL05 SUP2 ...
    SECT3 SDL09 SUP3 ...
    SECT4 SDL13 SUP4 SDL01u  ...
    FIN];

buildlat(ELIST);

% Set all magnets to same energy
THERING = setcellstruct(THERING,'Energy',1:length(THERING),GLOBVAL.E0);

ATIndexList = atindex;

% set nanoscopium triplets upstream and downstream of SDL13
THERING = setNanoscopium(THERING,ATIndexList);

% set PX2 tuner chicane
%THERING{ATIndexList.PX2C(1)}.KickAngle(1) =  -2.25e-3; % rad
%THERING{ATIndexList.PX2C(2)}.KickAngle(1) = 2*2.25e-3; % rad
%THERING{ATIndexList.PX2C(3)}.KickAngle(1) =  -2.25e-3; % rad

%% set NANOSCOPIUM tuner magnets
THERING{ATIndexList.NANOC(1)}.KickAngle(1) =  -5.00e-6*0; % rad
THERING{ATIndexList.NANOC(2)}.KickAngle(1) =   2.25e-6*0; % rad
THERING{ATIndexList.NANOC(3)}.KickAngle(1) =  -1.25e-6*0; % rad
THERING{ATIndexList.NANOC(4)}.KickAngle(1) =  -2.25e-6*0; % rad

evalin('caller','global THERING FAMLIST GLOBVAL');
atsummary;


if nargout
    varargout{1} = THERING;
end

function THERING= setNanoscopium(THERING,ATIndexList)

QP1N = -1.336224e+00;
QP2N =  1.874242e+00;
QP3N = -1.126772e+00;
THERING = setquad(THERING, ATIndexList.Q1(6), QP1N);
THERING = setquad(THERING, ATIndexList.Q1(7), QP1N);
THERING = setquad(THERING, ATIndexList.Q2(6), QP2N);
THERING = setquad(THERING, ATIndexList.Q2(7), QP2N);
THERING = setquad(THERING, ATIndexList.Q3(6), QP3N);
THERING = setquad(THERING, ATIndexList.Q3(7), QP3N);

QI1  = -1.148605e+00;
QI2  =  1.698188e+00;
QI3  = -8.977849e-01;
QI4  = -1.032541e+00;
QI5  =  1.776718e+00;
QI51 =  1.551736e+00;
THERING = setquad(THERING, ATIndexList.Q1(1), QI1);
THERING = setquad(THERING, ATIndexList.Q1(8), QI1);
THERING = setquad(THERING, ATIndexList.Q1(4), QI1);
THERING = setquad(THERING, ATIndexList.Q1(5), QI1);

THERING = setquad(THERING, ATIndexList.Q2(1), QI2);
THERING = setquad(THERING, ATIndexList.Q2(8), QI2);
THERING = setquad(THERING, ATIndexList.Q2(4), QI2);
THERING = setquad(THERING, ATIndexList.Q2(5), QI2);

THERING = setquad(THERING, ATIndexList.Q3(1), QI3);
THERING = setquad(THERING, ATIndexList.Q3(8), QI3);
THERING = setquad(THERING, ATIndexList.Q3(4), QI3);
THERING = setquad(THERING, ATIndexList.Q3(5), QI3);

THERING = setquad(THERING, ATIndexList.Q4(1), QI4);
THERING = setquad(THERING, ATIndexList.Q4(16),QI4);
THERING = setquad(THERING, ATIndexList.Q4(8), QI4);
THERING = setquad(THERING, ATIndexList.Q4(9),QI4);

THERING = setquad(THERING, ATIndexList.Q5(1), QI5);
THERING = setquad(THERING, ATIndexList.Q5(16),QI5);
THERING = setquad(THERING, ATIndexList.Q5(8), QI5);
THERING = setquad(THERING, ATIndexList.Q5(9),QI5);

THERING = setquad(THERING, ATIndexList.Q5(2), QI51);
THERING = setquad(THERING, ATIndexList.Q5(15),QI51);
THERING = setquad(THERING, ATIndexList.Q5(7), QI51);
THERING = setquad(THERING, ATIndexList.Q5(10),QI51);

function THERING = setquad(THERING, Idx, K)

THERING{Idx}.K = K;
THERING{Idx}.PolynomB(2) = K;
fprintf('%s %03d %+f %+f\n', THERING{Idx}.FamName, Idx, THERING{Idx}.K, THERING{Idx}.PolynomB(2));
