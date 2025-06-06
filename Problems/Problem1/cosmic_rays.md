# Assignment 1: Exploring Cosmic Ray Flux Data

In this assignment, you will work with real-like cosmic ray flux data. Your tasks will involve filtering, sorting, and computing values using basic shell tools.

## Dataset

The file `data/cosmic_flux_data.txt` contains tab-separated values with the following columns:

Energy(GeV)  Flux(particles/m²/s/sr/GeV)  Particle


Each row corresponds to a measured cosmic ray flux at a given energy.

---

##  Tasks

1. **Display the number of unique particle types** in the dataset.
2. **List the top 5 highest-energy events**.
3. **Extract only the flux values** for protons and compute the average.
4. **Create a new file** that contains only the entries for electrons.

---

##  Hints

- Use `cut`, `sort`, `uniq`, `grep`, `awk`, `head`, and `tail`.
- Remember to skip the header row when appropriate.

---

##  Deliverables

- A Bash script `assignment1_solution.sh` that completes all the above tasks.
- Any outputs should be printed to `stdout` or saved as needed.
