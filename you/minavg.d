import basic;
//
// Given a list of ints, pair up the nth largest with the nth smallest,
// average these pairs, return the min average  
//
//https://leetcode.com/problems/minimum-average-of-smallest-and-largest-elements/description/
void main(string[] s){
	int[] a=s[1..$].map!(to!int).array;
	a.sort;
	
}