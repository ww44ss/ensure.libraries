## Ensure Libraries  January 2017
## installs packages from CRAN and Github. 
## the usage is 
##   library(devtools)
##   install_github("ww44ss/ensure.libraries")
##   ensure libraries

ensure.libraries <- function(packages.to.install = "tidyverse", verbose = FALSE) {
    
    pkgs.on.machine <- installed.packages()[,1]
    
    for (pkg in packages.to.install){
        
        cat(pkg, "\n")
        if (!pkg %in% pkgs.on.machine){ 
            ## make sure package on machine
            if(!grepl("/", pkg)) install.packages(pkg, repos = "http://cran.rstudio.com") ## normal install
            if(grepl("/", pkg)) {
                ## devtools install, assumes github repo source
                if (!devtools %in% pkgs.on.machine) install.packages(devtools) ## check for devtools
                library(devtools)
                install.packages(paste0(devtools::install_github(pkg)))
            }
            
        }
        library(pkg, character.only = TRUE)
        
    }
    
}
