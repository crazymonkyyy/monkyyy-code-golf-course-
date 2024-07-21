#!rdmd -version=localmain  
void foobar(int i){
	import std;
	i.writeln;
}

version(localmain){
	void main(){
		foobar(7);
}}