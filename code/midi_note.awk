BEGIN {
    note_name_array[0] = "C"
    note_name_array[1] = "C#"
    note_name_array[2] = "D"
    note_name_array[3] = "D#"
    note_name_array[4] = "E"
    note_name_array[5] = "F"
    note_name_array[6] = "F#"
    note_name_array[7] = "G"
    note_name_array[8] = "G#"
    note_name_array[9] = "A"
    note_name_array[10] = "A#"
    note_name_array[11] = "B"
}
$1 == "note_on" && $2 == "channel=0" && $4 != "velocity=0" {
    note = $3
    sub("note=", "", note)
    
    n = int(note) % 12
    p = int(note / 12) - 1 

    printf ("%s%d\n", note_name_array[n], p)
}
