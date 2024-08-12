library(usethis)
create_project("Developer/posit/madlibs")
use_git()
use_github()
rsconnect::writeManifest() #eerst file rename naar app.r anders krijg ik een foutmelding. dan weet hij niet welke file?

pak::pak("hadley/useself")
library("useself")
