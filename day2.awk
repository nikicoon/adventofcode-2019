# an opcode is an integer followed by 3 other integers
# an opcode sequence consists of 4 integers
# valid opcodes are:
# opcode "1" adds up
# opcode "2" multiplies
# opcode 99 means "program is finished, immediately halt"
# everything else is is an (indication for an) error (?)
# opcodes operate on the entire record
# if an opcode is processed, advance 4 positions to the next opcode
BEGIN {
    RS = ","
}
{ ops[i++] = $1 }
END {
    ops[1] = 12;
    ops[2] = 2;
    for ( i in ops)
	val++;
#    for (i=0; i<=NR;i++)
#        print ops[i];
    # outputIndex = ops[i + 3]
    # inputA = ops[ops[i + 1]]
    # inputB = ops[ops[i + 2]]
    # walk through array ops. ops contains entries from inputfile.
    # break at ops[i] = 99.
    #for (i = 0; ops[i] != 99; i += 4) {
    for (i = 0; i <= val; i += 4) {
        if (ops[i] == 1)
            ops[ops[i+3]] = ops[ops[i+1]] + ops[ops[i+2]];
        else if (ops[i] == 2)
            ops[ops[i+3]] = ops[ops[i+1]] * ops[ops[i+2]];
	else if (ops[i] == 99)
	    break;
	else
	    print "Invalid input";
    }
#    for (i=0; i<=NR;i++)
#        print ops[i];
    print ops[0];
}
