import basic;
//
//Given a total value and a currency defination(list of coin values)
//return a list of coins that sums to that total
//

int[] coinchange(int total,int[] coins){
	int[] o;
	while(total>0 && coins.length>0){
		if(total>=coins[0]){
			o~=coins[0];
			total-=coins[0];
		} else {
			coins=coins[1..$];
		}
	}
	return o;
}

unittest{
	coinchange(64,[25,10,5,1]).writeln;
	coinchange(15,[999,1]).length.writeln;
}
void main(string[] s){
	int total=s[1].to!int;
	int[] coins=s[2..$].to!(int[]);
	coinchange(total,coins).writeln;
}