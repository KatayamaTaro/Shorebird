## Shorebird_Data_Entry

The shorebird enter data project hosts a data folder, scripts folder, and R project. Open the Shorebird_Enter_Data.Rproj to access the scripts in the scripts folder.

## To Enter Data: 
Open the Shorebird_Shiny.rmd file. This r script will create an R Shiny once it is run. The R Shiny that helps CABR staff enter Shorebird survey data from data sheets more efficiently. 

Background on R Shiny if you are unfamiliar: R Shiny is an R package that makes it easy to build interactive web applications directly from R. It allows users to create web-based dashboards and visualizations without needing extensive web development skills. In our case, the Shiny application helps the user easily enter the shorebird data, and at the end save the csv file to the data folder. 

once you open the Shorebird_Shiny.rmd, click run shown in image below:
<img width="1095" height="619" alt="image" src="https://github.com/user-attachments/assets/d4909da2-8a91-45be-92cb-9e85007f56b2" />

This should load up the r shiny app, which should look like this. 
<img width="890" height="727" alt="image" src="https://github.com/user-attachments/assets/748294bd-9a44-4cee-bc15-f8a048aee8d6" />

Shiny provides drop down for easy data entry, and spits out a .csv in a readily accessible format for data analysis. Shiny lives in the scripts folder as Shorebird_Shiny. Other scripts are scripts that Biologist used to QA/QC shorebird data from 2011-2024. Data not yet publicly available but will be released on datastore in the future. 
