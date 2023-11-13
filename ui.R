# 5.) USER INTERFACE -----------------------------------------------------------
library(shiny)


ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage("Ascend Consulting Group:",
                           tabPanel("Inicio",
                # Page title
                titlePanel('¿El colaborador se irá o se quedará en la empresa?'),
                
                # Párrafo adicional con tamaño de letra aumentado
                p("¡Bienvenido! Utiliza los controles deslizantes y las opciones para ingresar los datos del colaborador.",
                  style = "font-size: 18px;"),  # Ajusta el tamaño de letra según sea necesario
                
                # Input values
                sidebarPanel(
                  HTML("<h3>Ingrese los Datos:</h3>"),
                  
                  numericInput("Age", label = "Edad:",
                              value = 36),
                  
                  selectInput("BusinessTravel", label = "Realiza Viajes de Negocios:", 
                              choices = list("No" = "Non-Travel", "Rara Vez" = "Travel_Rarely", "Frecuentemente" = "Travel_Frequently" ), 
                              selected = "No"),
                  
                  sliderInput("DailyRate", label = "Tarifa Diaria:",
                              min = 100, max = 1500,
                              value = 800),
                  
                  selectInput("Department", label = "Departamento en el que labora:", 
                              choices = list("RRHH" = "Human Resources", "R&D" = "Research & Development", "Ventas" = "Sales"), 
                              selected = "R&D"),
                  
                  numericInput("DistanceFromHome", "Distancia de la casa al trabajo:",
                              value = 7),
                  
                  selectInput("Education", label = "Nivel Educativo:", 
                              choices = list("Abajo de Universidad" = "Below College", "Universidad" = "College", "Licenciatura" = "Bachelor", "Máster" = "Master", "PhD" = "Dcotor"), 
                              selected = "Licenciatura"),
                  
                  selectInput("EducationField", label = "Ámbito Educativo:", 
                              choices = list("Recursos Humanos" = "Human Resources", "Ciencias de la Vida" = "Life Sciences", "Mercadeo" = "Marketing", "Medicina" = "Medical", "Grado Técnico" = "Technical Degree", "Otro" = "Other"), 
                              selected = "Ciencias de la Vida"),
                  
                  selectInput("EnvironmentSatisfaction", label = "Satisfación del empleado con la cultura:", 
                              choices = list("Bajo" = "Low", "Medio" = "Medium", "Alto" = "High", "Mut Alto" = "Very High"), 
                              selected = "Alto"),
                  
                  selectInput("Gender", label = "Sexo:", 
                              choices = list("Mujer" = "Female", "Hombre" = "Male"), 
                              selected = "Hombre"),
                  
                  sliderInput("HourlyRate", label = "Tarifa por Hora:",
                              min = 30, max = 100,
                              value = 66),
                  
                  selectInput("JobInvolvement", label = "Grado de Involucramiento en el Trabajo:", 
                              choices = list("Bajo" = "Low", "Medio" = "Medium", "Alto" = "High", "Mut Alto" = "Very High"), 
                              selected = "Alto"),
                  
                  selectInput("JobLevel", label = "Nivel del Trabajo:", 
                              choices = list("1" = "1", "2" = "2", "3" = "3", "4" = "4","5" = "5"), 
                              selected = "1"),
                  
                  
                  selectInput("JobRole", label = "Rol:", 
                              choices = list("Ejecutivo de Ventas" = "Sales Executive", "Representante de Ventas" = "Sales Representative", "Investigación Cientifica" = "Research Scientist", "Técnico de Laboratorio" = "Laboratory Technician", "Dirección de Manufactura" = "Manufacturing Director", "Representante de Cuidado" = "Healthcare Representative", "Research Director" = "Research Director", "Gerente" = "Manager", "Recursos Humanos" = "Human Resources"), 
                              selected = "Ejecutivo de Ventas"),
                  
                  selectInput("JobSatisfaction", label = "Satisfacción con el Trabajo:", 
                              choices = list("Bajo" = "Low", "Medio" = "Medium", "Alto" = "High", "Mut Alto" = "Very High"), 
                              selected = "Alto"),
                  
                  selectInput("MaritalStatus", label = "Status Marital:", 
                              choices = list("Divorciado" = "Divorced", "Casado" = "Married", "Soltero" = "Single"), 
                              selected = "Casado"),
                  
                  sliderInput("MonthlyRate", label = "Tarifa Mensual:",
                              min = 2094, max = 26999,
                              value = 14236),
                  
                  numericInput("NumCompaniesWorked", "Número de Empresas en las que ha Trabajado:",
                              value = 2),
                  
                  selectInput("OverTime", label = "Ha Trabajado Tiempo Extra:", 
                              choices = list("No" = "No", "Si" = "Yes"), 
                              selected = "No"), 
                  
                  numericInput("PercentSalaryHike", "Porcentaje de Incremento Salarial en el Ultimo Año:",
                              value = 14),
                  
                  selectInput("PerformanceRating", label = "Calificación de Desempeño:", 
                              choices = list("Excelente" = "Excellent","Sobresaliente" = "Outstanding"), 
                              selected = "Excelente"), 
                  
                  selectInput("RelationshipSatisfaction", label = "Satisfacción en las Relaciones Laborales:", 
                              choices = list("Bajo" = "Low", "Medio" = "Medium", "Alto" = "High", "Mut Alto" = "Very High"), 
                              selected = "Alto"),
                  
                  selectInput("StockOptionLevel", label = "Opción a Tenencia de Acciones:", 
                              choices = list("No" = "0", "Nivel 1" = "1", "Nivel 2" = "2", "Nivel 3" = "3"), 
                              selected = "No"),
                  
                  numericInput("TotalWorkingYears", "Años Trabajando:",
                              value = 10),
                  
                  numericInput("TrainingTimesLastYear", "Cantidad de Capacitaciones Recibidas el Ultimo Año:",
                              value = 3),
                  
                  selectInput("WorkLifeBalance", label = "Balance de Vida:", 
                              choices = list("Malo" = "Bad", "Mejor" = "Better", "Bueno" = "Good", "Excelente" = "Best"), 
                              selected = "Mejor"),
                  
                  numericInput("YearsAtCompany", "Años Trabajando para la Compañia:",
                              value = 5),
                  
                  numericInput("YearsInCurrentRole", "Años en el Puesto Actual:",
                              value = 3),
                  
                  
                  numericInput("YearsSinceLastPromotion", "Años desde la Ultima vez que fue Promovido:",
                              value = 1),  
                  
                  numericInput("YearsWithCurrManager", "Años con el Jefe Actual:",
                              value = 3),  
                  
                  actionButton("submitbutton", "Submit", class = "btn btn-primary")
                ),
                
                mainPanel(
                  # Agregar una imagen
                  tags$label(h3('Status/Output')), # Status/Output Text Box
                  verbatimTextOutput('contents'),
                  tableOutput('tabledata'), # Prediction results table
                  
                  tabPanel("About", 
                           titlePanel("Acerca de:"), 
                           div(includeMarkdown("about.md"), 
                               align="justify"),
                  
                  # Nuevo apartado para mostrar el autor
                  fluidRow(
                    column(12, align = "center",
                           tags$p("Programa Elaborado Por: Ing. Erick Chacón, MAIT y MAF Candidate", style = "font-style: italic; color: #666;")),
                    column(12, align = "center",
                           tags$p("Ascend Consulting Group", style = "font-style: italic; color: #666;"))
          )
        )
      )
    )
  )
)

