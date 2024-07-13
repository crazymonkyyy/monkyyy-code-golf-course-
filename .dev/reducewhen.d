import std;

int[] coins1(int total,int[] coins){
	int[] o;
	while(total>0 && coins.length>0){
		if(total>=coins[0]){
			o~=coins[0];
			total-=coins[0];
		} else {
			coins=coins[1..$];
		}
	}
	return o;
}
auto coins2(int total,int[] coins){
	struct o{
		int total;int[] coins;
		int front=-999;
		void popFront(){
			front=-999;
			if(! empty){
				if(total>=coins[0]){
					front=coins[0];
					total-=front;
				} else {
					coins=coins[1..$];
					popFront;
				}
			}
		}
		bool empty()=> !(total>0 && coins.length>0);
	}
	o temp=o(total,coins); 
	temp.popFront;
	return temp;
}
struct nullable(E){
	bool isnull=true;
	E me; alias me this;
	this(E e){
		me=e;
		isnull=false;
	}
	void opAssign(E e){
		me=e;
		isnull=false;
	}
}	
auto coins3(R)(int total,R coins){
	struct o{
		int total; R coins;
		nullable!int front_;
		auto front()=>front_.me;
		void popFront(){
			front_.isnull=true;
			if(!emptytest){
				if(total>=coins.front){
					front_=coins.front;
					total-=front_;
				} else {
					coins.popFront;
					popFront;
		}}}
		bool emptytest()=>!(total>0 && coins.length>0);
		bool empty()=> emptytest&&front_.isnull;
	}
	o temp=o(total,coins); 
	temp.popFront;
	return temp;
}
unittest{
	//coins3(76,[25,10,5,1]).writeln;
}
int[] fact(int i){
	int[] o;
	int j=2;
	while(i>1){
		while(i%j==0){
			o~=j;i/=j;
		}
		j++;
	}
	return o;
}
auto fact2(int i){
	struct o(R){
		int i;
		R j;
		nullable!int front_;
		auto front()=>front_.me;
		void popFront(){
			//i.writeln;
			front_.isnull=true;
			if(!emptytest){
				if(i%j.front==0){
					front_=j.front;
					i/=front_;
				} else {
					j.popFront;
					popFront;
		}}}
		bool emptytest()=>i==1;
		bool empty()=>emptytest&&front_.isnull;
	}
	auto r=iota(2,int.max);
	auto temp=o!(typeof(r))(i,r); 
	temp.popFront;
	return temp;
}
auto fact3(int i){
	struct o(R){
		int i;
		R j;
		nullable!int front_;
		auto front()=>front_.me;
		void popFront(){
			//i.writeln;
			front_.isnull=true;
			if(!emptytest){
				if(validitytest(i,j.front)){
					front_=j.front;
					i=modify(i,front_);
				} else {
					j.popFront;
					popFront;
		}}}
		bool emptytest()=>i==1;
		bool validitytest(int a,int b)=>a%b==0;
		auto modify(int a,int b)=>a/b;
		bool empty()=>emptytest&&front_.isnull;
	}
	auto r=iota(2,int.max);
	auto temp=o!(typeof(r))(i,r); 
	temp.popFront;
	return temp;
}
unittest{
	fact3(480).writeln;
}
auto pickyfilter(alias modify,alias emptytest,alias validitytest,R,E)
		(R r,E e){
	struct acc{
		R r;
		