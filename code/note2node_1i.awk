BEGIN {
    var[0] = ""
    var[1] = ""
}
{
    var[0] = var[1] 
    var[1] = $1 
    
    if (var[0] != "" && var[1] != "")
        printf ("%s-%s\n", var[0], var[1])
}
