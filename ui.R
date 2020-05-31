shinyUI(
  navbarPage(
  title="circularbar barplot",
  theme=shinytheme("journal"),
  windowTitle="make circularbar barplot in R with shiny",
  
  tabPanel("ShinyCircularBar",
    sidebarPanel(
      fileInput("data", h4("Choose data",bsButton("bs0", label="", icon=icon("question"), style="info", size="small"))
                ,multiple = FALSE),
      bsPopover("bs0", "单击“Browse”上传数据，数据集应该包含两列，第一列为名称，第二列为值", trigger = "focus"),
          h4("Plot options"),
          textInput("circularbarplotTitle", h4("Plot Title:",
                                     bsButton("bs1",label = "",icon = icon("question"),style = "info",size = "small")
                                     ),value = c("circular barplot")),
          bsPopover("bs1","修改图片标题。",trigger = "focus"),
      h4("Choose fill color:",
         bsButton("bs2", label="", icon=icon("question"), style="info", size="small")
      ),
      bsPopover("bs2", '对数据进行绘图时，填充环状柱形图的颜色，且用户可根据自己喜好更改颜色。', trigger = "focus"),
      fluidRow(column(12, jscolorInput("var1", label = NULL, value = "#2B8CED"))),
      
      h4("Choose name color:",
         bsButton("bs3", label="", icon=icon("question"), style="info", size="small")
      ),
      bsPopover("bs3", '对数据进行绘图时，数据名称的颜色，用户可根据自己的喜好进行调色。', trigger = "focus"),
      fluidRow(column(12, jscolorInput("var2", label = NULL, value = "#0A0608")))
      ,
      sliderInput("var3", h4("Font size:"),
                  min = 0, max = 10,
                  value = 3.5,step = 0.5),
      numericInput("var4",h4("Title font:",
         bsButton("bs4", label="", icon=icon("question"), style="info", size="small")
      ),value = 18),
      bsPopover("bs4", '对数据标题字体大小进行更改，从而使得更加方便阅读。', trigger = "focus"),
      
      checkboxInput("cirBarSize", "Adjust plot size", FALSE),
      conditionalPanel(
        condition = "input.cirBarSize",
        numericInput("cirBarHeight", "Plot height:", value = 700),
        numericInput("cirBarWidth", "Plot width:", value = 750)),
      
      actionButton("submit1", strong("Go!"))),
    mainPanel(
      downloadButton("downloadggplot.pdf", "Download pdf-file"),
      downloadButton("downloadggplot.svg", "Download svg-file"),
      plotOutput("ggplot", width = "80%", height = "800px")
    )
  ),
  tabPanel("Usage and installation", includeMarkdown("README.md")),  
  tabPanel("Application instruction", includeMarkdown("Application_instruction.md")),
  tabPanel("About",includeMarkdown("About.md"))
  )
)
