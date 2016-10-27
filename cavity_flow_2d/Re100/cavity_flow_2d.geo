// Gmsh project created on Tue Oct 25 17:11:18 2016
Nhl = 26; Rhl = 1.05;
Nhr = 26; Rhr = 0.9523809523809523;
Nvb = 26; Rvb = 1.05;
Nvt = 26; Rvt = 0.9523809523809523;

// corners
Point(1) = {-0.5, -0.5, 0, 1.0};
Point(2) = {0.0, -0.5, 0, 1.0};
Point(3) = {0.5, -0.5, 0, 1.0};
Point(4) = {0.5, 0.0, 0, 1.0};
Point(5) = {0.5, 0.5, 0, 1.0};
Point(6) = {0.0, 0.5, 0, 1.0};
Point(7) = {-0.5, 0.5, 0, 1.0};
Point(8) = {-0.5, 0.0, 0, 1.0};
Point(9) = {0.0, 0.0, 0, 1.0};

// boundaries
Line(1) = {1, 2}; // bottom left
Line(2) = {2, 3}; // bottom right
Line(3) = {8, 9}; // middle horizintal left
Line(4) = {9, 4}; // middle horizintal right
Line(5) = {7, 6}; // top left
Line(6) = {6, 5}; // top right
Line(7) = {1, 8}; // left bottom
Line(8) = {8, 7}; // left top
Line(9) = {2, 9}; // middle vertical bottom
Line(10) = {9, 6}; // middle vertical top
Line(11) = {3, 4}; // right bottom
Line(12) = {4, 5}; // right top

// doamin (2D surface)
Line Loop(13) = {-3, -7, 1, 9}; // bottom left
Plane Surface(14) = {13}; // bottom left
Line Loop(15) = {-9, 2, 11, -4}; // bottom right
Plane Surface(16) = {15}; // bottom right
Line Loop(17) = {4, 12, -6, -10}; // upper right
Plane Surface(18) = {17}; // upper right
Line Loop(19) = {10, -5, -8, 3}; // upper left
Plane Surface(20) = {19}; // upper left

// number of elements on edges
Transfinite Line {1} = Nhl Using Progression Rhl; // bottom left
Transfinite Line {2} = Nhr Using Progression Rhr; // bottom right
Transfinite Line {3} = Nhl Using Progression Rhl; // middle horizontal left
Transfinite Line {4} = Nhr Using Progression Rhr; // middle horizontal right
Transfinite Line {5} = Nhl Using Progression Rhl; // top left
Transfinite Line {6} = Nhr Using Progression Rhr; // top right
Transfinite Line {7} = Nvb Using Progression Rvb; // left bottom
Transfinite Line {8} = Nvt Using Progression Rvt; // left top
Transfinite Line {9} = Nvb Using Progression Rvb; // middle vertical bottom
Transfinite Line {10} = Nvt Using Progression Rvt; // middle vertical top
Transfinite Line {11} = Nvb Using Progression Rvb; // right bottom
Transfinite Line {12} = Nvt Using Progression Rvt; // right top

// elements on surfaces
Transfinite Surface {14}; // bottom left
Transfinite Surface {16}; // bottom right
Transfinite Surface {18}; // upper right
Transfinite Surface {20}; // upper left
Recombine Surface {14, 16, 18, 20};

// bcs
Physical Line("wallbottom") = {1, 2};
Physical Line("lid") = {5, 6};
Physical Line("wallright") = {11, 12};
Physical Line("wallleft") = {7, 8};

// material
Physical Surface("fluid") = {14, 16, 18, 20};
