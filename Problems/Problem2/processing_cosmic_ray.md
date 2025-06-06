# Assignment 2: Processing Cosmic Ray Data with Pipes, Filters, and Loops

In this assignment, you'll apply shell scripting to extract scientific insight from the `cosmic_flux_backup.txt` file you created in Assignment 1. You'll use pipes, filters, and `for` loops to analyze the dataset.

---

## Topics Covered

- Using pipes (`|`) to chain commands
- Extracting columns with `cut`
- Filtering text with `awk`
- Sorting and counting with `sort`, `uniq`, `wc`
- Writing loop structures in Bash

---

## Input File

The data file you’ll be working with is:

results/cosmic_flux_backup.txt


> ️ This assumes you've completed Assignment 1. If not, make sure this file exists by copying it from `data/`.

---

##  Problem Statement

Write a Bash script called `assignment2_solution.sh` that performs the following tasks:

1. Navigate into the `results/` directory.
2. Count how many **unique particle types** are in the file.
3. Display the **top 5 highest-energy events** in the dataset.
4. For **each particle type**, compute the **average flux** using a `for` loop and `awk`.
5. Create a new file named `high_energy_protons.txt` that contains only rows for **Protons with energy greater than 20 GeV**. Keep the header row.

---

## Tips

- Use `tail -n +2` to skip the header.
- Use `cut -f3` to extract the particle column.
- Use `sort`, `uniq`, and `wc -l` to count unique values.
- Use `awk` to filter and compute column-based stats.
- Use a `for` loop to iterate through each unique particle.
- Use `head -n 1` to copy the header row when creating the proton file.

---

## Deliverable

Submit a script named:

assignment2_solution.sh


This script should:

- Use **relative paths**.
- Work from the **root** of the repository.
- Include **echo** statements to describe what each part is doing.
- Produce a final file called `results/high_energy_protons.txt`.

---

## Example Output Snippet

Example command to check the number of unique particles:

```bash
tail -n +2 cosmic_flux_backup.txt | cut -f3 | sort | uniq | wc -l

