# graph-music-analysis
Graph Theoretic Analysis of Music

Graph theoritic analysis offers a powerful framework for modeling relationships between musical elements, enabling the visualization of connections, network structure, and occurrence frequencies using metrics such as degree distribusion, density and centrality. This approach facilitates the identification of emergent, self-organizing properties within musical compositions.

## Graph-Theoretic Analysis of Musical Structure

This repository contains the code and data used in the paper:

> *Diverse, yet Cohesive: An Interpretable Graph-Theoretic Analysis of J.S. Bach and Schoenberg’s Music* (ISMIR 2025, Submitted)

### 📂 Contents

- `main.py` – Main analysis script
- `data/` – MIDI files and derived note sequences
- `results/` – Network metrics and figures
- `notebook.ipynb` – Jupyter notebook for reproducing key results

### 📦 Requirements

- Python 3.12.3
- awk (pattern-directed scanning and processing language)
- Python Library : mido
- Python Library : powerlaw
- Cytoscape 

## ▶️ How to Run

```bash
python main.py
