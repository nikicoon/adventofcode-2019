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
{ ops[k++] = $1 }
function copy_array(a, b) {
    delete a;
    for ( q in b ) {
	a[q] = b[q];
    }
}
function try(noun, verb) {
    fops[1] = noun;
    fops[2] = verb;
}
function calculate_array(arr) {
    for (p = 0; arr[p] != 99; p += 4) {
        if (arr[p] == 1)
            arr[arr[p+3]] = arr[arr[p+1]] + arr[arr[p+2]];
        else if (arr[p] == 2)
            arr[arr[p+3]] = arr[arr[p+1]] * arr[arr[p+2]];
    }
}
END {
    ops[1] = 12;
    ops[2] = 2;
#    for ( i in ops)
#	val++;
#    for (i=0; i<=NR;i++)
#        print ops[i];
    # outputIndex = ops[i + 3]
    # inputA = ops[ops[i + 1]]
    # inputB = ops[ops[i + 2]]
    # walk through array ops. ops contains entries from inputfile.
    # break at ops[i] = 99.
    # for (i = 0; i <= val; i += 4) {
    calculate_array(ops);
    # for (i = 0; ops[i] != 99; i += 4) {
    #     if (ops[i] == 1)
    #         ops[ops[i+3]] = ops[ops[i+1]] + ops[ops[i+2]];
    #     else if (ops[i] == 2)
    #         ops[ops[i+3]] = ops[ops[i+1]] * ops[ops[i+2]];
#	else if (ops[i] == 99)
#	    break;
#	else
#	    print "Invalid input";
    # }
#    for (i=0; i<=NR;i++)
#        print ops[i];
    print ops[0];
    # ops[] is our original array, we need this ("initial memory").
    # start each itteration with the original array ("reset memory").
    # delete fops[] elements, copy ops[] into fops[].
    # this block has to run repeatedly -> make it a function?
    # function copy_array() {
    # 	delete fops;
    # 	for ( i in ops ) {
    # 	    fops[i] = ops[i];
    # 	}
    # }
    copy_array(fops, ops);
    for ( i = 0; i < 100; i++) {
	for (j = 0; j < 100; j++) {
	    try(i, j);
	    # print i " " j;
	    calculate_array(fops);
	    #print fops[0];
	    #print 100 * i + j;
	    if (fops[0] == 19690720) {
		print 100 * i + j;
		exit;
	    }
	    #delete fops;
	    copy_array(fops, ops);
	}
    }
}
