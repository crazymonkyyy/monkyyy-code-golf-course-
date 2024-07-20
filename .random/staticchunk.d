/* template staticChunk(F,int I=2){
    template staticChunk(Args...) if (Args.length > 0){
        alias staticChunk = (staticChunk!(F!(Args[0 .. I], I)))!(Args[I .. $]);
    }
    template staticChunk(){
        alias staticChunk=F;
    }
} */
alias Seq(T...)=T;
template zip(A...) if(A.length==0){
template zip2(B...){
	alias zip2=Seq!();
}}
template zip(A...) if(A.length>0){
template zip2(B...){
	alias zip2=Seq!(A[0],B[0],zip!(A[1..$]).zip2!(B[1..$]));
}}
unittest{
	import std;
	alias foo=Seq!(zip!(int,float,bool).zip2!(1,2,3));
	foo.stringof.writeln;
}
/* template staticChunk(F,int I=2){
	auto staticChunk(Args...)(Args args){
		static if(Args.length==I){
			return F(args);
		} else {
			return staticChunk(args[I..$],F(args[0..I]) */
auto curryrecurse(alias F,int I=2,Args...)(Args args){
	static if(Args.length>I){
		static if(is(typeof(F(args[0..I]))==void)){
			F(args[0..I]);
			curryrecurse!(F,I)(args[I..$]);
		} else {
			return curryrecurse!(F,I)(F(args[0..I]),args[I..$]);
	}} else {
		return F(args);
}}
unittest{
	struct pair(T,S){
		T a;
		S b;
	}
	pair!(int,string)[] store;
	void add(int i,string s){
		store~=pair!(int,string)(i,s);
	}
	curryrecurse!add(2,"foo",3,"fizz",5,"buzz",7,"bar");
	import std;
	store.writeln;
}
unittest{
	int n=42;
	string fizzbuzz(string acc,int i,string app){
		if(n%i==0)acc~=app;
		return acc;
	}
	import std;
	curryrecurse!(fizzbuzz,3)("",2,"foo",3,"fizz",5,"buzz",7,"bar").writeln;
}
auto curryrecurse(alias F,int I=2,Args...)(Args args){
	static if(Args.length>I){
		static if(is(typeof(F(args[0..I]))==void)){
			F(args[0..I]);
			curryrecurse!(F,I)(args[I..$]);
		} else {
			return curryrecurse!(F,I)(F(args[0..I]),args[I..$]);
	}} else {
		return F(args);
}}
unittest{
	struct pair(T,S){
		T a;
		S b;
	}
	pair!(int,string)[] store;
	void add(int i,string s){
		store~=pair!(int,string)(i,s);
	}
	curryrecurse!add(2,"foo",3,"fizz",5,"buzz",7,"bar");
	import std;
	store.writeln;
}
unittest{
	int n=42;
	string fizzbuzz(string acc,int i,string app){
		if(n%i==0)acc~=app;
		return acc;
	}
	import std;
	curryrecurse!(fizzbuzz,3)("",2,"foo",3,"fizz",5,"buzz",7,"bar").writeln;
}