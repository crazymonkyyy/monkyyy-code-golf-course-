import std;
enum E{Foo=2,Fizz=3,Buzz=5,Bar=7};
void main(){
	foreach(i;iota(1,100)){
		foreach(e;EnumMembers!E){
			if(!(i%e))e.write;
		}
		if(i%3%2){
			i.writeln;
		} else {
			writeln;
		}
	}
}
