BEGIN {
    var[0] = ""
    var[1] = ""
    pd0 = 0
    pd1 = 0
    printf ("source,target,pitch_diff\n")
}
{
    var[0] = var[1] 
    var[1] = $1 
    pd0 = pd1 
    pd1 = int($2) 
    
    if (var[0] != "" && var[1] != "")
        printf ("%s,%s,%d\n", var[0], var[1], pd0)
}
