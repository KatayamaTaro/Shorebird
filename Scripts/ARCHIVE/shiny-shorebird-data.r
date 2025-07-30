library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("Shorebird Data Entry"),
  
  sidebarLayout(
    sidebarPanel(
      dateInput("date", "Survey Date:", value = Sys.Date(), format = "mm/dd/yyyy"),
      
      selectInput("zone", "Zone Class:",
                  choices = c("Select Zone", "I", "II", "III", "III Boulders", "III Rocky Outcrop")),
      
      selectInput("dataType", "Species:",
                  choices = c("Select Species", "Great Blue Heron", "Great Egret", "Snowy Egret", "People", "Dogs on Leash", "Brown Pelican", "Cormorant", "Black-Bellied Plover", "Willet", "Wandering Tattler", "Spotted Sandpiper", "Marbled Godwit", "Whimbrel", "Ruddy Turnstone", "Black Turnstone", "Surfbird", "Sanderling", "Juvenile Gull", "Western Gull", "California Gull", "Heerman's Gull", "Herring Gull", "Tern", "Unidentified Gull", "Unidentified Bird (non-gull)", "Black Phoebe", "Say's Phoebe")),
      
      numericInput("dataCount", "Data Count:", value = 1, min = 1),
      
      actionButton("submit", "Submit"),
      actionButton("removeLast", "Remove Last Entry"),
      downloadButton("downloadData", "Download CSV")
    ),
    
    mainPanel(
      textOutput("status"),
      h4("Last 5 Entries:"),
      tableOutput("recentDataTable"),  # Display the most recent 5 entries
      hr(),
      h4("All Recorded Data:"),
      tableOutput("dataTable")  # Display all submitted data
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  
  # Reactive value to store data
  data <- reactiveVal(data.frame(SurveyDate = character(),
                                  ZoneClass = factor(levels = c("I", "II", "III", "III Boulders", "III Rocky Outcrop")),
                                  DataType = character(),
                                  DataCount = numeric(),
                                  stringsAsFactors = FALSE))
  
  # Reactive value to store the last selected zone
  lastZone <- reactiveVal("Select Zone")
  
  observeEvent(input$submit, {
    # Create a new row of data with formatted date
    new_data <- data.frame(SurveyDate = format(input$date, "%m/%d/%Y"),
                            ZoneClass = factor(input$zone, levels = c("I", "II", "III", "III Boulders", "III Rocky Outcrop")),
                            DataType = input$dataType,
                            DataCount = input$dataCount,
                            stringsAsFactors = FALSE)
    
    # Append new data to existing data
    updated_data <- rbind(data(), new_data)
    data(updated_data)
    
    # Update last selected zone
    lastZone(input$zone)
    
    # Update status message
    output$status <- renderText("Data submitted successfully!")
    
    # Reset other inputs
    updateSelectInput(session, "dataType", selected = "Select Species")
    updateNumericInput(session, "dataCount", value = 1)
    
    # Set the zone input to the last selected zone
    updateSelectInput(session, "zone", selected = lastZone())
  })
  
  # Remove the last entry
  observeEvent(input$removeLast, {
    current_data <- data()
    if (nrow(current_data) > 0) {
      # Remove the last row
      updated_data <- current_data[-nrow(current_data), ]
      data(updated_data)
      output$status <- renderText("Last entry removed successfully!")
      
      # Update lastZone to the new last entry's zone if there are still entries
      if (nrow(updated_data) > 0) {
        lastZone(updated_data$ZoneClass[nrow(updated_data)])
      } else {
        lastZone("Select Zone")  # Reset if no entries are left
      }
    } else {
      output$status <- renderText("No entries to remove.")
    }
  })
  
  # Display the most recent 5 entries in a table
  output$recentDataTable <- renderTable({
    current_data <- data()
    if (nrow(current_data) > 0) {
      # Get the indices for the most recent 5 entries (or fewer if less than 5 entries exist)
      start_idx <- max(1, nrow(current_data) - 4)
      recent_data <- current_data[start_idx:nrow(current_data), ]
      # Reverse the order to show the most recent at the top
      recent_data <- recent_data[nrow(recent_data):1, ]
      return(recent_data)
    } else {
      return(data.frame(Message = "No data entered yet"))
    }
  }, rownames = FALSE)  # Don't include row names for the recent entries
  
  # Display all submitted data in a table
  output$dataTable <- renderTable({
    data()
  }, rownames = TRUE)  # Include row names for the full history
  
  # Download handler for CSV
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("shorebird_data_", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      # Specify the path where the CSV will be saved
      write.csv(data(), file, row.names = FALSE)
    }
  )
}

# Run the application 
shinyApp(ui = ui, server = server)
