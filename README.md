# Automated Personal Health Data Pipeline

## Overview
A data engineering workflow designed to ingest, transform, and visualize high-frequency temporal data. This project replaces manual tracking with an automated ETL (Extract, Transform, Load) process powered by the **Wolfram Language** and **system-level integration**.

## Architecture
* **Ingestion:** Automated polling of the local file system using `RunProcess` and `zsh` to identify and fetch the latest CSV extracts.
* **Transformation:** Applied filtering (`Select`), functional programming and pattern matching to process 1,600+ raw logs, executing **temporal normalization** to realign app-specific cycles (08:00 start) to standard 24-hour days (00:00–23:59).
* **Observability:** Dynamic generation of `BarChart`, `Tabular`, `ListLinePlot`, and `ListFitPlot` views to monitor trends in duration and frequency.

## Technical Highlights
* **Language:** Wolfram Language (Mathematica).
* **Key Patterns:** Functional Programming, Pattern Matching, Data Manipulation, System Integration.
* **Automation:** Programmatic file system orchestration to ensure pipeline currency.

## How to View
* 📄 **[Click here to view the full PDF Report](health_pipeline.pdf)** (Recommended for quick viewing)
* 💻 **[Download the .nb file](health_pipeline.nb)** to run the interactive elements in Wolfram Mathematica.

---
*Note: This repository includes `data_ingest.sh` for live automation, but the notebook includes a sample data fallback for safe execution in demo environments.*
