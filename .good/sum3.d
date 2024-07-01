/*
3 sum
given a list of intergers find 3 that add to n
*/

import std;

int[2] sum2(int i,int[] a){
	int* f=&a[0];
	int* l=&a[$-1];
	while(f!=l){
		if(*f+*l==i){
			return [*f,*l];
		}
		if(*f+*l<i){
			f++;
		} else {
			l--;
		}
	}
	return [-i,-i];
}

void main(string[] s){
	int n=s[1];
	int[] a=s[2..$].map!(to!int).array;
	
