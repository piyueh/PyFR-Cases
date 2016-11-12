// Gmsh project created on Fri Nov 11 16:21:37 2016

R = 0.5;
R_BL = 2*R;
R_V = 4*R;
L_NW = 20*R;
R_D = 18*R;
L_D = 50*R;

//+
Point(1) = {0, 0, 0, 1.0};

//+
Point(2) = {R, 0, 0, 1.0};
Point(3) = {0, R, 0, 1.0};
Point(4) = {-R, 0, 0, 1.0};
Point(5) = {0, -R, 0, 1.0};

//+
Point(6) = {R_BL, 0, 0, 1.0};
Point(7) = {0, R_BL, 0, 1.0};
Point(8) = {-R_BL, 0, 0, 1.0};
Point(9) = {0, -R_BL, 0, 1.0};

//+
Point(10) = {L_NW, R_V, 0, 1.0};
Point(11) = {0, R_V, 0, 1.0};
Point(12) = {-R_V, 0, 0, 1.0};
Point(13) = {0, -R_V, 0, 1.0};
Point(14) = {L_NW, -R_V, 0, 1.0};

//+
Point(15) = {L_D, R_D, 0, 1.0};
Point(16) = {0, R_D, 0, 1.0};
Point(17) = {-R_D, 0, 0, 1.0};
Point(18) = {0, -R_D, 0, 1.0};
Point(19) = {L_D, -R_D, 0, 1.0};

//+
Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};

//+
Circle(5) = {6, 1, 7};
Circle(6) = {7, 1, 8};
Circle(7) = {8, 1, 9};
Circle(8) = {9, 1, 6};

//+
Line(9) = {10, 11};
Circle(10) = {11, 1, 12};
Circle(11) = {12, 1, 13};
Line(12) = {13, 14};
Line(13) = {14, 10};

//+
Line(14) = {15, 16};
Circle(15) = {16, 1, 17};
Circle(16) = {17, 1, 18};
Line(17) = {18, 19};
Line(18) = {19, 15};

//+
Line(19) = {2, 6};
Line(20) = {3, 7};
Line(21) = {4, 8};
Line(22) = {5, 9};

//+
Line(23) = {7, 11};
Line(24) = {8, 12};
Line(25) = {9, 13};

//+
Line Loop(26) = {-1, 19, 5, -20};
Plane Surface(27) = {26};

//+
Line Loop(28) = {-2, 20, 6, -21};
Plane Surface(29) = {28};

//+
Line Loop(30) = {-3, 21, 7, -22};
Plane Surface(31) = {30};

//+
Line Loop(32) = {-4, 22, 8, -19};
Plane Surface(33) = {32};

//+
Line Loop(34) = {9, -23, -5, -8, 25, 12, 13};
Plane Surface(35) = {34};

//+
Line Loop(36) = {-6, 23, 10, -24};
Plane Surface(37) = {36};

//+
Line Loop(38) = {-7, 24, 11, -25};
Plane Surface(39) = {38};

//+
Line Loop(40) = {14, 15, 16, 17, 18};
Line Loop(41) = {9, 10, 11, 12, 13};
Plane Surface(42) = {40, 41};

//+
Transfinite Line {1, 2, 3, 4, 5, 6, 7, 8} = 51 Using Progression 1; // circumferential
Transfinite Line {19, 20, 21, 22} = 22 Using Progression 1.07; // radial
Transfinite Line {13} = 43 Using Bump 1.07;
Transfinite Line {9, 12} = 80 Using Progression 1;
Transfinite Line {10, 11} = 29 Using Progression 1;
Transfinite Line {23, 24, 25} = 10 Using Progression 1.07;
Transfinite Line {18} = 13 Using Progression 1;
Transfinite Line {14, 17} = 16 Using Progression 1;
Transfinite Line {15, 16} = 12 Using Progression 1;

//+
Transfinite Surface {27, 29, 31, 33};

//+
Recombine Surface {27, 29, 31, 33, 35, 37, 39, 42};

//+
//Extrude {0, 0, Pi} {
//  Surface{27, 29, 31, 33, 35, 37, 39, 42};
//  Layers{10};
//  Recombine;
//}
//+
