// Gmsh project created on Sun Oct 30 18:53:40 2016

rc = 0.5;
rbc = rc * 1.5;
rvis = rc * 3;
hvis = rvis/(2^0.5);
Ll = 10.0;
Lr = 30.0;

Nth = 20; Rth = 1.0;
Nbl = 10; Rbl = 1.05;
Nvis = 25; Rvis = 1.0;

//+
Point(1) = {0, 0, 0, 1.0};
Point(2) = {rc, 0, 0, 1.0};
Point(3) = {rc/(2^0.5), rc/(2^0.5), 0, 1.0};
Point(4) = {0, rc, 0, 1.0};
Point(5) = {-rc, 0, 0, 1.0};
Point(6) = {0, -rc, 0, 1.0};
Point(7) = {rc/(2^0.5), -rc/(2^0.5), 0, 1.0};

//+
Point(8) = {rbc, 0, 0, 1.0};
Point(9) = {rbc/(2^0.5), rbc/(2^0.5), 0, 1.0};
Point(10) = {0, rbc, 0, 1.0};
Point(11) = {-rbc, 0, 0, 1.0};
Point(12) = {0, -rbc, 0, 1.0};
Point(13) = {rbc/(2^0.5), -rbc/(2^0.5), 0, 1.0};

//+
Point(14) = {rvis, 0, 0, 1.0};
Point(15) = {rvis/(2^0.5), rvis/(2^0.5), 0, 1.0};
Point(16) = {0, rvis, 0, 1.0};
Point(17) = {-rvis, 0, 0, 1.0};
Point(18) = {0, -rvis, 0, 1.0};
Point(19) = {rvis/(2^0.5), -rvis/(2^0.5), 0, 1.0};

//+
Point(20) = {Lr, 0, 0, 1.0};
Point(21) = {Lr, hvis, 0, 1.0};
Point(22) = {Lr, -hvis, 0, 1.0};

//+
Point(23) = {Lr, Ll, 0, 1.0};
Point(24) = {-Ll, Ll, 0, 1.0};
Point(25) = {-Ll, -Ll, 0, 1.0};
Point(26) = {Lr, -Ll, 0, 1.0};

//+
Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 6};
Circle(5) = {6, 1, 7};
Circle(6) = {7, 1, 2};

//+
Circle(1+6) = {2+6, 1, 3+6};
Circle(2+6) = {3+6, 1, 4+6};
Circle(3+6) = {4+6, 1, 5+6};
Circle(4+6) = {5+6, 1, 6+6};
Circle(5+6) = {6+6, 1, 7+6};
Circle(6+6) = {7+6, 1, 2+6};

//+
Circle(1+12) = {2+12, 1, 3+12};
Circle(2+12) = {3+12, 1, 4+12};
Circle(3+12) = {4+12, 1, 5+12};
Circle(4+12) = {5+12, 1, 6+12};
Circle(5+12) = {6+12, 1, 7+12};
Circle(6+12) = {7+12, 1, 2+12};

//+
Line(1+18) = {2, 2+6};
Line(2+18) = {3, 3+6};
Line(3+18) = {4, 4+6};
Line(4+18) = {5, 5+6};
Line(5+18) = {6, 6+6};
Line(6+18) = {7, 7+6};

//+
Line(1+24) = {2+6, 2+12};
Line(2+24) = {3+6, 3+12};
Line(3+24) = {4+6, 4+12};
Line(4+24) = {5+6, 5+12};
Line(5+24) = {6+6, 6+12};
Line(6+24) = {7+6, 7+12};

//+
Line(31) = {19, 22};
Line(32) = {14, 20};
Line(33) = {15, 21};
Line(34) = {22, 20};
Line(35) = {20, 21};

//+
Line(59) = {21, 23};
Line(60) = {22, 26};
Line(61) = {25, 24};
Line(62) = {24, 23};
Line(63) = {25, 26};

//+
Line Loop(31) = {-1, 19, 7, -20};
Plane Surface(32) = {31};
Line Loop(33) = {-2, 20, 8, -21};
Plane Surface(34) = {33};
Line Loop(35) = {-3, 21, 9, -22};
Plane Surface(36) = {35};
Line Loop(37) = {-4, 22, 10, -23};
Plane Surface(38) = {37};
Line Loop(39) = {-5, 23, 11, -24};
Plane Surface(40) = {39};
Line Loop(41) = {-6, 24, 12, -19};
Plane Surface(42) = {41};

//+
Line Loop(43) = {-7, 25, 13, -26};
Plane Surface(44) = {43};
Line Loop(45) = {-8, 26, 14, -27};
Plane Surface(46) = {45};
Line Loop(47) = {-9, 27, 15, -28};
Plane Surface(48) = {47};
Line Loop(49) = {-10, 28, 16, -29};
Plane Surface(50) = {49};
Line Loop(51) = {-11, 29, 17, -30};
Plane Surface(52) = {51};
Line Loop(53) = {-12, 30, 18, -25};
Plane Surface(54) = {53};

//+
Line Loop(55) = {35, -33, -13, 32};
Plane Surface(56) = {55};
Line Loop(57) = {31, 34, -32, -18};
Plane Surface(58) = {57};

//+
Line Loop(64) = {59, -62, -61, 63, -60, -31, -17, -16, -15, -14, 33};
Plane Surface(65) = {64};

//+
Physical Line("noslip") = {1, 2, 3, 4, 5, 6};
Physical Line("inlet") = {61};
Physical Line("outlet") = {60, 34, 35, 59};
Physical Line("topandbottom") = {62, 63};
Physical Surface("fluid") = {65, 56, 58, 44, 46, 48, 50, 52, 54, 40, 42, 32, 34, 36, 38};

//+
Transfinite Line {1, 2, 5, 6, 7, 8, 11, 12, 13, 14, 17, 18} = Nth Using Progression Rth;
Transfinite Line {3, 4, 9, 10, 15, 16} = 2*Nth Using Progression Rth;
Transfinite Line {19, 20, 21, 22, 23, 24} = Nbl Using Progression Rbl;
Transfinite Line {25, 26, 27, 28, 29, 30} = Nvis Using Progression Rvis;
Transfinite Line {31, 32, 33} = 410 Using Progression 1.0;
Transfinite Line {34, 35} = Nth Using Progression Rth;
Transfinite Line {62, 63} = 40 Using Progression 1;
Transfinite Line {61} = 20 Using Progression 1;
Transfinite Line {59} = 18 Using Progression 1.08;
Transfinite Line {60} = 18 Using Progression 1.08;

//+
Recombine Surface {32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 65};

//+
Transfinite Surface {32, 34, 36, 38, 40, 42, 44, 46, 48, 50 ,52, 54};
