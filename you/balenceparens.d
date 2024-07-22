import basic;
//
// given a string, return if the ()'s balence
// handle (),[],{}
//

bool balparns(string s){

}
unittest{
	balparns("()[]{}([{}])").writeln;
	balparns("()[]{}([{})").writeln;
}
void main(string[] s){
	balparns(s[1]).writeln;
}