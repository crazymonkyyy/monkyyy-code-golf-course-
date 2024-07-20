import scorefile;
import std;

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

void main(string[] s){
	while(s.length<2){s~="you";}
	string folder=s[1];
	int total;
	int partotal;
	curryrecurse!((file,par){
		int filesscore=score(folder~'/'~file);
		total+=filesscore;
		partotal+=par;
		writeln(file,":",filesscore,"(",par,")");
	})
	(
		"csscolors.d",100,
		"coinchange.d",50,
		"tenkline.d",25,
	);
	writeln(total,"/",partotal);
}