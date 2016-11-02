// Gmsh project created on Tue Nov  1 17:56:26 2016

//+
rC = DefineNumber[ 0.5, Name "Parameters/rC" ];

//+
Point(1) = {0, 0, 0, 1.0};
Point(2) = {-rC/(2^0.5), -rC/(2^0.5), 0, 1.0};
Point(3) = {rC/(2^0.5), -rC/(2^0.5), 0, 1.0};
Point(4) = {rC/(2^0.5), rC/(2^0.5), 0, 1.0};
Point(5) = {-rC/(2^0.5), rC/(2^0.5), 0, 1.0};

//+
Point(6) = {-16.0, -16.0, 0, 1.0};
Point(7) = {16.0, -16.0, 0, 1.0};
Point(8) = {16.0, 16.0, 0, 1.0};
Point(9) = {-16.0, 16.0, 0, 1.0};

//+
Point(10) = {32.0, -16.0, 0, 1.0};
Point(11) = {32.0, 16.0, 0, 1.0};

//+
Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};

//+
Line(5) = {6, 7};
Line(6) = {7, 8};
Line(7) = {8, 9};
Line(8) = {9, 6};

//+
Line(9) = {2, 6};
Line(10) = {3, 7};
Line(11) = {4, 8};
Line(12) = {5, 9};

//+
Line(13) = {7, 10};
Line(14) = {10, 11};
Line(15) = {11, 8};

//+
Line Loop(13) = {-1, 9, 5, -10};
Plane Surface(14) = {13};
Line Loop(15) = {-2, 10, 6, -11};
Plane Surface(16) = {15};
Line Loop(17) = {-3, 11, 7, -12};
Plane Surface(18) = {17};
Line Loop(19) = {-4, 12, 8, -9};
Plane Surface(20) = {19};
Line Loop(21) = {13, 14, 15, -6};
Plane Surface(22) = {21};

//+
Transfinite Line {1, 2, 3, 4, 5, 6, 7, 8, 14} = 8 Using Progression 1.0;
Transfinite Line {9, 10, 11, 12} = 40 Using Progression 1.1;
Transfinite Line {13} = 7 Using Progression 1.1;
Transfinite Line {15} = 7 Using Progression 1./1.1;
Transfinite Surface {14, 16, 18, 20, 22};

//+
Recombine Surface {14, 16, 18, 20, 22};

//+
Physical Line("inlet") = {8};
Physical Line("outlet") = {14};
Physical Line("topandbottom") = {7, 15, 5, 13};
Physical Line("noslip") = {1, 2, 3, 4};
Physical Surface("fluid") = {14, 16, 18, 20, 22};
