# graph-music-analysis
Graph Theoretic Analysis of Music

Graph theoritic analysis offers a powerful framework for modeling relationships between musical elements, enabling the visualization of connections, network structure, and occurrence frequencies using metrics such as degree distribusion, density and centrality. This approach facilitates the identification of emergent, self-organizing properties within musical compositions.

## Graph-Theoretic Analysis of Musical Structure

This repository contains the code and data used in the paper:

> *Diverse, yet Cohesive: An Interpretable Graph-Theoretic Analysis of J.S. Bach and Schoenberg’s Music* (ISMIR 2025, Submitted)

### 📂 Contents

- `code/` – Analysis scripts
- `data/` – MIDI files and derived note sequences
- `results/` – Network metrics and figures
<!-- - `notebook.ipynb` – Jupyter notebook for reproducing key results  -->

### 📦 Requirements

- Python 3.12.3
- awk (pattern-directed scanning and processing language)
- Python Library : mido
- Python Library : powerlaw
- Cytoscape 3.10.2

### ❄️ Workflow 

1. convert midi (.mid) to text file
2. convert midi text to represent note
3. create node from the note and create csv file which describes node-to-node relationship
4. import the csv file and create Network using Cytoscape
5. (optional) evaluate power law fitting
6. (optional) evaluate pith difference of eacn node
  
### Example (Schoenberg Op.19)
1. `python3 midi-to-text.py ~/_Music_Analysis/_Schoenberg/Op.19.mid  schoen_op19.txt`
2. `awk -f midi_note.awk schoen_op19.txt > schoen_op19_note`
3. 
  3.1 N=1 (1 note as a node)
     `awk -f node2network.awk schoen_op19_note > schoen_op19_1.csv`
  3.2 N=2 (2 notes as a node)
     `awk -f note2node_1i.awk schoen_op19_note > schoen_op19_2.tmp`
     `awk -f node2network.awk schoen_op19_2.tmp > schoen_op19_2.csv`
  3.3 N=3 (3 notes as a node)
     `awk -f note2node_1i3.awk schoen_op19_note > schoen_op19_3.tmp`
     `awk -f node2network.awk schoen_op19_3.tmp > schoen_op19_3.csv`
  3.4 N=4 (4 notes as a node)
     `awk -f note2node_1i4.awk schoen_op19_note > schoen_op19_4.tmp`
     `awk -f node2network.awk schoen_op19_4.tmp > schoen_op19_4.csv`
4. run Cytoscape and import the csv file and analyse
5. `python3 power-law-fitting.py ND_schoen_op19_1` (ND_xx is a Node Degree Distribution, retrieved from the Cytoscape analysis)
6. `awk -f midi_pitch.awk schoen_op19.txt > schoen_op19_pitch`
   `awk -f pitch_diff_1i4.awk schoen_op19_pitch > schoen_op19_4-pitch`

<!--
## ▶️ How to Run

```bash
python main.py
-->
