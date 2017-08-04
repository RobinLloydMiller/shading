/*...................................................................................................
Author: Diego Inácio
Shader: iridescence 01
Version: 1.0.0
Dev.: OpenGL Shading Language
Date Upadated: JAN/09/2014
www.diegoinacio.com
.....................................................................................................
Fragment part of a simple iridescent shader using OpenGL Shading Language.

If you have any comment, sent it to me at: diegodci@gmail.com
Thank you! :D
.....................................................................................................
References:

ROST et al. OpenGL Shading Language, 3rd edition.

BAILEY; CUNNINGHAM. Graphics Shaders: Theory and Practice, 2nd Edition.

EBERT et al. Texturing and Modeling: A Procedural Approach, 3rd edition.
.....................................................................................................
Resources:

<OpenGL>
http://www.opengl.org/
...................................................................................................*/

varying vec3 P;
varying float fr;

float setRange(float value, float oMin, float oMax, float iMin, float iMax){
	return iMin + ((value - oMin)/(oMax - oMin)) * (iMax - iMin);
}

float diNoise(vec3 pos){
	//noise function to create irregularity
	float mult = 1;
	float oset = 45;		//offset
	return	sin(pos.x*mult*2 + 12 + oset) + cos(pos.z*mult + 21 + oset) *
			sin(pos.y*mult*2 + 23 + oset) + cos(pos.y*mult + 32 + oset) *
			sin(pos.z*mult*2 + 34 + oset) + cos(pos.x*mult + 43 + oset);
}

vec3 iridescence(float orient){
	//this function returns a iridescence value based on orientation
	vec3 irid;
	float freq = 10;
	float oset = 25;		//offset
	float noiseMult = 1;
	irid.x = abs(cos(orient*freq + diNoise(P)*noiseMult + 1 + oset));
	irid.y = abs(cos(orient*freq + diNoise(P)*noiseMult + 2 + oset));
	irid.z = abs(cos(orient*freq + diNoise(P)*noiseMult + 3 + oset));
	return irid;
}

void main(){
	float Ki = 1.0;			//iridescence multiplicator
	vec4 iridColor = vec4(iridescence(fr), 1.0) * setRange(pow(1 - fr, 1/0.75), 0, 1, 0.1, 1);
	gl_FragColor = iridColor*Ki;
}