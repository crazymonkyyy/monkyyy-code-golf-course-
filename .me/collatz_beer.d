/*
3n+1 bugs of in the code
*/
import std;
void main(string[] s){
	int i=s[1].to!int;
	while(i!=1){
		i.writeln("s bugs in the code, take one down pass it around");
		i=i%2?3*i+1:i/2;
	}
	i.writeln("s bugs in the code, take one down pass it around");
}
