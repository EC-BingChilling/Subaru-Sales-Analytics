# Guide: Updating and Publishing the Subaru Sales Dashboard to GitHub Pages

This guide explains how to use the `dashboard.sh` script to regenerate and publish the Subaru Sales Analytics Dashboard to GitHub Pages.

---

## Requirements

Before starting, ensure the following:

* You have Git installed
* You have R and RStudio installed
* Your working directory is the project root (where `.git`, `dashboard/`, and `docs/` folders exist)
* You've cloned the repository locally

---

## Script Location

The script is named `dashboard.sh` and is located in the root folder of the repository:

```
SubaruSalesAnalytics/
├── dashboard.sh
├── dashboard/
├── docs/
├── data/
├── scripts/
└── README.md
```

---

## What the Script Does

When you run the script, it will:

1. Render the dashboard R Markdown file (e.g., `flexdashboard-test.Rmd`) into an HTML file.
2. Move the generated HTML file into the `docs/` folder and rename it `index.html`.
3. Commit the new `index.html` to Git.
4. Push the changes to the GitHub `main` branch.

---

## How to Run the Script

### Step 1: Open a Terminal

Use Git Bash, WSL, or your terminal of choice.

### Step 2: Navigate to the Project Folder

```bash
cd ~/OneDrive/Desktop/SubaruSalesAnalytics
```

Update the path above based on your actual project location.

### Step 3: Run the Script

```bash
./dashboard.sh
```

> Tip: If it says "Permission denied", try:

```bash
chmod +x dashboard.sh
./dashboard.sh
```

### Optional: Add a Custom Commit Message

You can also specify a commit message:

```bash
./dashboard.sh "Update dashboard with new chart"
```

---

## Confirm Deployment

Visit your GitHub Pages site:

```
https://github.com/EC-BingChilling/Subaru-Sales-Analytics
```

If everything worked, you should see the updated dashboard.

---

## Troubleshooting

* If you get an error about file paths, make sure you're in the correct folder and the `dashboard/flexdashboard-test.Rmd` exists.
* Make sure you're connected to the internet for the `git push` to work.
* RStudio must be able to locate required packages (`ggplot2`, `readr`, `dplyr`, `flexdashboard`). Install them using `install.packages()` if needed.

---

## Summary

1. Edit the `.Rmd` file
2. Run `./dashboard.sh`
3. Check the live link

That’s it!
