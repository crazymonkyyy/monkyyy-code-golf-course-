import std;
void main(){
	File("csscolors.txt").byLineCopy.array.chunks(2)
		.map!(a=>'"'~a[0]~"\":\""~a[1]~"\",").each!writeln;
}
