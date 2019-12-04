    # helper function to calculate fuel
    function calc(i) {
        return ((int(i / 3)) - 2) ;
    }

    # fuel of mass + recursive fuel of fuel until fuel is 0 or negative.
    function calcfuel(i) {
        if (calc(i) <= 0) {
            return 0 ;
        }
        else if (calc(i) == 2) {
            return 2 ;
        }
        else {
            return (calc(i) + calcfuel(calc(i))) ;
        }
        #o += i ;
        #printf "step: " o " | i: " i " | o:" o " | sum: " sum "\n" ;
        # step = step - 1 ;
    }

{
    # for (i = 1; i <= NF; i = i + 1) sum = sum + (((int($i / 3)) - 2) ;
    # for (i = 1; i <= NF; i = i + 1) sum = sum + calcfuel($i) ;
    for (i = 1; i <= NF; i = i + 1)
        sum = sum + calcfuel($i) ;
}

END {
    print sum ;
    # test
    # printf "\n\n---\n" ;
    # print calcfuel(14) ;
}
