/*
fizzbuzz + foo at 2 bar at 7
intentionaly verbose version
*/
import std;
int x(bool[] b...){
	int o;
	int a=1;
	foreach(b_;b){
		o+=a*b_;
		a*=2;
	}
	return o;
}
void main(string[] s){
	int i=s[1].to!int;
	switch(x(i%2==0,i%3==0,i%5==0,i%7==0)){
		case x(1,1,1,1):writeln("NAHHHHHH");break;
		case x(1,1,1,0):writeln("NAHHHHHH");break;
		case x(1,1,0,1):writeln("NAHHHHHH");break;
		case x(1,1,0,0):writeln("NAHHHHHH");break;
		case x(1,0,1,1):writeln("NAHHHHHH");break;
		case x(1,0,1,0):writeln("NAHHHHHH");break;
		case x(1,0,0,1):writeln("NAHHHHHH");break;
		case x(1,0,0,0):writeln("NAHHHHHH");break;
		case x(0,1,1,1):writeln("NAHHHHHH");break;
		case x(0,1,1,0):writeln("NAHHHHHH");break;
		case x(0,1,0,1):writeln("NAHHHHHH");break;
		case x(0,1,0,0):writeln("NAHHHHHH");break;
		case x(0,0,1,1):writeln("NAHHHHHH");break;
		case x(0,0,1,0):writeln("NAHHHHHH");break;
		case x(0,0,0,1):writeln("NAHHHHHH");break;
		case x(0,0,0,0):writeln(i);break;
		default:break;
	}
}
