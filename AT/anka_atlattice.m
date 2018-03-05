function anka_atlattice
%ANKA_ATLATTICE Load the ANKA AT lattice into the global variable THERING.

L0 = 1.1040016e+002;	% design length [m]
C0 =   299792458;	% speed of light [m/s]
H = 184;                % Cavity harmonic number

% length of dipole magnet
BBM_length = 2.183; 
% BBM_length = 2.169; 
% BBM_length = 2.164; 
% RF
RFC   =  struct('FamName', 'RF' , 'Energy', 2.5e9, ...
        'Length', 0.48 , 'Voltage', 3.0e+6 , 'Frequency', H*C0/L0, ...
        'HarmNumber', H , 'PassMethod', 'CavityPass');

% Markers
BPM.FamName = 'BPM';
BPM.Length = 0;
BPM.PassMethod = 'IdentityPass';

MBB.FamName = 'MBB';
MBB.Length = 0;
MBB.PassMethod = 'IdentityPass';

MBE.FamName = 'MBE';
MBE.Length = 0;
MBE.PassMethod = 'IdentityPass';

LSSM.FamName = 'LSSM';
LSSM.Length = 0;
LSSM.PassMethod = 'IdentityPass';

SSSM.FamName = 'SSSM';
SSSM.Length = 0;
SSSM.PassMethod = 'IdentityPass';

kick1.FamName = 'kick1';
kick1.Length = 0;
kick1.PassMethod = 'IdentityPass';

kick2.FamName = 'kick2';
kick2.Length = 0;
kick2.PassMethod = 'IdentityPass';

kick3.FamName = 'kick3';
kick3.Length = 0;
kick3.PassMethod = 'IdentityPass';

SEPT.FamName = 'SEPT';
SEPT.Length = 0;
SEPT.PassMethod = 'IdentityPass';

% Corrector Magnets
CH = struct('FamName', 'CH' ,...
        'Length', 0.0, 'KickAngle', [0 0], 'PassMethod', 'CorrectorPass'); 

CV = struct('FamName', 'CV' ,...
        'Length', 0.0, 'KickAngle', [0 0], 'PassMethod', 'CorrectorPass');


% Standard Cell Drifts

dr00 = atelem('drift',  'FamName', 'dr00',  'Length', 1.7080);
dr01 = atelem('drift',  'FamName', 'dr01',  'Length', 0.8280);
dr02 = atelem('drift',  'FamName', 'dr02',  'Length', 0.2655);
dr03 = atelem('drift',  'FamName', 'dr03',  'Length', 0.1784);
dr04 = atelem('drift',  'FamName', 'dr04',  'Length', 0.1841);
dr05 = atelem('drift',  'FamName', 'dr05',  'Length', 0.0875);
dr06 = atelem('drift',  'FamName', 'dr06',  'Length', 0.207505);

% dr07 = atelem('drift',  'FamName',  'dr07',  'Length', 0.0095);
% adjust length to compensate longer dipole magnets
dr07 = atelem('drift',  'FamName',  'dr07',  'Length', 0.0095-(BBM_length-2.164)/2);

dr08 = atelem('drift',  'FamName', 'dr08',  'Length', 0.107005);
dr09 = atelem('drift',  'FamName', 'dr09',  'Length', 0.0605);
dr10 = atelem('drift',  'FamName', 'dr10',  'Length', 0.14751);
dr11 = atelem('drift',  'FamName', 'dr11',  'Length', 0.80499);
dr12 = atelem('drift',  'FamName', 'dr12',  'Length', 0.0975);
dr13 = atelem('drift',  'FamName', 'dr13',  'Length', 0.3625);
dr14 = atelem('drift',  'FamName', 'dr14',  'Length', 0.235);
dr15 = atelem('drift',  'FamName', 'dr15',  'Length', 0.0725);
dr16 = atelem('drift',  'FamName', 'dr16',  'Length', 0.207505);
dr17 = atelem('drift',  'FamName', 'dr17',  'Length', 0.10701);
dr18 = atelem('drift',  'FamName', 'dr18',  'Length', 0.100495);
dr19 = atelem('drift',  'FamName', 'dr19',  'Length', 0.1525);
dr20 = atelem('drift',  'FamName', 'dr20',  'Length', 0.2975);
dr21 = atelem('drift',  'FamName', 'dr21',  'Length', 0.6475);
dr22 = atelem('drift',  'FamName', 'dr22',  'Length', 0.47);
dr23 = atelem('drift',  'FamName', 'dr23',  'Length', 0.449);
dr24 = atelem('drift',  'FamName', 'dr24',  'Length', 0.403);
dr25 = atelem('drift',  'FamName', 'dr25',  'Length', 0.1775);
dr26 = atelem('drift',  'FamName', 'dr26',  'Length', 0.185);
dr27 = atelem('drift',  'FamName', 'dr27',  'Length', 0.1005);
dr28 = atelem('drift',  'FamName', 'dr28',  'Length', 0.1675);
dr29 = atelem('drift',  'FamName', 'dr29',  'Length', 2.634);
dr30 = atelem('drift',  'FamName', 'dr30',  'Length', 0.1325);
dr31 = atelem('drift',  'FamName', 'dr31',  'Length', 0.33526);
dr32 = atelem('drift',  'FamName', 'dr32',  'Length', 0.16974);
dr33 = atelem('drift',  'FamName', 'dr33',  'Length', 0.25026);
dr34 = atelem('drift',  'FamName', 'dr34',  'Length', 0.38724);
dr35 = atelem('drift',  'FamName', 'dr35',  'Length', 1.0935);
dr36 = atelem('drift',  'FamName', 'dr36',  'Length', 0.95);
dr37 = atelem('drift',  'FamName', 'dr37',  'Length', 1.1175);

%  dr38 = atelem('drift',  'FamName', dr38',  'Length', 0.180005);

% AT (Benjamin Kehrer, 2016/10/18)
dr38 = atelem('drift',  'FamName',  'dr38',  'Length', 0.167505);

dr39 = atelem('drift',  'FamName', 'dr39',  'Length', 1.209);
dr40 = atelem('drift',  'FamName', 'dr40',  'Length', 1.425);
dr41 = atelem('drift',  'FamName', 'dr41',  'Length', 0.283);
dr42 = atelem('drift',  'FamName', 'dr42',  'Length', 1.21);
dr43 = atelem('drift',  'FamName', 'dr43',  'Length', 1.424);
dr44 = atelem('drift',  'FamName', 'dr44',  'Length', 1.228);
dr45 = atelem('drift',  'FamName', 'dr45',  'Length', 0.636);
dr46 = atelem('drift',  'FamName', 'dr46',  'Length', 0.9375);

dr29a = atelem('drift',  'FamName', 'dr29a',  'Length', 1.349);
drins = atelem('drift',  'FamName', 'drins',  'Length', 1.285);
dr00a = atelem('drift',  'FamName', 'dr00a',  'Length', 0.423);


Q1 = quadrupole_local('FamName', 'Q1', 'Length', 0.32, 'K', 2.0867);
Q2 = quadrupole_local('FamName', 'Q2', 'Length', 0.32, 'K', -2.0488);
Q3 = quadrupole_local('FamName', 'Q3', 'Length', 0.39, 'K', 2.0392);
Q4 = quadrupole_local('FamName', 'Q4', 'Length', 0.32, 'K', -2.0308);
Q5 = quadrupole_local('FamName', 'Q5', 'Length', 0.32, 'K', 2.0347);

Q5S1 = Q5;
Q5S2 = Q5;
Q5S3 = Q5;
Q5S4 = Q5;

% Vertical Sextupole
SV = sextupole_local(-30.5501, 'FamName', 'SV', 'Length', 0.145);

% Horizontal Sextupole
SH = sextupole_local(36.0613, 'FamName', 'SH', 'Length', 0.145);

% Bending Magnet
% The fringe field integrals depend on the beam energy,
% thus we cannot set them here.
BBM = atelem('bend', 'FamName', 'BBM','Length', 2.164,  ...
             'BendingAngle', 0.3927, 'EntranceAngle', 0.19635, ...
             'ExitAngle', 0.19635, 'FringeInt1', 0.536, 'FringeInt2', 0.536, 'FullGap', 0.041);
             % 1.3 GeV: 'ExitAngle', 0.19635, 'FringeInt1', 0.536, 'FringeInt2', 0.536, 'FullGap', 0.041);
             % 2.5 GeV: 'ExitAngle', 0.19635, 'FringeInt1', 0.750, 'FringeInt2', 0.750, 'FullGap', 0.041);

BBM.PassMethod = 'BndMPoleSymplectic4E2RadPass';
BBM.MaxOrder = 0;
BBM.NumIntSteps = 10;
BBM.PolynomA = [0 0 0 0];
BBM.PolynomB = [0 0 0 0];

% Sectors
sector1a = {dr00a CH dr01 kick1 dr02 Q1 dr03 CV dr04 BPM dr05 Q2 dr06 dr07 MBB BBM MBE ...
            dr07 dr08 BPM dr09 SV dr10 CH dr11 Q3 dr12 SH dr13 CH dr14 BPM dr15 SV dr16 ...
            dr07 MBB BBM MBE dr07 dr17 BPM dr18 Q4 dr19 CV dr20 Q5S1 dr21 CH dr22 };

sector1b = {SSSM dr23 SEPT dr24 kick2 dr02 Q5S1 dr25 CV dr26 BPM dr05 Q4 dr06 dr07 MBB BBM MBE ...
            dr07 dr08 BPM dr09 SV dr10 CH dr11 Q3 dr12 SH dr13 CH dr14 BPM dr15 SV dr16 ...
            dr07 MBB BBM MBE dr07 dr08 BPM dr27 Q2 dr19 CV dr20 Q1 dr28 CH dr39 BPM dr40 };
    
sector2a = {LSSM dr40 BPM dr41 CH dr01 kick3 dr02 Q1 dr25 CV dr26 BPM dr05 Q2 dr06 dr07 MBB BBM MBE ...
            dr07 dr08 BPM dr09 SV dr10 CH dr11 Q3 dr12 SH dr13 CH dr14 BPM dr15 SV dr16 ...
            dr07 MBB BBM MBE dr07 dr08 BPM dr27 Q4 dr19 CV dr20 Q5S2 dr30 CH dr31 RFC dr32 };
            
sector2b = {SSSM dr33 RFC dr34 Q5S2 dr25 CV dr26 BPM dr05 Q4 dr06 dr07 MBB BBM MBE ...
            dr07 dr08 BPM dr09 SV dr10 CH dr11 Q3 dr12 SH dr13 CH dr14 BPM dr15 SV dr16 ...
            dr07 MBB BBM MBE dr07 dr08 BPM dr27 Q2 dr19 CV dr20 Q1 dr28 CH dr29a BPM drins };
            
sector3a = {LSSM drins BPM dr00a CH dr35 Q1 dr25 CV dr26 BPM dr05 Q2 dr06 dr07 MBB BBM MBE ...
            dr07 dr08 BPM dr09 SV dr10 CH dr11 Q3 dr12 SH dr13 CH dr14 BPM dr15 SV dr16 ...
            dr07 MBB BBM MBE dr07 dr08 BPM dr27 Q4 dr19 CV dr20 Q5S3 dr28 CH dr36 };
            
sector3b = {SSSM dr37 Q5S3 dr25 CV dr26 BPM dr05 Q4 dr06 dr07 MBB BBM MBE ...
            dr07 dr08 BPM dr09 SV dr10 CH dr11 Q3 dr12 SH dr13 CH dr14 BPM dr15 SV dr16 ...
            dr07 MBB BBM MBE dr07 dr08 BPM dr27 Q2 dr19 CV dr20 Q1 dr28 CH dr42 BPM dr43 };

sector4a = {LSSM dr44 BPM dr45 CH dr46 Q1 dr25 CV dr26 BPM dr05 Q2 dr06 dr07 MBB BBM MBE ...
            dr07 dr38 SV dr10 CH dr11 Q3 dr12 SH dr13 CH dr14 BPM dr15 SV dr16 ...  
            dr07 MBB BBM MBE dr07 dr08 BPM dr27 Q4 dr19 CV dr20 Q5S4 dr30 CH dr31 RFC dr32};
    
sector4b = {SSSM dr33 RFC dr34 Q5S4 dr25 CV dr26 BPM dr05 Q4 dr06 dr07 MBB BBM MBE ...
            dr07 dr08 BPM dr09 SV dr10 CH dr11 Q3 dr12 SH dr13 CH dr14 BPM dr15 SV dr16 ...
            dr07 MBB BBM MBE dr07 dr08 BPM dr27 Q2 dr19 CV dr20 Q1 dr28 CH dr29a BPM drins LSSM drins BPM};
    

% Construct lattice
RING = [sector1a sector1b sector2a sector2b sector3a sector3b sector4a sector4b];

global THERING;
THERING = RING;

% LOSSFLAG is not global in AT 1.3 (taken from ALS lattice)
evalin('base','clear LOSSFLAG');

end

function quad = quadrupole_local(varargin)

    input = struct(varargin{:});
    quad = atelem('quadrupole', varargin{:});
    
    if ~isfield(input, 'PassMethod')
        quad.PassMethod = 'StrMPoleSymplectic4RadPass';
    end
    if ~isfield(input, 'PolynomA')
        quad.PolynomA = [0 0 0 0];
    end
    if ~isfield(input, 'PolynomB')
        quad.PolynomB = [0 quad.K 0 0];
    end
    if ~isfield(input, 'MaxOrder')
        quad.MaxOrder = 3;
    end
    if ~isfield(input, 'NumIntSteps')
        quad.NumIntSteps = 10;
    end

end

function sext = sextupole_local(s, varargin)

    input = struct(varargin{:});
    sext = atelem('sextupole', varargin{:});
    
    if ~isfield(input, 'PassMethod')
        sext.PassMethod = 'StrMPoleSymplectic4RadPass';
    end
    if ~isfield(input, 'PolynomA')
        sext.PolynomA = [0 0 0 0];
    end
    if ~isfield(input, 'PolynomB')
        sext.PolynomB = [0 0 s 0];
    end
    if ~isfield(input, 'MaxOrder')
        sext.MaxOrder = 3;
    end
    if ~isfield(input, 'NumIntSteps')
        sext.NumIntSteps = 10;
    end

end
