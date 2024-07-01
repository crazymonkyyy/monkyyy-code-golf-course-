import std;
alias S=string;
struct T{AliasSeq!(int,S) _;}
auto f(int i,S s,int w,S a)=>T(i,s~(i%w?"":a));
auto f(T t,int w,S a)=>f(t._,w,a);
int main()=>iota(1000).map!(i=>f(f(f(f(i,"",2,"foo"),3,"fizz"),5,"buzz"),7,"bar")).each!writeln;
