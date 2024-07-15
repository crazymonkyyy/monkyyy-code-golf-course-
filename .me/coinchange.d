int[] coins1(int total,int[] coins){
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