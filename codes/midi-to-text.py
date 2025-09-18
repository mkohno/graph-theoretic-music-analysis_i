import sys
import mido

def midi_to_text(input_file, output_file):
    with mido.MidiFile(input_file) as midi_file:
        with open(output_file, 'w') as output: 
            for msg in midi_file:
                output.write(f"{msg}\n")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python3 midi_to_text.py input_file.mid output_file.txt")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    midi_to_text(input_file, output_file)
