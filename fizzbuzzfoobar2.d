import std;
alias seq(T...)=T;
struct tuple(T...){
		T _; alias _ this;}
auto pair(T,S)(T t,S s){
	return tuple!(T,S)(seq!(t,s));
}
unittest{
	auto foo=pair("hi",13.37);
	foo[0].writeln;
}
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
	iota(100).map!(a=>
		foobar(pair(a,""),2,"foo")
		.foobar(3,"fizz")
		.foobar(5,"buzz")
		.foobar(7,"bar")
		.barfoo)
	.each!writeln;
}
