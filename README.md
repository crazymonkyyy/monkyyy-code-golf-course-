### monkyyys code golf course(ALPHA)

~~18~~ 9 exciting programing challenges

1. clone this repo

2. edit files in `you`, you are highly encouraged to add code to mylib.d

3. run `./scorefile.d` and/or `./scorescourse` for score

4. (ignore currently stated par)

5. brag and compete on forum

### known issues

1. tokenizer has several issues, including: complex comments and unittest test not being filtered out, several symbols such as `+=` being counted as 2 chars, etc.

2. 9 instead of 18 problems

3. writing on problems statements probaly sucks

4. no attempt at windows support

5. no coherent filter on what makes a good problem

6. no correctness enforcement

### contributing to beta

if a windows dev wants windows support:

1. need a light wieght(low token) cross platform, argument parser for given mylib.d

2. want, help with running scoreing system cross platform

Problem selection:

1. I have 18 probalem probaly should expand then filter for quality, then make the current problems a bit better

2. grammer and phasing of problems statements will be merged blindly

3. for "par" I want a more complicated system, gold/silver/bronze? with real code thats shows a coherent skill level

scoring tokenizer:

1. is "dmd as a lib" actaully any good? I dont realy trust the sorts of arguments poeple will make here, but on the other hand maybe it is just quick and easy; idk

correctness:

1. I hate writting extensive unittests, and will pass it off in a heart beat if someone wants to manage it

2. will a windows dev show up for that to be a requirement for beta?
