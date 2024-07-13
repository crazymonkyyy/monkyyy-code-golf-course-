import std;
string[] s=["foo","bar","fizz","buzz","hello world"];
void main(){
	foreach(i;0..10001){
		s[uniform(0,$)].write;
		",".write;
		(uniform(-100000,100000).to!float/uniform(1,100)).writeln;
}}