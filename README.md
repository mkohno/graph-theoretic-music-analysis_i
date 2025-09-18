# Graph Theoretic Analysis of Music

Graph theoritic analysis offers a powerful framework for modelling relationships between musical elements, enabling the visualisation of connections, network structure, and occurrence frequencies using metrics such as degree distribusion, density and centrality. This approach facilitates the identification of emergent, self-organising properties within musical compositions.


## 🎶 Graph-Theoretic Analysis of Musical Structure
This repository contains the code and data used in the poster:

*Is C Major Truly Radiant? A Graph-Theoretic Study of J.S. Bach’s Solo String Works and Their Tonal Characteristics* ([ICCCM 2025](https://www.titanmusic.com/icccm2025/programme.html))

[Poster]  \
[Presentation]


### 📂 Contents
- `code/` – Analysis scripts
- `data/` – MIDI files and derived note sequences
- `results/` – Graph metrics data
<!-- - `notebook.ipynb` – Jupyter notebook for reproducing key results  -->

### 📦 Requirements
- Python 3.12.3
- awk (pattern-directed scanning and processing language)
- Python Library : mido
- Python Library : powerlaw
- Cytoscape 3.10.3

### ❄️ Workflow 
1. convert midi (.mid) to text file
2. convert midi text to represent note
3. create node from the note and create csv file which describes node-to-node relationship
4. analyse using Cytoscape - import the csv file and create Network
5. evaluate power law fitting
6. evaluate pith difference of eacn node
  
#### Example 
1.　convert midi (.mid) to text file 
```
    python3 midi-to-text.py ~/_Music_Analysis/_Bach_MIDI/bwv1001/vs1-1ada.mid  vs1-1ada.txt
    python3 midi-to-text.py ~/_Music_Analysis/_Bach_MIDI/bwv1001/vs1-2fug.mid  vs1-2fug.txt
    python3 midi-to-text.py ~/_Music_Analysis/_Bach_MIDI/bwv1001/vs1-3sic.mid  vs1-3sic.txt
    python3 midi-to-text.py ~/_Music_Analysis/_Bach_MIDI/bwv1001/vs1-4prs.mid  vs1-4prs.txt

    cat vs1-1ada.txt vs1-2fug.txt vs1-3sic.txt vs1-4prs.txt > vs1-complete.txt
```   
2.  convert midi text to represent note
```
    awk -f midi_note-and-pitch.awk vs1-complete.txt > vs1-complete_note
``` 
    
4. create node from the note and create csv file which describes 2-gram node-to-node relationship
```
    awk -f note2node-pitch_1i.awk vs1-complete_note > vs1-complete_2.tmp
    awk -f node2network_pd.awk vs1-complete_2.tmp > vs1-complete_2_pd.csv
 ```  

5. analyse using Cytoscape - import the csv file and create Network

6. evaluate power law fitting
```
    python3 power-law-fitting.py ND_vs1-complete_2 (ND_xx is a Node Degree Distribution, retrieved from the Cytoscape analysis)
```
  
7. evaluate pith difference of eacn node
```
    awk -f pitch_diff.awk vs1-complete_note > vs1-complete_2_pitch.csv
```


## 📄 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

<!--
## ▶️ How to Run

```bash
python main.py
-->
