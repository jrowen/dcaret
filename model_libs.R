# creates model list for docker file
load(system.file("models/models.RData", package = "caret"))
cat(paste("   ",sort(unique(unlist(lapply(models, "[[", "library")))), "\\"),sep="\n")
