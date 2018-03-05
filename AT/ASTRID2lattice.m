function ASTRID2lattice(varargin)
% ASTRID lattice definition file ASTRID2lattice
% Based on a2_lat033
% Original Created 130218  /Jørgen S. Nielsen
% QF1: QMH101 (tune Q-pole)
% QF2: QMH102 (dispersion Q-pole)

global FAMLIST THERING GLOBVAL

GLOBVAL.E0 = 5.80e8;
GLOBVAL.LatticeFile = 'ASTRID2lattice.m';
FAMLIST = cell(0);
Energy=5.8e8;
%clc;
disp(' ');
disp('** Loading ASTRID2 lattice in ASTRID2lattice.m (Final lattice with BPMs, correctors, and Qpole shunts) **');

% insertion device data just for reference
% "small" wiggler
ID2_L = 0.700;
ID2_Period = 0.116;
ID2_K = 21.7;   % at 12 mm gap
MPWoffset = 0.700;            % The MPW will be offset 0.700 m from the center (HJJ 10/6-11)
% old Astrid undulator
ID3_L = 1.650;
ID3_Period = 0.055;
ID3_K = 2.87;    % at 22 mm gap
% new AMO undulator
ID5_L = 1.950;
ID5_Period = 0.065;
ID5_K = 4.89;   % at 12 mm gap
% an undulator (like the new) in SS6 (this does not exist)
ID6_L = 1.750;      % 1.95 m is too long in initial calc's
ID6_Period = 0.065;
ID6_K = 4.89;


LBump=0.20;                            % Length of the fast bumpers
LBumpEnds=0.05;                        % Length of the Nessary distance at the ends of the fast bumpers
LBumpTotal=LBump+2*LBumpEnds;
%Lstraight= 2.69740+2*(-0.05+0.055+.03);                   % This gives a total length of 45.70442 m
Lstraight= 2.815403334;                   % This gives a total length of 45.70442 m
Ldr1=(Lstraight)/10;                  % the straights is divided into 10 pieces
Ldr1aSep = 0.57235/2;                  % half the distance from septum end (injection Mark) to end of straight section
                                      % 0.57235m=0.83835m-(Ldr2+Ldr3-0.5*LQF3)
Ldr1bSep = Ldr1+2*(Ldr1-Ldr1aSep);    % The "dr1" distance before septum end (injection Mark)
Ldr1bBPM115 = 0.206;                  % The "dr1" distance before BPM115
Ldr1aBPM115 = Ldr1-Ldr1bBPM115;       % The "dr1" distance after BPM115
Ldr1bBPM145 = 0.86979-3*Ldr1;         % The "dr1" distance before BPM145, 
        % BPM145 is a lattice position 23.722 m, which is 0.86979 m after section middle
        %, which is 3*Ldr1+0.025169 m
Ldr1aBPM145 = Ldr1-Ldr1bBPM145;       % The "dr1" distance after BPM145
Ldrrem2 = (Lstraight-ID2_L)/4;        % The remaining straight is divided into 4
Ldrrem2a = Ldrrem2-MPWoffset/2;       % A MPWoffset of zero mean that the MPS in the center of SS2
Ldrrem3 = (Lstraight-ID3_L)/4;        % The remaining straight is divided into 4
Ldrrem5 = (Lstraight-ID5_L)/4;        % The remaining straight is divided into 4
Ldrrem6 = (Lstraight-ID6_L)/4;        % The remaining straight is divided into 4

AP = aperture('AP', [-0.05, 0.05, -0.05, 0.05],'AperturePass');

DR1   =    drift('DR1' ,Ldr1,    'DriftPass');          % 1/10 of Straight section length
DR1mB   =    drift('DR1mB' ,Ldr1-LBump,    'DriftPass'); 
DR1aSep =    drift('DR1aSep', Ldr1aSep,    'DriftPass'); % 1/2 distance after septum
DR1bSep =    drift('DR1bSep', Ldr1bSep,    'DriftPass'); % "dr1" distance before septum
DR1aBPM115 =    drift('DR1aBPM115', Ldr1aBPM115,    'DriftPass'); % dr1 distance after BPM115
DR1bBPM115 =    drift('DR1bBPM115', Ldr1bBPM115,    'DriftPass'); % dr1 distance before BPM115
DR1aBPM145 =    drift('DR1aBPM145', Ldr1aBPM145,    'DriftPass'); % dr1 distance after BPM145
DR1bBPM145 =    drift('DR1bBPM145', Ldr1bBPM145,    'DriftPass'); % dr1 distance before BPM145
DR2   =    drift('DR2' ,0.121000,'DriftPass');          % BPM and Valve
DR3   =    drift('DR3' ,0.07900,'DriftPass');           % distance between BPM and QF3
DR4   =    drift('DR4' ,0.195000,'DriftPass');          % Distance between correctors and BH
DR5   =    drift('DR5' ,0.230000,'DriftPass');          % Distance between BH and SD
DR6   =    drift('DR6' ,0.084000,'DriftPass');          % Distance between SD and QF2
DR7   =    drift('DR7' ,0.134000,'DriftPass');          % Distance between QF2 and SF
DR8   =    drift('DR8' ,0.089000,'DriftPass');          % Distance between QF3 and cordip
DRcor  =    drift('DRcor' ,0.050000,'DriftPass');       % 1/2 the corrector length
DRBump  =    drift('DRBump',0.05,  'DriftPass');          % Nessary distance at the ends of the fast bumpers
DRrem2b =    drift('DRrem2b',2*Ldrrem2-Ldrrem2a-LBumpTotal/2,  'DriftPass');       % The remaining drift space in straight section 2 after the bumper
DRrem2a =    drift('DRrem2a',Ldrrem2a,  'DriftPass');       % 1/4 of the extra space in straight section 2
DRrem3 =    drift('DRrem3',Ldrrem3,  'DriftPass');       % 1/4 of the extra space in straight section 3
DRrem5 =    drift('DRrem5',Ldrrem5,  'DriftPass');       % 1/4 of the extra space in straight section 5
DRrem6a =    drift('DRrem6a',Ldrrem6,  'DriftPass');       % 1/4 of the extra space in straight section 6
DRrem6b =    drift('DRrem6b',2*Ldrrem6-LBumpTotal,  'DriftPass');       % The remaining drift space in straight section 6 before the bumper
DR5a   =    drift('DR5a' ,0.160000,'DriftPass');          % Half Distance between BH and SD
DR5b   =    drift('DR5b' ,0.0700000,'DriftPass');          % Half Distance between BH and SD

Smark  =    marker('Smark', 'IdentityPass');       % a zero length marker (for the middle of the straights)
BPM    =    marker('BPM', 'IdentityPass');       % a zero length marker 
BPM115    =    marker('BPM115', 'IdentityPass');       % a zero length
BPM145    =    marker('BPM145', 'IdentityPass');       % a zero length 
InjMark  =    marker('InjMark', 'IdentityPass');       % a zero length marker (for the Injection Point (end of Septum))

DR5BPM = [DR5a BPM DR5b];

% Best candidate as of 091029
 Q2 =  8.2046978;        % This gives tunes of (5.1850 2.1400), Dx=-0.000037, emit 12.7nm, tau=1.20h (for no insertions)
 Q3 =  8.03161237;
 QBH = -1.6636713;
 KSF  =  63.1200255;       % This gives chromaties of [1,1] (in MatLab)
 KSD  =  -36.7388799;       
%KSF=0;
%KSD=0;

 KBH  = 0;              % No sextupole gradient in the BH
 KfQ2  = 0;             % Test with sextupole gradient in QF2

Qguess=[5.1850, 2.1400];

QF2half     =    quadrupole('QF2' , 0.132000/2, Q2 ,'StrMPoleSymplectic4Pass');
%FAMLIST{QF2half}.ElemData.PolynomB(3) = KfQ2;
QF1half     =    quadrupole('QF1' , 0.13200/2, Q3 ,'StrMPoleSymplectic4Pass');

SF      =    sextupole('SF'  , 0.08500, KSF ,'StrMPoleSymplectic4Pass');    % Half the SF
SD      =    sextupole('SD'  , 0.085000, KSD ,'StrMPoleSymplectic4Pass');    % Half the SD (to allow corrector)

BA1=0;
BA2=0;
BA3=0;
BUMP1   = corrector('BUMP1',LBump,[BA1 0.0],'CorrectorPass');
BUMP2   = corrector('BUMP2',LBump,[BA2 0.0],'CorrectorPass');
BUMP3   = corrector('BUMP3',LBump,[BA3 0.0],'CorrectorPass');

LCorr = 0.1;

% HV correctors
%DMHV   = corrector('DMHV',LCorr,[0.0 0.0], 'StrMPoleSymplectic4Pass');       % we use the 'StrMPoleSymplectic4Pass', because the we can use the same method to set the H corrector in the SD magnets
DMHV   = corrector('DMHV',LCorr,[0.0 0.0], 'CorrectorPass');       % 
QF2cor   = corrector('QF2cor', 0, [0.0 0.0], 'CorrectorPass');       % QF2 is the qpoles at center of the girders (powered by QMH102IPS)
QF1cor   = corrector('QF1cor', 0, [0.0 0.0], 'CorrectorPass');       % QF1 is the qpoles at ends of the girders (powered by QMH101IPS)
SFcor   = corrector('SFcor', 0, [0.0 0.0], 'CorrectorPass');       % SF is the sextupoles at center of the girders
SDcor   = corrector('SDcor', 0, [0.0 0.0], 'CorrectorPass');       % SD is the sextupoles next to the dipoles
PFWcor   = corrector('PFWcor',0,[0.0 0.0], 'CorrectorPass');       % 
SScor   = corrector('SScor',0,[0.0 0.0], 'CorrectorPass');       % Straight Section virtuel corrector

QF2 = [QF2half QF2cor QF2half];
QF1 = [QF1half QF1cor QF1half];
SDDMH = [SD SDcor SD];


BBANGLE = pi/6; 
BEdge = 0;         % sector bend
% Bending defocusing magnets
BH     =    sbend('BH'  ,0.8500/10, BBANGLE/10, BEdge, BEdge, QBH,'BndMPoleSymplectic4Pass');
%BH     =    sbend('BH'  ,0.8500/2, BBANGLE/2, BEdge, BEdge, QBH,'BndMPoleSymplectic4Pass');
%BHs     =    sbend('BH'  ,0.8500, BBANGLE, BEdge, BEdge, QBH,'BndMPoleSymplectic4Pass');
FAMLIST{BH}.ElemData.PolynomB(3) = KBH;

L0 =   45.7044200;   % design length [m] h=16 of 104.950 MHz
C0 =   299792458; % speed of light [m/s]
CAV    = rfcavity('CAV1' , 0, 100e3 , 16*C0/L0 , 16, 'CavityPass');   

% just create placeholders for the insertion devices
Lid2 = ID2_L/4;         % Split the ID into 4 pieces for more lattice points
ID2 = drift('ID2', Lid2, 'DriftPass');
Lid3 = ID3_L/4;         % Split the ID into 4 pieces for more lattice points
ID3 = drift('ID3', Lid3, 'DriftPass');
Lid5 = ID5_L/4;         % Split the ID into 4 pieces for more lattice points
ID5 = drift('ID5', Lid5, 'DriftPass');
Lid6 = ID6_L/4;         % Split the ID into 4 pieces for more lattice points
ID6 = drift('ID6', Lid6, 'DriftPass');

% Begin Lattice

BHs = [BH BH BH BH BH PFWcor BH BH BH BH BH];
%BHs = [BH PFWcor BH];

HalfArc = [DR2 BPM DR3 QF1 DR8 DMHV DR4 BHs DR5BPM SDDMH DR6 QF2 DR7 SF];
Arc = [HalfArc SFcor reverse(HalfArc)];
HalfStraight = [DR1 DR1 DR1 DR1 DR1];
HalfBStraight = [DR1 DR1 DR1 BPM DR1 DR1];
D2R1 = [DR1 DR1];
HalfStraight = [ID6 DRrem6b];
Sector = [Smark HalfStraight Arc HalfStraight];
SS1b = [DR1mB BUMP2 DR1 DR1 DR1 DR1 ];      % Note BUMP2  is only approximate      % SS1 Before the middle
SS1a = [Smark SScor DR1bBPM115 BPM115 DR1aBPM115 DR1 DR1bSep InjMark DR1aSep DR1aSep];      % SS1 After the middle
SS2 = [DRBump BUMP3 DRBump DRrem2b DRrem2b ID2 ID2 Smark SScor ID2 ID2 DRrem2a DRrem2a];
SS3 = [DRrem3 DRrem3 ID3 ID3 Smark SScor ID3 ID3 DRrem3 DRrem3];
SS4 = [DR1 DR1 CAV DR1 DR1 DR1 Smark SScor DR1 DR1 DR1 DR1bBPM145 BPM145 DR1aBPM145 DR1];
SS5 = [DRrem5 DRrem5 ID5 ID5 Smark SScor ID5 ID5 DRrem5 DRrem5];
SS6 = [DRrem6a DRrem6a ID6 ID6 Smark SScor ID6 ID6 DRrem6b DRBump BUMP1 DRBump];
      
ELIST =  [AP  SS1a Arc SS2 Arc SS3 Arc SS4 Arc SS5 Arc SS6 Arc SS1b];       % This gives a ring which "begins" in the middle of SS1

buildlat(ELIST);

THERING = setcellstruct(THERING, 'Energy', 1:length(THERING), Energy);
evalin('caller','global THERING FAMLIST GLOBVAL');



