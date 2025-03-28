BEGIN {
    var[0] = ""
    var[1] = ""
    d1 = 0
    d2 = 0
}
{
    var[0] = var[1] 
    var[1] = $1 
    d1 = int(var[0])
    d2 = int(var[1])
    
    if (var[0] != "" && var[1] != "")
	printf ("%d ",(d2-d1))
        #printf ("%s-%s\n", var[0], var[1])
}
