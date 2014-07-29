# ---------------------------------------------------------------------------- #
# R source code for main analysis in Creating Scrutiny Indicators: A Change 
# Point Exploration of Congressional Scrutiny of the US Federal Reserve
# Christopher Gandrud and Kevin Young
# 29 July 2014
# Using R v 3.1.1
# MIT License
# ---------------------------------------------------------------------------- #

# --------------------------------- Set Up ----------------------------------- #
# Set working directory. Change as needed
setwd('/git_repositories/FedChangePointNote/paper/')

# Load packages
Pkgs <- c("repmis", "dplyr", "ecp", "gridExtra", "ggplot2", "reshape2")
repmis::LoadandCite(Pkgs)

# Load e.divGG function
source('source/e.divGG.R')

# Load data
SenateMonth <- read.csv("data/SenateFullHearings.csv",
                        stringsAsFactors = FALSE)
HouseMonth <- read.csv("data/HouseFullHearings.csv", 
                       stringsAsFactors = FALSE)

# -------------------------- Change Point Analysis --------------------------- #
# House Scrutiny Change Point
ScrutVarsHouse <- c("SumFedHouse", "FedAttend", "FedLetter", "FedLaughterHouse")
FedTitles <- c("Hearing Frequency", "Attendance", 
               "Letter Corrrespondence", "Laughter")
e.divGG(data = HouseMonth, Vars = ScrutVarsHouse, TimeVar = "MonthYear", 
        sig.lvl = 0.05, R = 999, min.size = 24, Titles = FedTitles)