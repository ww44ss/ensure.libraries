#' Ensure that package libraries are installed and available.
#'
#' Loads and attaches add-on packages. If the package is not present locally 
#' the package is installed from the CRAN repo. This is useful in making code run 
#' after new R installation or upon transfer to other machines.
#'
#' @param packages.to.install - a vector containing names of packages to install
#' @param verbose - a TRUE/FALSE value for verbose operation
#' @return messages from library installs
#' @keywords packages
#' @examples
#' ## simple installation of add-on packages
#' ##
#' ## require devtools to install package. 
#' 
#'  
#' library(devtools)
#' install_github("ww44ss/ensure.libraries")
#' library(ensure.libraries)
#' 
#' packages <- c("tidyverse",
#'               "ggplot2",
#'               "stringr",
#'               "ww44ss/yo"
#'               )
#' 
#' ensure.libraries(packages)
#' 
#' ## can also use shorter form
#' ensure(packages)
#'
#'## end (not run)

#' @export
ensure.libraries <- function(packages.to.install = "tidyverse", verbose = FALSE) {
    ## ensure.libraries ensures packages have been downloaded and are installed. 
    ## requires: devtools
    
    
    ## inventory of already installed add-on packages
    pkgs.on.machine <- installed.packages()[,1] 

    for (pkg.long in packages.to.install){
        
        pkg <- gsub(".*\\/", "", pkg.long)
        
        if (verbose == TRUE) cat(pkg, "\n")
        if (!pkg %in% pkgs.on.machine){ 
            ## make sure package on machine
            if(!grepl("/", pkg.long)) install.packages(pkg, repos = "http://cran.rstudio.com") ## normal install
            ## if a "/" present in package name, assume it is a development install.
            if(grepl("/", pkg.long)) {
                ## devtools install, assumes github repo source
                if (!devtools %in% pkgs.on.machine) install.packages(devtools) ## check for devtools
                library(devtools)
                install.packages(devtools::install_github(pkg.long))
            }
            
        }
        library(pkg, character.only = TRUE)
        
    }
    
}


#' Ensure that package libraries are installed and available.
#'
#' Loads and attaches add-on packages. If the package is not present locally 
#' the package is installed from the CRAN repo. This is useful in making code run 
#' after new R installation or upon transfer to other machines.
#'
#' @param packages.to.install - a vector containing names of add-on packages to install
#' @param verbose - a TRUE/FALSE value for verbose operation
#' @return messages from library installs
#' @keywords packages
#' @examples
#' ## simple installation of packages
#' ##
#' ## note that devtools needed to install package from github
#'  
#' library(devtools).
#' install_github("ww44ss/ensure.libraries")
#' library(ensure.libraries)
#' 
#' packages <- c("tidyverse",
#'               "ggplot2",
#'               "stringr",
#'               "ww44ss/yo"
#'               )
#' 
#' ensure(packages)
#' ## end (not run)

#' @export
ensure <- function(packages.to.install = "tidyverse", verbose = FALSE) {
    ## shorter name
    ensure.libraries(packages.to.install, verbose)
}
    
    
