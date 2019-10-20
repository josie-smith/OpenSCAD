// points = number of points (minimum 3)
// outer  = radius to outer points
// inner  = radius to inner points
module Star(points=5, outer=20, inner=10, height=5, 3d=false) {
	
	// polar to cartesian: radius/angle to x/y
	function x(r, a) = r * cos(a);
	function y(r, a) = r * sin(a);
	
	// angular width of each pie slice of the star
	increment = 360/points;
	
	// outer is outer point p
	// inner is inner point following p
	// next is next outer point following p
    module point() {
        if (3d==false) {
            assign(	x_outer = x(outer, 0),
                y_outer = y(outer, 0),
                x_inner = x(inner, increment/2),
                y_inner = y(inner, increment/2),
                x_next  = x(outer, increment),
                y_next  = y(outer, increment)) {
                    polygon(points = [[x_outer, y_outer], [x_inner, y_inner], [x_next, y_next], [0, 0]], paths  = [[0, 1, 2, 3]]);};
        } else {
            assign(	x_outer = x(outer, 0),
                y_outer = y(outer, 0),
                x_inner = x(inner, increment/2),
                y_inner = y(inner, increment/2),
                x_next  = x(outer, increment),
                y_next  = y(outer, increment)) {
                    linear_extrude(height=height, scale=0)
                        polygon(points = [[x_outer, y_outer], [x_inner, y_inner], [x_next, y_next], [0, 0]], paths  = [[0, 1, 2, 3]]);
                    mirror([0,0,1])
                        linear_extrude(height=height, scale=0)
                            polygon(points = [[x_outer, y_outer], [x_inner, y_inner], [x_next, y_next], [0, 0]], paths  = [[0, 1, 2, 3]]);
            };
        };
    };
	
    for (p=[0:points-1]) {
        rotate(increment*p)
            point();
    };
};

color("green")
    linear_extrude(height=40, scale=0, twist=270)
        Star(7,10,20);

color("gold")
    translate([0,0,40])
        rotate([0,90,0])
            Star(5,2,4,1, 3d=true);