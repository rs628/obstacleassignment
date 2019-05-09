a = 10;
b = 5;

// base corner points
Point(1) = {0,0,0};
Point(2) = {a,0,0};
Point(3) = {a,b,0};
Point(4) = {0,b,0};
Point(5) = {3,2,0};
Point(6) = {4,2,0};
Point(7) = {3,3,0};
Point(8) = {2,2,0};
Point(9) = {3,1,0};

// base lines
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

//circle arc for obstacle
Circle(5) = {9, 5, 6};
Circle(6) = {6, 5, 7};
Circle(7) = {7, 5, 8};
Circle(8) = {8, 5, 9};

//To add surface

Curve Loop(1) = {3, 4, 1, 2};
//+
Curve Loop(2) = {7, 8, 5, 6};
//+
Plane Surface(1) = {1, 2};
//+
//Plane Surface(2) = {2};
// extra work for creating structured mesh




// extrude base surface in z direction for create 
// dummy 3d geometry for OpenFoam
Extrude {0, 0, 0.5} {
   Surface{1}; Layers{1}; Recombine;
}



//+
Physical Surface("inlet") = {25};
//+

//+
Physical Surface("upperWall") = {21};

//+
Physical Surface("outlet") = {33};
//+
Physical Surface("lowerWAll") = {29};
//+
Physical Surface(5) = {50, 1};
//+
Physical Surface("frontAndBack") = {49};
//+
Physical Surface("patch1") = {37};
//+
Physical Surface("patch2") = {41};
//+
Physical Surface("patch3") = {45};
//+
Physical Surface("patch4") = {49};
//+
Physical Volume("body") = {1};
//+

