#include "colors.inc"
#include "textures.inc"

camera {ultra_wide_angle angle  60
		    location  < 7.0 , 7.0 ,-10.0> 
        look_at   < 0.5 , 0.0 ,  -3.0>}

light_source{<1800,2500,-2500> color White}

#declare Orange_Yellow = color rgb<1,0.77,0>;

sphere
{   <0,0,0>,1 hollow
    texture 
    {   pigment
        {   gradient <0,1,0>
            color_map{[0.0 color Orange_Yellow]
                      [0.5 color White]
                      [1.0 color Orange_Yellow]
                     }
            quick_color White
            scale 2 translate<0,-1,0> 
        }
        finish {ambient 1 diffuse 0}
    }
    scale 10000
}

// Loping, Seno, Coseno e o POV-Ray
#declare Ball = 
  sphere
  {   <0,0,0>,0.25 
      texture
      {   pigment{color rgb<1,0.7,0>}
          finish {ambient 0.1 diffuse 0.9 phong 1}
      }		// end of texture
  }		// end of sphere

#declare Z    =  -5;  	// start value Z
#declare EndZ =   5;  	// end value Z
#declare Step = 0.25;	// step value

#while ( Z < EndZ + Step)    	// loop start Z
   #declare X = -5;	// start value X
   #declare EndX = 5;	// end value X
   #while ( X < EndX + Step) 	// loop start X
      #declare R = sqrt(X*X + Z*Z); 
      object { Ball translate < X, sin(clock*R*0.05), Z> } 
      #declare X = X + Step; 	// next X  value 
   #end                      	// loop end X
   #declare Z = Z + Step;    	// next Z value 
#end 

 




