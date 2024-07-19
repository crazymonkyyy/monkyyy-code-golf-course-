import std;
auto takeUntil(R)(R base,R other){
	struct Result{
		R base;
		R other;
		//alias base this;
		auto front()=>base.front;
		auto popFront(){
			if(base.empty){return;}
			base.popFront;
		}
		bool empty()=>base==other;
	}
	return Result(base,other);
}
auto filteruntilexecute(alias F,alias U,alias E,R)(R r){
	struct fue{
		R r;
		auto front()=>r.front;
		auto empty()=>r.empty;
		void popFront(bool offbyone=false)(){
			if(r.empty){return;}
			static if(offbyone==false){
				r.popFront;
			}
			if(r.empty){return;}
			auto t=r;
			if(F(t)){
				auto u=U(t);
				E(r.takeUntil(u));
				r=u;
			}
		}
	}
	if(r.empty){
		return fue(r);
	}
	auto t=r;
	if(F(t)){
		auto temp=fue(r);
		temp.popFront!true;
		return temp;
	}
	return fue(r);
}
auto verbose(string s="",R)(R r){
	import std;
	struct v{
		R r;
		auto front(){
			if(empty){
				"extra read".writeln;
			}
			s.write;
			"front:".write;
			r.front.writeln;
			return r.front;
		}
		auto popFront(){
			if(empty){
				"prevented extra pop".writeln;
				return;
			}
			s.write;
			"popfront".writeln;
			r.popFront;
		}
		auto empty(){
			s.write;
			"empty:".write;
			r.empty.writeln;
			return r.empty;
		}
	}
	return v(r);
}
template equals(string s){
	bool equals(R)(R r){
		foreach(c;s){
			if(r.front!=c){
				return false;
			}
			r.popFront;
		}
		return true;
	}
}
auto donothing(R)(R r)=>r;
template takewhile(char c){
	auto takewhile(R)(R r){
		while(!r.empty&&r.front!=c){
			r.popFront;
		}
		if(!r.empty){r.popFront;}
		return r;
}}
auto findendofstring(R)(R r){
	if(r.front!='"'){
		"warning:im very confused".writeln;
	}
	r.popFront;
	dchar last;
	while(!r.empty&&r.front!='"'&&last!='\\'){
		last=r.front;
		r.popFront;
	}
	if(!r.empty&&r.front=='"'){
		r.popFront;
	}
	return r;
}
bool match(patterns...)(dchar c){
	static foreach(p;patterns){
		static if(is(typeof(p)==char)){
			if(c==p){return true;}
		}
		static if(is(typeof(p)==char[])){
			if(c>=p[0]&&c<=p[1]){return true;}
		}
		//static if(is(typeof(p)==string)){
		//	static assert(0);
		//}
	}
	return false;
}
unittest{
	assert('0'.match!(['0','9']));
}
template continu(patterns...){
auto continu(R)(R r){
	while(!r.empty&&r.front.match!patterns){
		r.popFront;
	}
	return r;
}}
int scr;
int score(string file){
	scr=0;
	auto f=File(file).byLineCopy;
	//import basic is free
	if(f.front=="import basic.d;"){
		f.popFront;
	} else {
		"warning: you should start files with `import basic;`".writeln;
	}
	f.join('\n')
		//punish import statements, 100 points
		.filteruntilexecute!(equals!"import",takewhile!';',(a){
			scr+=100;
			"warning: only import basic should be used".writeln;
		})
		//remove comments
		.filteruntilexecute!(equals!"//",takewhile!'\n',donothing)
		//remove unittests TODO, count {, only flat rn
		.filteruntilexecute!(equals!"unittest{",takewhile!'}',donothing)
		//count strings, every 5 chars as one point
		.filteruntilexecute!(equals!"\"",findendofstring,(r){
			scr+=(r.count-2)/5;
			scr++;
		})
		//remove idenifiers and keywords
		.filteruntilexecute!(a=>a.front.match!(['a','z'],['A','Z'],'_'),
			continu!(['a','z'],['A','Z'],'_',['0','9']),(r){
				scr++;
		})
		//count numbers, every 3 chars is a point
		.filteruntilexecute!(a=>a.front.match!(['0','9']),continu!(['0','9'],'.'),(r){
			scr+=(r.count)/3;
			scr++;
		})
	//whitespace
	.filter!(a=>a!=' ')
	.filter!(a=>a!='\t')
	.filter!(a=>a!='\n')
	.each!(a=>scr++);
	return scr;
}

void main(string[] s){
	score(s[1]).writeln;
}