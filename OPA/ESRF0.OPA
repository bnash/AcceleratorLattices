{----- C:\OPA\ESRF\ESRF0.OPA ----- Th 9.9.1999 14:11 ------------------------}

{----- Global parameters (units: GeV, m, rad) -------------------------------}

Energy =   6.000000; NPeriod = 16;
Meth   = 0; Nbend = 1; Nquad = 1;

    BetaX   =   21.0403152; AlphaX  =    0.0000000;
    EtaX    =    0.0022789; EtaXP   =    0.0000000;
    BetaY   =   12.4335453; AlphaY  =   -0.0000000;
    EtaY    =    0.0000000; EtaYP   =    0.0000000;
    OrbitX  = 0.0000000000; OrbitXP = 0.0000000000;
    OrbitY  = 0.0000000000; OrbitYP = 0.0000000000;
    OrbitDPP= 0.0000000000;

{----- Table of elements (units: m, m^-2, deg, T; mm, mrad) ---------------- }
{      Conventions: Quadrupole: k>0 horizontally focusing                    }
{                   Sextupole : k=m*l, m:=Bpoletip/r^2/(B*rho)               }

D1       : Drift, L = 0.198100, Nslice =  1, Ax = 50.00, Ay = 50.00;
D2       : Drift, L = 0.175000, Nslice =  1, Ax = 50.00, Ay = 50.00;
D3       : Drift, L = 0.200000, Nslice =  1, Ax = 50.00, Ay = 50.00;
D4       : Drift, L = 0.178708, Nslice =  1, Ax = 50.00, Ay = 50.00;
D5       : Drift, L = 0.178625, Nslice =  1, Ax = 50.00, Ay = 50.00;
D6       : Drift, L = 0.143333, Nslice =  1, Ax = 50.00, Ay = 50.00;
D7       : Drift, L = 0.166667, Nslice =  1, Ax = 50.00, Ay = 50.00;
DDB      : Drift, L = 0.000000, Nslice =  1, Ax = 50.00, Ay = 50.00;
MARK     : Marker, Ax = 50.00, Ay = 50.00;
QD1      : Quadrupole, L = 0.200000, K = -0.319699,  Ax = 50.00, Ay = 50.00;
QD2      : Quadrupole, L = 0.166667, K = -0.529670,  Ax = 50.00, Ay = 50.00;
QD3      : Quadrupole, L = 0.200000, K = -0.693040,  Ax = 50.00, Ay = 50.00;
QD4      : Quadrupole, L = 0.166667, K = -0.770779,  Ax = 50.00, Ay = 50.00;
QD5      : Quadrupole, L = 0.200000, K = -0.547108,  Ax = 50.00, Ay = 50.00;
QF1      : Quadrupole, L = 0.180000, K =  0.522749,  Ax = 50.00, Ay = 50.00;
QF2      : Quadrupole, L = 0.166667, K =  0.759003,  Ax = 50.00, Ay = 50.00;
QF3      : Quadrupole, L = 0.180000, K =  0.810015,  Ax = 50.00, Ay = 50.00;
B1       : Bending, L = 2.157280, T =  5.28978, K =  0.000000,
           T1 =  0.04909, T2 =  0.04324, Gap =  0.00,
           K1 = 0.0000, K2 = 0.0000, Ax = 50.00, Ay = 50.00;
B1_1     : Bending, L = 2.157280, T =  5.28978, K =  0.000000,
           T1 =  0.04324, T2 =  0.04909, Gap =  0.00,
           K1 = 0.0000, K2 = 0.0000, Ax = 50.00, Ay = 50.00;
B2       : Bending, L = 0.292710, T =  0.33518, K =  0.000000,
           T1 = -0.04324, T2 =  0.04909, Gap =  0.00,
           K1 = 0.0000, K2 = 0.0000, Ax = 50.00, Ay = 50.00;
B2_1     : Bending, L = 0.292710, T =  0.33518, K =  0.000000,
           T1 =  0.04909, T2 = -0.04324, Gap =  0.00,
           K1 = 0.0000, K2 = 0.0000, Ax = 50.00, Ay = 50.00;
S1       : Sextupole, K =  0.000000, Ax = 50.00, Ay = 50.00;
S2       : Sextupole, K =  0.000000, Ax = 50.00, Ay = 50.00;
S3       : Sextupole, K =  0.000000, Ax = 50.00, Ay = 50.00;
S4       : Sextupole, K =  0.000000, Ax = 50.00, Ay = 50.00;
SD       : Sextupole, K =  0.000000, Ax = 50.00, Ay = 50.00;
SF       : Sextupole, K =  0.000000, Ax = 50.00, Ay = 50.00;

{----- Table of segments ----------------------------------------------------}

LINE      :MARK, 16*D1, 2*QD1, 2*D2, S1, 2*D2, 5*QF1, 2*D3, S2, 2*D3, 
           3*QD2, 6*D4, B1, DDB, B2, 6*D5, 2*QD3, 2*D2, SD, 3*D6, 
           3*QF2, 3*D7, SF, 3*D7, 3*QF2, 3*D6, SD, 2*D2, 2*QD3, 
           6*D5, B2_1, DDB, B1_1, 6*D4, 3*QD4, 2*D2, S3, 2*D3, 5*QF3, 
           2*D2, S4, 2*D2, 2*QD5, 16*D1, 16*D1, 2*QD5, 2*D2, S4, 2*D2, 
           5*QF3, 2*D3, S3, 2*D2, 3*QD4, 6*D4, B1, DDB, B2, 6*D5, 
           2*QD3, 2*D2, SD, 3*D6, 3*QF2, 3*D7, SF, 3*D7, 3*QF2, 
           3*D6, SD, 2*D2, 2*QD3, 6*D5, B2_1, DDB, B1_1, 6*D4, 3*QD2, 
           2*D3, S2, 2*D3, 5*QF1, 2*D2, S1, 2*D2, 2*QD1, 16*D1, MARK;
           

{----- C:\OPA\ESRF\ESRF0.OPA ----- Th 9.9.1999 14:11 ------------------------}
