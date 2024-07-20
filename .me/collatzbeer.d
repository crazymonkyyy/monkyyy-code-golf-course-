import basic;
//
// 3n+1 bugs of in the code
//
// print bottles of beer, but instead of simple decrementing its the 3n+1 problem
// and its "bugs in the code", halt at 1
//
// TODO: make better rule set?
//
// example song:
//5s bugs in the code, take one down pass it around
//16s bugs in the code, take one down pass it around
//8s bugs in the code, take one down pass it around
//4s bugs in the code, take one down pass it around
//2s bugs in the code, take one down pass it around
//1s bugs in the code, take one down pass it around
void main(string[] s){
	int i=s[1].to!int;
	while(i!=1){
		i.writeln("s bugs in the code, take one down pass it around");
		i=i%2?3*i+1:i/2;
	}
	i.writeln("s bugs in the code, take one down pass it around");
}
