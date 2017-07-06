
## This script looks for the "Rprofile.site" file
## This is a file that is similar to ~/.Rprofile,
## but is system-wide
## Here we are adding the `/rpkgs` directory to the `.libPaths()`

## See the rpkgs docker volume and the rpkgs docker container



## Information about RProfile.site and .Rprofile
## reference: https://csgillespie.github.io/efficientR/3-3-r-startup.html
## Excerpt from reference

# 3.3.1 The .Rprofile file

# By default R looks for and runs .Rprofile files in the three locations described above, in a specific order. .Rprofile files are simply R scripts that run each time R runs and they can be found within R_HOME, HOME and the project’s home directory, found with getwd(). To check if you have a site-wide .Rprofile, which will run for all users on start-up, run:

# site_path = R.home(component = "home")
# fname = file.path(site_path, "etc", "Rprofile.site")
# file.exists(fname)

# The above code checks for the presence of Rprofile.site in that directory. As outlined above, the .Rprofile located in your home directory is user-specific. Again, we can test whether this file exists using

# file.exists("~/.Rprofile")

# We can use R to create and edit .Rprofile (warning: do not overwrite your previous .Rprofile - we suggest you try project-specific .Rprofile first):

# if(!file.exists("~/.Rprofile")) # only create if not already there
#   file.create("~/.Rprofile")    # (don't overwrite it)
# file.edit("~/.Rprofile")


site_path = R.home(component = "home")
fname = file.path(site_path, "etc", "Rprofile.site")

if (file.exists(fname)) {
    print(sprintf('RProfile.site exists here: %s', fname))

    write("\n", file = fname, append = TRUE)
    write("\n", file = fname, append = TRUE)

    write("#", file = fname, append = TRUE)
    write("#", file = fname, append = TRUE)
    write("# Somebody set up us the bomb", file = fname, append = TRUE)
    write("#", file = fname, append = TRUE)
    write("#", file = fname, append = TRUE)

    write(".libPaths('/rpkgs')", file = fname, append = TRUE)

    write("#", file = fname, append = TRUE)
    write("#", file = fname, append = TRUE)
    write("#", file = fname, append = TRUE)
    write("#", file = fname, append = TRUE)
    write("#", file = fname, append = TRUE)

    write("\n", file = fname, append = TRUE)
    write("\n", file = fname, append = TRUE)
    
    write("# set a CRAN mirror", file = fname, append = TRUE)
    write('local({r <- getOption("repos") r["CRAN"] <- "https://cloud.r-project.org/" options(repos=r)})"', file = fname, append = TRUE)

} else {
    stop("All your base are belong to us: no Rprofile.site found.")
}