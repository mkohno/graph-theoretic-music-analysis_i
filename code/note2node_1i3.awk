BEGIN {
    var[0] = ""
    var[1] = ""
    var[2] = ""
}
{
    var[0] = var[1] 
    var[1] = var[2] 
    var[2] = $1 
    
    if ((NR%2) && var[0] != "" && var[1] != "" && var[2] != "")
        printf ("%s-%s-%s\n", var[0], var[1], var[2])
}
