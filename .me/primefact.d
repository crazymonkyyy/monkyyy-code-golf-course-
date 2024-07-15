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