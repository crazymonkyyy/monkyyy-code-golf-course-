import std.stdio;
import std.random;
import std.math;
import std.algorithm;
import std.conv;
void main(string[] s){
	auto file=File(s[1]).byLineCopy;
	float[][string] data;
	void append(string s,float f){
		if(s in data){
			data[s]~=f;
		} else {
			data[s]=[f];
		}
	}
	foreach(f;file){
		auto i=f.countUntil(',');
		append(f[0..i],f[i+1..$].to!float);
	}
	foreach(k,d;data){
		write(k,":");
		d[].reduce!min.write(",");
		d[].mean.write(",");
		d[].reduce!max.writeln;
	}
}