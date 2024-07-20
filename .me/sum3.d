import basic;
//3 sum
//given a list of intergers find 3 that add to n
//
//TODO: make this have unit tests by defualt, refactor

void main(string[] s){
	int n=s[1].to!int;
	int[] a=s[2..$].map!(to!int).array;
	foreach(i;0..a.length){
	foreach(j;i+1..a.length){
	foreach(k;j+1..a.length){
		if(a[i]+a[j]+a[k]==n){
			writeln(a[i]," ",a[j]," ",a[k]);
			return;
		}
	}}}
}
