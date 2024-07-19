import basic;
//
// given a string, return if the ()'s balence
// handle (),[],{}
//
char[char] parns=[')':'(',']':'[','}':'{'];
bool balparns(string s){
	string store;
	foreach(c;s){
		switch(c){
			case '(':case '[':case '{':
				store~=c;
				break;
			case ')':case ']':case '}':
				if(store.length==0){
					return false;
				}
				if(parns[c]==store[$-1]){
					store=store[0..$-1];
				} else {
					return false;
			 default:
		}}
	}
	if(store.length>0){
		return false;
	}
	return true;
}
unittest{
	balparns("()[]{}([{}])").writeln;
}