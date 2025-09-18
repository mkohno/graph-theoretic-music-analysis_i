BEGIN {
    var[0] = ""
    var[1] = ""
    pitch0 = 0
    pitch1 = 0
}
{
    var[0] = var[1] 
    var[1] = $1 
    pitch0 = pitch1 
    pitch1 = int($2) 
    
    if (var[0] != "" && var[1] != "")
        printf ("%s,%s,%d\n", var[0], var[1], (int(pitch1-pitch0)%12))
}
