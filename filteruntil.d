auto filter_(alias F,R)(R r){
	struct fil{
		R r;
		auto front()=>r.front;
		auto popFront(){
			r.popFront;
			while((!r.empty)&&F(r.front)){
				r.popFront;
			}
		}
		bool empty()=>r.empty;
	}
	if(r.empty){
		return fil(r);
	}
	if(F(r.front)){
		auto t=fil(r);
		t.popFront;
		return t;
	}
	return fil(r);
}
unittest{
	import std;
	//iota(0,10).filter_!(a=>a%2).writeln;
}
auto filterelem(R,E)(R r,E e){
	struct fil{
		R r;
		E e;
		auto front()=>r.front;
		auto popFront(){
			r.popFront;
			while((!r.empty)&&r.front==e){
				r.popFront;
			}
		}
		bool empty()=>r.empty;
	}
	auto t=fil(r,e);
	if(t.empty){
		return t;
	}
	if(r.front==e){
		t.popFront;
	}
	return t;
}
unittest{
	import std;
	//[0,1,2,3,1,4,5].map!(a=>a).filterelem(1).writeln;
}

auto filterarray(R,E)(R r,E e){
	bool equals(ref R r,E e){
		while(e.length>0 &&(!r.empty)&&e[0]==r.front){
			e=e[1..$];
			r.popFront;
		}
		return e.length==0;
	}
	struct fil{
		R r;
		E e;
		auto front()=>r.front;
		auto popFront(){
			r.popFront;
			if(r.empty){return;}
			auto t=r;
			if(equals(t,e)){
				r=t;
			}
		}
		bool empty()=>r.empty;
	}
	if(r.empty){
		return fil(r,e);
	}
	{
		auto t=r;
		if(equals(t,e)){
			return fil(t,e);
	}}
	return fil(r,e);
}
unittest{
	import std;
	[1,2,3,9,1,2,3,3].map!(a=>a).filterarray([1,2,3]).writeln;
}
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
        void popFront(){
            if(r.empty){return;}
            r.popFront;
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
        temp.popFront;
        return temp;
    }
    return fue(r);
}
auto nodecode(string s){
    struct no{
        char[] s;
        char front()=>s[0];
        void popFront(){s=s[1..$];}
        bool empty()=>s.length==0;
    }
    return no(cast(char[])s);
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
unittest{
    import std;
    "hello *****%%%%% world".nodecode.filteruntilexecute!(a=>a.front=='*',(a){while(a.front!='%'){a.popFront;}return a;},a=>a.writeln).array.writeln;
    //iota(5).verbose.writeln;
    iota(5).filteruntilexecute!(a=>a.front==2,a=>a.drop(2),a=>a.writeln).array.writeln;
}