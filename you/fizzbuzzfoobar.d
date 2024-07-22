import basic;
//Print the numbers from 0 to 100 inclusive, each on their own line.
//
//If, however, the number is a multiple of two then print Foo instead,
//if the number is a multiple of three then print Fizz,
//if the number is a multiple of five then print Buzz,
//and if the number is a multiple of seven then print Bar.
//
//https://code.golf/foo-fizz-buzz-bar

void main(){
	foreach(e;counter(100)){
		e.writeln;
	}
}
