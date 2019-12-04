{
    for (i = 1; i <= NF; i = i + 1) sum = sum + ((int($i / 3)) - 2) ;
}

END {
    print sum ;
}
