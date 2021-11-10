# Installing Packages 
install.packages("Rlinkedin")


# From Github
library(devtools)
install_github("mpiccirilli/Rlinkedin")
library(Rlinkedin)

# API Authentication 

in.auth <- inOAuth("RevOps", "Client ID","Client Secret")

#Company Search 

company_info <- searchCompanies(token = in.auth, keywords  = "Jobvite")
class(company_info)
length(company_info)

# Finding list elements 

sapply(company_info, function(x) names(x))[[1]]

# Converting into a dataframe 
data.frame(t(sapply(company_info, function(x){
  x[c("company_name","universal_name","employee_count","num_followers","twitter_handle","description")]
})))