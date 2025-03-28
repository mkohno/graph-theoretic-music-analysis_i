BEGIN {
    var[0] = ""
    var[1] = ""
    var[2] = ""
    var[3] = ""
    d1 = 0
    d2 = 0
    d3 = 0
    d4 = 0
}
{
    var[0] = var[1] 
    var[1] = var[2] 
    var[2] = var[3] 
    var[3] = $1 
    d1 = int(var[0])
    d2 = int(var[1])
    d3 = int(var[2])
    d4 = int(var[3])
    
    if ((NR%3 == 1) && var[0] != "" && var[1] != "" && var[2] != "" && var[3] != "")
    #if (var[0] != "" && var[1] != "" && var[2] != "" && var[3] != "")
        printf ("%3d %3d %3d\n", (d2-d1), (d3-d2), (d4-d3))
        #printf ("%s-%s-%s-%s\n", var[0], var[1], var[2], var[3])
}
