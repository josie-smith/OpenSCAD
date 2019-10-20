size = 273;	//side length
level = 4;	//menger level

intersection(){
	rotate([0,0,0])translate([-size/2,-size/2,-size/2])singleSide();
	rotate([0,90,0])translate([-size/2,-size/2,-size/2])singleSide();
	rotate([0,0,90])translate([-size/2,-size/2,-size/2])singleSide();
}

module singleSide(){
	difference(){
		cube(size);
		for(i=[1:level]){
			for(j=[0:pow(3,i)-1]){
				for(k=[0:pow(3,i)]){
					translate([-size/2,j*size/pow(3,i),k*size/pow(3,i)]){
						//echo(round((j+2)/3)==(j+2)/3);
						//echo((j+2)/3);
						if(round((j+2)/3)==(j+2)/3){				
							if(round((k+2)/3)==(k+2)/3){
								cube([2*size,size/pow(3,i),size/pow(3,i)]);
							}
						}
					}
				}
			}
		}
	}
}