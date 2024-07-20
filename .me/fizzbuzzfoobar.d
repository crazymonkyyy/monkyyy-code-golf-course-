import basic;
//Print the numbers from 0 to 100 inclusive, each on their own line.
//
//If, however, the number is a multiple of two then print Foo instead,
//if the number is a multiple of three then print Fizz,
//if the number is a multiple of five then print Buzz,
//and if the number is a multiple of seven then print Bar.
//
//https://code.golf/foo-fizz-buzz-bar
auto foobar(tuple!(int,string) pair,int when,string append){
	if(pair[0]%when==0){
		pair[1]~=append;
	}
	return pair;
}
string barfoo(tuple!(int,string) a){
	if(a[1].length==0){
		return a[0].to!string;
	}
	return a[1];
}
void main(){
	foreach(e;
			counter(100).map!(a=>
			foobar(pair(a,""),2,"foo")
			.foobar(3,"fizz")
			.foobar(5,"buzz")
			.foobar(7,"bar")
			.barfoo)){
		e.writeln;
	}
}
