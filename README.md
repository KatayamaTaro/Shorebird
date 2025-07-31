## Shorebird Project

**Shiny app that helps you enter shorebird data**

---

### Overview

Shorebird is an R Shiny application designed to assist CABR staff in entering and managing shorebird survey data. It provides a simple interface for data entry, error correction, and CSV export. The project organizes scripts, reports, and data to streamline survey management.

#### Key Features

- Interactive R Shiny data entry app
- CSV downloading for entered data
- Error correction ("remove last entry" feature)
- Organized folder structure for scripts, reports, and data

---

## File Structure

Below is an overview of the root folder structure:

```
Shorebird/
├── Data/                # Contains survey data (hidden by .gitignore)
├── Report/              # Stores generated reports (hidden by .gitignore)
├── Scripts/             # R scripts and Shiny app
│   └── Shorebird_Shiny.rmd
├── Shorebird_Enter_Data.Rproj
├── README.md
├── .gitignore
```

_Note: The Data and Report folders are hidden due to .gitignore settings._

---

## Installation

**Prerequisites:**
- R (version >= 4.0 recommended)
- RStudio
- Required R packages: `shiny`, `tidyverse`, etc.

**Setup Steps:**
1. Clone the repository:
   ```sh
   git clone https://github.com/taroNPS/Shorebird.git
   ```
2. Open `Shorebird_Enter_Data.Rproj` in RStudio.
3. Install dependencies (if not already installed):
   ```r
   install.packages(c("shiny", "tidyverse"))
   ```
4. (Optional) Unhide Data/ and Report/ folders if you need direct access.

---

## Usage

### To Enter Data

1. Open the file `Shorebird/Scripts/Shorebird_Shiny.rmd` in RStudio.
2. Run the script. This will launch the R Shiny app.

**Background on R Shiny:**  
R Shiny is an R package for building interactive web applications directly from R. It allows users to create web-based dashboards and visualizations.

3. Once you open `Shorebird_Shiny.rmd`, click "Run" as shown below:
   <img width="1095" height="619" alt="image" src="https://github.com/user-attachments/assets/d4909da2-8a91-45be-92cb-9e85007f56b2" />

4. The Shiny app should look like this:
   <img width="890" height="727" alt="image" src="https://github.com/user-attachments/assets/748294bd-9a44-4cee-bc15-f8a048aee8d6" />

5. Enter data (choose date, zone class, species, and data count). Click "Submit" to enter data.
6. Remove any errors by clicking the "Remove Last Entry" button.
7. To download your entered data, press the "Download CSV" button and save with an appropriate name.

---

## Most Up to Date Data

The most up to date data is in `final_shorebird_2011_2024.csv`.  
**Note:** This folder is hidden for now. Please update here with the latest dataset when available.

---

## Troubleshooting

- **Package not found?**  
  Run `install.packages("packagename")` for any missing package.
- **Shiny app not launching?**  
  - Ensure you are running R >= 4.0.
  - Check that all required packages are installed.
  - Make sure you opened the project `.Rproj` file.
- **File permission issues?**  
  Verify that your user account has read/write access to the Data/ and Report/ folders.

---

## Contributing

Contributions are welcome!  
- Fork the repository and create your feature branch.
- Follow R best practices for code style.
- Submit a pull request with a clear description of your changes.
- For bug reports or suggestions, open an issue.

---

## License

This project is licensed under the MIT License.  
See `LICENSE` file for details.

---

## Contact and Support

For questions or support, please open an issue on GitHub or contact the repository owner.

---

## Badges

<!-- You may add badges for build status, license, etc. here in future. -->