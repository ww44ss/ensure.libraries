#' ensure package libraries are installed and available.
#'
#' ensure.library installs libraries and also checks for installed packages
#' and installs them if not already locally available. 
#'
#' @param packages.to.install - a vector containing names of packages to install
#' @param verbose - a TRUE/FALSE value for verbose operation
#' @return messages from library installs
#' @keywords packages
#' @examples
#' ## simple installation of packages
#' ##
#' ## require devtools to install package. 
#' ## then create a vector containing the names of needed packages. 
#'  
#' library(devtools)
#' github_install("ww44ss/ensure.libraries")
#' 
#' packages.needed <- c( 
#'                              "tidyverse",
#'                              "gglot2",
#'                              "stringr",
#'                              "ww44ss/yo"
#'                            )
#' 
#' ensure.libraries(packages.needed)
#' 
#' ## can also use shorter form
#' ensure(libraries.needed)
#'

#' @export
ensure.libraries <- function(packages.to.install = "tidyverse", verbose = FALSE) {
    ## ensure.libraries ensures packages have been downloaded and are installed. 
    ## requires: devtools
    
    pkgs.on.machine <- installed.packages()[,1] # inventory of what is on machine already

    for (pkg in packages.to.install){
        
        if (verbose == TRUE) cat(pkg, "\n")
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


#' ensure installs librarys and also checks for installed packages
#' and installs them if not already locally available. 
#'
#' @param packages.to.install - a vector containing names of packages to install
#' @param verbose - a TRUE/FALSE value for verbose operation
#' @return messages from library installs
#' @keywords packages
#' @examples
#' ## simple installation of packages
#' ##
#' ## require devtools to install package. 
#' ## then create a vector containing the names of needed packages. 
#'  
#' library(devtools)
#' github_install("ww44ss/ensure.libraries")
#' 
#' packages.needed <- c( 
#'                              "tidyverse",
#'                              "gglot2",
#'                              "stringr",
#'                              "ww44ss/yo"
#'                            )
#' 
#' ensure.libraries(packages.needed)
#' 
#' ## can also use shorter form
#' ensure(libraries.needed)
#'

#' @export
ensure <- function(packages.to.install = "tidyverse", verbose = FALSE) {
    ## shorter name
    ensure.libraries(packages.to.install, verbose)
}
    
    
