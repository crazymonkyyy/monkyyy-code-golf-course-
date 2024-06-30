### token count is a good code mertic

I like small code, I vaguely remember a casey rant that the smallest code that makes the right asm is the the best code, but take that take and assume that 95% of code shouldn't be optimized.

Now all mertics are bad, due to goodheart law, line count and byte count are very gameable; good code will at least sometimes have comments and unittests, and these are both punished by a naive line counter so thats off the table. But to my knowlegde the worse of it should be fixable by designing a token counter to punish ovisous abuse.

### lib dev

D needs programmers who care about pushing the meta programming into fantastic api, yet I feel fairly alone on that front. see snar saying my range concept are stupid, none of the raylib apis updates wanting to work together, the fucking phoboes datastructures debate. etc.

Reusable code is highly valueable but probaly impossible to quantify. I will probaly need to subjective rules to encourage it. but the plan is to have a "mylib.d" be the 19th file of a code golf course thats counted at a discount *possibly upto 1000x*. that will make abuse of never writing any code in any of the other files but I will try to write some rules that disallow that.

it probaly wont work but I dont care.

### cannonal solutions

Im asking poeple to write 18 programs whats 36(both "good" and "bad") on my end, I get why poeple think I should skip this step and grab shit off "rosetacode", but no; several cannonical solutions will be both a good reference for hints and for debuging.

### dingbats

my other "make d begineer resources, with my name on it so that maybe d jobs appear and im front in line"... didnt take off, part of that was an irrating debate about educational sytle thats everyone else was wrong about, another was me being the wrong person for writing actaul word shit

making test suites isnt fun... at all, its actaully hell, its making 2 things to debug at the same time when id rather just look and hope my instincts on what code should work is right, but 18 problem statements seems more realistic then writing up a book replacement like dingbats.

### educational thoery

We have a fast buggy compiler with pathlotically expressive grammer, *all* learning in dlang should be with real access to the compiler, in general thats should be true for all languges but here espeally. Tight feedback loops are nice and with dmd being faster then some of the zachtronics games a thin layer on top of the raw compiler, a text editor and a terminal is all anyone should want.

### file structure

Im thinking a "codegolf.d" that runs on folders i.e. `dmd -run codegolf` will run `dmd username/fizzbuzz.d` and compare the output with `dmd .goodcode/fizzbuzz.d`
