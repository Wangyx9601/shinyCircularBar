<h1><center> Usage and installation of ShinyCircularBar </center></h1>

This is the repository for the Shiny application presented in "ShinyCircularBar": make caircular barplot in R with shiny .


*****
#	Use ShinyCircularBar online

ShinyCircularBar is deployed at  http://150.109.59.144:3838/shinyCircularBar/  for online use.  
ShinyCircularBar is idle until you activate it by accessing the URLs.  
So, it may take some time when you access this URL for the first time.   
Once it was activated, ShinyCircularBar could be used smoothly and easily.

*****

#	Launch ShinyCircularBar directly from R 

User can choose to run ShinyCircularBar installed on local computers (Windows, Mac or Linux) for a more preferable experience.

**Step 1: Install R and RStudio**

Before running the app you will need to have R and RStudio installed (tested with R 3.6.3 and RStudio 1.2.5033).  
Please check CRAN (https://cran.r-project.org/) for the installation of R.  
Please check https://www.rstudio.com/ for the installation of RStudio.  

**Step 2: Install the R Shiny package and other packages required by ShinyCircularBar**

Start an R session using  RStudio and run these lines:  
```
# try an http CRAN mirror if https CRAN mirror doesn't work
install.packages("shiny")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("tidyr")
install.packages("dplyr")
install.packages("readr")
install.packages("shinythemes")
install.packages("shinyBS")
install.packages("RLumShiny")
install.packages("markdown")
install.packages("svglite")
```

**Step 3: Start the app**  

Start an R session using RStudioun these lines:  
```
shiny::runGitHub(", "")  
``` 
*****

#	Deploy ShinyCircularBar on local or web Linux server

**Step 1: Install R**  

Please check CRAN (https://cran.r-project.org/) for the installation of R.

**Step 2: Install the R Shiny package and other packages required by ShinyCircularBar**  

Start an R session and run these lines in R:  
```
# try an http CRAN mirror if https CRAN mirror doesn't work  
install.packages("shiny")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("tidyr")
install.packages("dplyr")
install.packages("readr")
install.packages("shinythemes")
install.packages("shinyBS")
install.packages("RLumShiny")
install.packages("markdown")
install.packages("svglite")
```

For more information, please check the following pages:  
https://cran.r-project.org/web/packages/shiny/index.html  
https://github.com/rstudio/shiny  
https://shiny.rstudio.com/  

**Step 3: Install Shiny-Server**

Please check the following pages for the installation of shiny-server.  
https://www.rstudio.com/products/shiny/download-server/  
https://github.com/rstudio/shiny-server/wiki/Building-Shiny-Server-from-Source  

**Step 4: Upload files of shinyCircularBar**

Put the directory containing the code and data of shinyCircularBar to /srv/shiny-server.  

**Step 5: Configure shiny server (/etc/shiny-server/shiny-server.conf)**

```
# Define the user to spawn R Shiny processes
run_as shiny;

# Define a top-level server which will listen on a port
server {  
  # Use port 3838  
  listen 3838;  
  # Define the location available at the base URL  
  location /shinyCircularBar {  
    # Directory containing the code and data of ShinyCircularBar  
    app_dir /srv/shiny-server/ShinyCircularBar;  
    # Directory to store the log files  
    log_dir /var/log/shiny-server;  
  }  
}  
```

**Step 6: Change the owner of the ShinyCircularBar directory**

```
$ chown -R shiny /srv/shiny-server/ShinyCircularBar  
```

**Step 7: Start Shiny-Server**

```
$ start shiny-server  
```

Now, the shinyCircularBar app is available at https://IPAddressOfTheServer:3838/shinyCircularBar.  


=========
This application is a Circular Barplot tool for person without the basis of R language.

This application was created by Wen Yao, Haoran Li and Yuxuan Wang.
