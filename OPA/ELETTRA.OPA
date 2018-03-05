{----- C:\OPA\ELETTRA\ELETTRA.OPA ----- Tu 14.9.1999 10:47 ------------------}

{----- Global parameters (units: GeV, m, rad) -------------------------------}

Title = ELETTRA (SYNC DATA BOOKLET 4);

Energy =   2.000000; NPeriod = 12;
Meth   = 0; Nbend = 1; Nquad = 1;

    BetaX   =    7.7511253; AlphaX  =    0.0000000;
    EtaX    =    0.0011360; EtaXP   =    0.0000000;
    BetaY   =    2.6665456; AlphaY  =    0.0000000;
    EtaY    =    0.0000000; EtaYP   =    0.0000000;
    OrbitX  = 0.0000000000; OrbitXP = 0.0000000000;
    OrbitY  = 0.0000000000; OrbitYP = 0.0000000000;
    OrbitDPP= 0.0000000000;

{----- Table of elements (units: m, m^-2, deg, T; mm, mrad) ---------------- }
{      Conventions: Quadrupole: k>0 horizontally focusing                    }
{                   Sextupole : k=m*l, m:=Bpoletip/r^2/(B*rho)               }

AAA      : Drift, L = 0.000000, Nslice =  1, Ax = 50.00, Ay = 50.00;
D1       : Drift, L = 3.116000, Nslice =  1, Ax = 100.00, Ay = 100.00;
D2       : Drift, L = 0.281000, Nslice =  1, Ax = 100.00, Ay = 100.00;
D3       : Drift, L = 0.340000, Nslice =  1, Ax = 100.00, Ay = 100.00;
D4       : Drift, L = 0.251000, Nslice =  1, Ax = 100.00, Ay = 100.00;
D5       : Drift, L = 0.507000, Nslice =  1, Ax = 100.00, Ay = 100.00;
D6       : Drift, L = 0.472500, Nslice =  1, Ax = 100.00, Ay = 100.00;
D7       : Drift, L = 0.375500, Nslice =  1, Ax = 100.00, Ay = 100.00;
D8       : Drift, L = 2.074000, Nslice =  1, Ax = 100.00, Ay = 100.00;
D9       : Drift, L = 0.370000, Nslice =  1, Ax = 100.00, Ay = 100.00;
CM       : Marker, Ax = 50.00, Ay = 50.00;
Q1       : Quadrupole, L = 0.260000, K = -1.952436,  Ax = 100.00, Ay = 100.00;
Q2       : Quadrupole, L = 0.498000, K =  2.235991,  Ax = 100.00, Ay = 100.00;
Q3       : Quadrupole, L = 0.260000, K = -1.277189,  Ax = 100.00, Ay = 100.00;
Q4       : Quadrupole, L = 0.409000, K =  2.227470,  Ax = 100.00, Ay = 100.00;
Q5       : Quadrupole, L = 0.130000, K = -1.400000,  Ax = 100.00, Ay = 100.00;
B38      : Bending, L = 0.546000, T =  5.62500, K = -0.430400,
           T1 =  0.00000, T2 =  7.50000, Gap =  0.00,
           K1 = 0.0000, K2 = 0.0000, Ax = 50.00, Ay = 50.00;
B58      : Bending, L = 0.910000, T =  9.37500, K = -0.430400,
           T1 =  0.00000, T2 =  7.50000, Gap =  0.00,
           K1 = 0.0000, K2 = 0.0000, Ax = 50.00, Ay = 50.00;
BDH      : Bending, L = 0.728000, T =  7.50000, K = -0.430418,
           T1 =  7.50000, T2 =  0.00000, Gap =  0.00,
           K1 = 0.0000, K2 = 0.0000, Ax = 100.00, Ay = 100.00;
S1       : Sextupole, K =  1.100000, Ax = 100.00, Ay = 100.00;
SD       : Sextupole, K = -3.611657, Ax = 100.00, Ay = 100.00;
SF       : Sextupole, K =  4.203128, Ax = 100.00, Ay = 100.00;
XD       : PhotonBeam,  XL =     50.00, Style = 1, Ax = 50.00, Ay = 50.00;
XU       : PhotonBeam,  XL =     50.00, Style = 0, Ax = 50.00, Ay = 50.00;

{----- Table of segments ----------------------------------------------------}

HSUP      :XU, D1, Q1, D2, S1, D3, Q2, D4, Q3, D5, B38, AAA, XD, B58, D6, 
           Q4, D7, SF, D8, SD, D9, Q5;
FSUP      :HSUP, CM, -HSUP;
RING      :12*FSUP;

{----- C:\OPA\ELETTRA\ELETTRA.OPA ----- Tu 14.9.1999 10:47 ------------------}
