Shorebird_access_wrangling.Rmd- R Script that takes the raw shorebird data drawn from access and minimally processes it for shorebird data from 2011-2024. It takes any duplicate values out and formats the date correctly.

Shorebird_Shiny.Rmd- an app that allows you to enter shorebird data easily and save the entered csv file to a data folder. Just open the file and hit run!
On the app, "Survey Date:" refers to the date that the survey was taken. "Zone Class" refers to various zones of the survey. "Species" is the species in question. "Data Count" refers to the count of the species. Hit submit to enter data. Remove Last Entry data removes the last entry. When you are done entering data, hit download CSV to save the file. I recommend entering data for each individual year. 

Shorebird_Wrangling.Rmd- Creates a final processed dataset that includes all the corrections. Note some of the files that the script calls for is missing. 

Shorebird_Analysis.Rmd- Takes the full shorebird dataset, preps data for analysis and generates a few basic analysis/plots. 
