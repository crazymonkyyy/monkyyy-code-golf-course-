import basic;
//
// given N, return the a sorted list of prime numbers that is its product
// 

int[] fact(int i){
	int[] o;
	int j=2;
	while(i>1){
		while(i%j==0){
			o~=j;i/=j;
		}
		j++;
	}
	return o;
}
unittest{
	fact(10).writeln;
	fact(480).writeln;
}
void main(string[] s){
	s[1].to!int.fact.writeln;
}