import basic;
//write genertic code here
//for the sake of this contest code is genertic if:
//		1. you use the function in 2 problems
//		2. it exists in any standard lib(but doesnt match an exact problem)
//		3. it could be used to solve 5 leet code problems
alias Seq(T...)=T;
unittest{
	alias foo=Seq!(int,float,3);
	assert(foo[2]==3);
}
struct tuple(T...){
	T _; alias _ this;
}
auto pair(T,S)(T t,S s){
	return tuple!(T,S)(Seq!(t,s));
}
unittest{
	auto foo=pair("hi",13.37);
	assert(foo[0]=="hi");
}
struct counter{
	int end;
	int front=0;
	void popFront(){front++;}
	bool empty()=>front<=end;
}
unittest{
	//todo
}
//less bad autodecoding, still bad tho
auto front(E)(E[] range)=>range[0];
void popFront(E)(ref E[] range){range=range[1..$];}
bool empty(E)(E[] range)=>range.length==0;
unittest{
	//todo
}
auto map(alias F,R)(R r){
	struct Map{
		R r;
		auto front()=>F(r.front);
		void popFront(){r.popFront;}
		bool empty()=>r.empty;
	}
	return Map(r);
}
unittest{
	//todo
}
//todo filter
//todo reduce
auto array(R)(R r){
	typeof(R.front())[] output;
	foreach(e;r){
		output~=e;
	}
	return output;
}


