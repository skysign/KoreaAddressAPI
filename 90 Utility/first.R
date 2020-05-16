# Overview
# Test script for pull request
# Character Vectors

# We often work with data that are categorical. To create a vector of text elements—**strings** in programming terms—we must place the text in quotes:

string.vector <- c("Atlantic", "Pacific", "Arctic")
string.vector

# Categorical data can also be stored as a **factor**, which has an underlying numeric representation. Models will convert factors to dummies.<sup>1</sup>

factor.vector <- factor(string.vector)
factor.vector
