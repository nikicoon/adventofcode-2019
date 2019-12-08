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
#    for (i=0; i<=NR;i++)
#        print ops[i];
    for (i = 0; ops[i] != 99; i += 4) {
        if (ops[i] == 1)
            ops[ops[i+3]] = ops[ops[i+1]] + ops[ops[i+2]];
        else if (ops[i] == 2)
            ops[ops[i+3]] = ops[ops[i+1]] * ops[ops[i+2]];
    }
#    for (i=0; i<=NR;i++)
#        print ops[i];
    print ops[0];
}
