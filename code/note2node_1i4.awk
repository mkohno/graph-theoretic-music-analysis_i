BEGIN {
    var[0] = ""
    var[1] = ""
    var[2] = ""
    var[3] = ""
}
{
    var[0] = var[1] 
    var[1] = var[2] 
    var[2] = var[3] 
    var[3] = $1 
    
    if ((NR%3 == 1) && var[0] != "" && var[1] != "" && var[2] != "" && var[3] != "")
        printf ("%s-%s-%s-%s\n", var[0], var[1], var[2], var[3])
}
