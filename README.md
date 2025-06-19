# Probability Theory Final Assignment

> Probability Theory – **Final Assignment** (2025)  
> [![Build Status](https://img.shields.io/badge/status-cool-brightgreen)](#)

A self-contained repository that **analytically and numerically** tackles a short
list of probability-theory problems.  
Every step—from pulling the constants out of a spreadsheet to generating
Monte-Carlo estimates and writing the formal report—lives here.

All derivations and discussion appear in **[`docs/report.pdf`](./docs/report.pdf)**.  
This README focuses on *how to run the code* and *what lives where*.

---
## 📋 Table of Contents
1. [Project Overview](#project-overview)  
2. [Repository Structure](#repository-structure)  
3. [Quick Start](#quick-start)  
4. [Running the Analyses](#running-the-analyses)  
5. [Re-building the Report](#re-building-the-report)  
6. [License](#license)
---

## Repository Structure

```text
├── data/
│   ├── dados-2025.xlsx       # input constants
│   └── resultados-2025.xlsx  # auto-generated simulation results
├── docs/
│   ├── report.pdf            # final write-up (compiled)
│   └── report.typ            # Typst source
├── src/
│   └── assignment.ipynb      # step-by-step solution notebook
├── LICENSE
├── README.md                 # you’re here 🙂
└── requirements.txt          # pinned Python deps
````

---

## Quick Start

```bash
# 1) clone and create an isolated env (Python ≥ 3.11 recommended)
git clone https://github.com/your-username/prob-assignment.git
cd prob-assignment
python -m venv .venv && source .venv/bin/activate

# 2) install requirements
pip install -r requirements.txt
```
---

## Running the Analyses

Open the Jupyter notebook:

```bash
jupyter lab src/assignment.ipynb
```

and *run all cells*.
---

## License


See [`LICENSE`](./LICENSE) for details.
