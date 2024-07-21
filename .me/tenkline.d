import basic;
// given a file with 10k lines of data, return a summery of that data
//
// each line will have a comma seperated lable(string) and a float
// for each lable return a min, mean and max 
//
// `test` is the test file, which I get the following output:
//
//foo:-87833,111.245,83509
//hello world:-99659,206.169,96935
//buzz:-99577,-131.1,98863
//bar:-82902,-52.9301,93404
//fizz:-69036,146.667,96200

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
		d.reduce!min.write(",");
		d.reduce!mean[0].write(",");
		d.reduce!max.writeln;
	}
}