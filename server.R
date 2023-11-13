# 6.) SERVER -------------------------------------------------------------------
# Read in the RF model
model <- readRDS("model.rds")

shinyServer(function(input, output, session) {
  
  # Input Data
  datasetInput <- reactive({  
    
    # outlook,temperature,humidity,windy,play
    df <- data.frame(
      Name = c("Age",
               "BusinessTravel",
               "DailyRate",
               "Department",
               "DistanceFromHome",
               "Education",
               "EducationField",
               "EnvironmentSatisfaction",
               "Gender",
               "HourlyRate",
               "JobInvolvement",
               "JobLevel",
               "JobRole",
               "JobSatisfaction",
               "MaritalStatus",
               "MonthlyRate",
               "NumCompaniesWorked",
               "OverTime",
               "PercentSalaryHike",
               "PerformanceRating",
               "RelationshipSatisfaction",
               "StockOptionLevel",
               "TotalWorkingYears",
               "TrainingTimesLastYear",
               "WorkLifeBalance",
               "YearsAtCompany",
               "YearsInCurrentRole",
               "YearsSinceLastPromotion",
               "YearsWithCurrManager"),
      Value = as.character(c(input$Age,
                             input$BusinessTravel,
                             input$DailyRate,
                             input$Department,
                             input$DistanceFromHome,
                             input$Education,
                             input$EducationField,
                             input$EnvironmentSatisfaction,
                             input$Gender,
                             input$HourlyRate,
                             input$JobInvolvement,
                             input$JobLevel,
                             input$JobRole,
                             input$JobSatisfaction,
                             input$MaritalStatus,
                             input$MonthlyRate,
                             input$NumCompaniesWorked,
                             input$OverTime,
                             input$PercentSalaryHike,
                             input$PerformanceRating,
                             input$RelationshipSatisfaction,
                             input$StockOptionLevel,
                             input$TotalWorkingYears,
                             input$TrainingTimesLastYear,
                             input$WorkLifeBalance,
                             input$YearsAtCompany,
                             input$YearsInCurrentRole,
                             input$YearsSinceLastPromotion,
                             input$YearsWithCurrManager)),
      stringsAsFactors = FALSE)
    
    Attrition <- "Attrition"
    df <- rbind(df, Attrition)
    input <- transpose(df)
    write.table(input,"input.csv", sep=",", quote = FALSE, row.names = FALSE, col.names = FALSE)
    
    test <- read.csv(paste("input", ".csv", sep=""), header = TRUE)
    
    test$BusinessTravel <- factor(test$BusinessTravel, levels = c("Travel_Rarely", "Travel_Frequently", "Non-Travel"))
    test$Department <- factor(test$Department, levels = c("Human Resources", "Research & Development", "Sales"))
    test$Education <- factor(test$Education, levels = c("Below College", "College", "Bachelor", "Master", "Doctor"))
    test$EducationField <- factor(test$EducationField, levels = c("Human Resources", "Life Sciences", "Marketing", "Medical", "Technical Degree", "Other"))
    test$EnvironmentSatisfaction <- factor(test$EnvironmentSatisfaction, levels = c("Low", "Medium", "High", "Very High"))
    test$Gender <- factor(test$Gender, levels = c("Female", "Male"))
    test$JobInvolvement <- factor(test$JobInvolvement, levels = c("Low", "Medium", "High", "Very High")) 
    test$JobLevel <- factor(test$JobLevel, levels = c("1", "2", "3", "4", "5")) 
    test$JobRole <- factor(test$JobRole, levels = c("Sales Executive", "Sales Representative", "Research Scientist", "Laboratory Technician", "Manufacturing Director", "Healthcare Representative", "Manager", "Research Director", "Human Resources"))
    test$JobSatisfaction <- factor(test$JobSatisfaction, levels = c("Low", "Medium", "High", "Very High")) 
    test$MaritalStatus <- factor(test$MaritalStatus, levels = c("Divorced", "Married", "Single"))
    test$OverTime <- factor(test$OverTime, levels = c("No", "Yes"))
    test$PerformanceRating <- factor(test$PerformanceRating, levels = c("Excellent", "Outstanding"))
    test$RelationshipSatisfaction <- factor(test$RelationshipSatisfaction, levels = c("Low", "Medium", "High", "Very High")) 
    test$StockOptionLevel <- factor(test$StockOptionLevel, levels = c("0", "1", "2", "3")) 
    test$WorkLifeBalance <- factor(test$WorkLifeBalance, levels = c("Bad", "Better", "Good", "Best")) 
    
    ?data.frame
    Output <- data.frame(Prediction=predict(model,test), round(predict(model,test,type="prob"), 4))
    print(Output)
    
  })
  
  # Status/Output Text Box
  output$contents <- renderPrint({
    if (input$submitbutton>0) { 
      isolate("Calculos completos.") 
    } else {
      return("El servidor esta listo para los calculos.")
    }
  })
  
  # Prediction results table
  output$tabledata <- renderTable({
    if (input$submitbutton>0) { 
      isolate(datasetInput()) 
    } 
  })
  
})
