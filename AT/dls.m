function dls
% 
% DIAMOND STORAGE RING LATTICE
% version 7 iss 1 rev 3 for the AT; RB 29/09/2003
%
% non zero dispersion in straights
% six families of harmonic sextupoles
% starting point at the middle of the long straight
%
global FAMLIST THERING GLOBVAL

GLOBVAL.E0 = 3e9;
GLOBVAL.LatticeFile = 'dls';
FAMLIST = cell(0);

disp(' ');
disp('** Loading DIAMOND lattice **');

AP  =  aperture('AP', [-0.05, 0.05, -0.05, 0.05],'AperturePass');
% drifts
D1D2      = drift('D1D2' ,.4940500E+01,'DriftPass');
D1BCentre = drift('D1BCentre' ,.1000000E+01,'DriftPass');
D1BEnd2   = drift('D1BEnd2' ,.2440500E+01,'DriftPass');
D1A       = drift('D1A' ,.2385000E+00,'DriftPass');
D2A       = drift('D2A' ,.1990000E+00,'DriftPass');
D2B       = drift('D2B' ,.1500000E+00,'DriftPass');
D3A       = drift('D3A' ,.4250000E+00,'DriftPass');
D3B       = drift('D3B' ,.2350000E+00,'DriftPass');
D4A       = drift('D4A' ,.5875000E+00,'DriftPass');
D4B       = drift('D4B' ,.4650000E+00,'DriftPass');
D5B       = drift('D5B' ,.2000000E+00,'DriftPass');
D6B       = drift('D6B' ,.6675000E+00,'DriftPass');
KD1       = drift('KD1' ,.3300000E+00,'DriftPass'); % for correctors
KD2       = drift('KD2' ,.4010000E+00,'DriftPass'); % for correctors
KD3       = drift('KD3' ,.3300000E+00,'DriftPass'); % for correctors
KD4       = drift('KD4' ,.4010000E+00,'DriftPass'); % for correctors

%QF and QD valus set to have the tune at (27.2256,12.3632)
Q1D  =   quadrupole('Q1D' , 0.400, -.7126250E+00,'QuadLinearPass');
Q2D  =   quadrupole('Q2D' , 0.600,  .1272800E+01,'QuadLinearPass');
Q3D  =   quadrupole('Q3D' , 0.300, -.1007140E+01,'QuadLinearPass');
Q2AD =   quadrupole('Q2AD', 0.400, -.9896300E+00,'QuadLinearPass');
Q1AD =   quadrupole('Q1AD', 0.400,  .1263560E+01,'QuadLinearPass');
Q1AB =   quadrupole('Q1AB', 0.400,  .1286190E+01,'QuadLinearPass');
Q2AB =   quadrupole('Q2AB', 0.400, -.1044950E+01,'QuadLinearPass');
Q3B  =   quadrupole('Q3B' , 0.300, -.8843700E+00,'QuadLinearPass');
Q2B  =   quadrupole('Q2B' , 0.600,  .1475330E+01,'QuadLinearPass');
Q1B  =   quadrupole('Q1B' , 0.400, -.1246210E+01,'QuadLinearPass');

S1A  =  drift('S1A' ,0.3,'DriftPass');
S2A  =  drift('S2A' ,0.2,'DriftPass');
S1B  =  drift('S1B' ,0.3,'DriftPass');
S2B  =  drift('S2B' ,0.3,'DriftPass');
S1C  =  drift('S1C' ,0.3,'DriftPass');
S2C  =  drift('S2C' ,0.3,'DriftPass');
S1D  =  drift('S1D' ,0.3,'DriftPass');
S2D  =  drift('S2D' ,0.3,'DriftPass');
% S1A  =   sextupole('S1A' , 0.3,  5.449444/0.3, 'StrMPoleSymplectic4Pass'); 
% S2A  =   sextupole('S2A' , 0.2, -3.349528/0.2, 'StrMPoleSymplectic4Pass'); 
% S1B  =   sextupole('S1B' , 0.3,  3.148519/0.3, 'StrMPoleSymplectic4Pass'); 
% S2B  =   sextupole('S2B' , 0.3, -4.993216/0.3, 'StrMPoleSymplectic4Pass'); 
% S1C  =   sextupole('S1C' , 0.3,  2.546022/0.3, 'StrMPoleSymplectic4Pass');
% S2C  =   sextupole('S2C' , 0.3, -3.263168/0.3, 'StrMPoleSymplectic4Pass'); 
% S1D  =   sextupole('S1D' , 0.3,  2.069871/0.3, 'StrMPoleSymplectic4Pass'); 
% S2D  =   sextupole('S2D' , 0.3, -5.028928/0.3, 'StrMPoleSymplectic4Pass'); 

% markers
ss  =  marker('shortstraight', 'IdentityPass');
ls  =  marker('longstraight', 'IdentityPass');
dipl  =  marker('longdipole', 'IdentityPass');

% RF cavity
L0 =   561.6; % design length [m]
L0_exact = 561.5999999999985;

C0 =   299792458; % speed of light [m/s]
CAV    = rfcavity('RF' , 0, 3.3e+6 , 936*C0/L0_exact, 936, 'CavityPass');

% Bending
BBANGLE=2*pi/48;
BB   =   sbend('BB'  ,0.936, BBANGLE, BBANGLE/2, BBANGLE/2, 0,'BendLinearPass');


% Begin Lattice
SPERIOD = [ls...
 D1D2       KD3        KD4...
 Q1D        D2B        S1D       D3B        Q2D        D4B...
 Q3D        D5B        S2D       D6B        dipl       BB...
 D4A        Q2AD       D3A       S2A        D2A...
 Q1AD       D1A        S1A       D1A        Q1AB...
 D2A        S2A        D3A       Q2AB       D4A...
 BB         dipl       D6B       S2C        D5B        Q3B...
 D4B        Q2B        D3B       S1C        D2B        Q1B...
 KD2        KD1        D1BEnd2   D1BCentre ...
 ss...  
 D1BCentre  D1BEnd2    KD1...
 KD2        Q1B        D2B       S1B        D3B...
 Q2B        D4B        Q3B       D5B        S2B...
 D6B        BB         D4A       Q2AB       D3A...
 S2A        D2A        Q1AB      D1A        S1A...
 D1A        Q1AB       D2A       S2A        D3A...
 Q2AB       D4A        BB        D6B        S2B...
 D5B        Q3B        D4B       Q2B        D3B        S1B...
 D2B        Q1B        KD2       KD1        ...
 D1BEnd2    D1BCentre ...
 ss...  
 D1BCentre  D1BEnd2    ...
 KD1        KD2        Q1B        D2B...
 S1B        D3B        Q2B        D4B        Q3B        ...
 D5B        S2B        D6B        BB         D4A        ...
 Q2AB       D3A        S2A        D2A        Q1AB       D1A...
 S1A        D1A        Q1AB       D2A        ...
 S2A        D3A        Q2AB       D4A        BB         D6B...
 S2B        D5B        Q3B        D4B        Q2B... 
 D3B        S1B        D2B        Q1B        KD2        ...
 KD1        D1BEnd2    D1BCentre ...
 ss...  
 D1BCentre...
 D1BEnd2    KD1        KD2...
 Q1B        D2B        S1C       D3B        Q2B        D4B...
 Q3B        D5B        S2C       D6B        BB...
 D4A        Q2AB       D3A       S2A        D2A...
 Q1AB       D1A        S1A       D1A        Q1AD...
 D2A        S2A        D3A       Q2AD       D4A...
 BB         D6B        S2D       D5B        Q3D...
 D4B        Q2D        D3B       S1D        D2B        Q1D...
 KD4        KD3        D1D2];

DIAMOND = [SPERIOD,SPERIOD,SPERIOD,SPERIOD,SPERIOD,SPERIOD,CAV];


buildlat(DIAMOND);

for i=1:length(THERING)
    THERING{i}.Energy = 3e9;
end

evalin('caller','global THERING FAMLIST GLOBVAL');
disp('** Done **');
