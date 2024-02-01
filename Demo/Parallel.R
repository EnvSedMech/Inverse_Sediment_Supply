### Run Multiple scripts in parallel

## List of R scripts to run in parallel
script_files <- list.files(path = "D:/CSDMS/Demo", pattern = "Num", full.names = TRUE)
# OR

## Specify the exact files: Used to run a subset
#script_files <- c("Num_1.R", "Num_2.R")

## Running scripts:
## For the Elwha case study: 20 scripts were run in parallel
library(parallel)
num_cores <- detectCores()  # Use all available cores
run_script <- function(script_path) {
  source(script_path)
}
cl <- makeCluster(num_cores)
clusterExport(cl, c("run_script"))  # Export the function to the cluster

parLapply(cl, script_files, run_script)

stopCluster(cl)
