##Author : Lovenish

#Functions in R 

#1 Numeric Functions 

x <- 9
y <- 3.457
#1.1 Absolute  function
abs(x)

#1.2 Square root
sqrt(x)

#1.3 Celining function
ceiling(y)

#1.4 floor function
floor(y)

#1.5 truncae function
trunc(y)

#1.6 rounding function
round(y, digits = 2)

#1.7 signif
signif(y, digits = 2)

#1.8 sin, cos, tan, log, log10, exp 
sin(x)
cos(x)
tan(x)
log(x)
log10(x)
exp(x)


#2. Character functions

z <- "This is the new beginnings"

#2.1  Extract or replace substrings in a character vector.
substr(z, start=2, stop=4)

#2.2 Search for pattern in z. If fixed =FALSE then pattern is a regular expression.
#If fixed=TRUE then pattern is a text string. Returns matching indices.
grep("new", z , ignore.case=FALSE, fixed=FALSE)


#2.3 Find pattern in z and replace with replacement text. 
#If fixed=FALSE then pattern is a regular expression.
#If fixed = T then pattern is a text string.
sub("new", "fresh", z, ignore.case =FALSE, fixed=FALSE)

#2.4 Split the elements of character vector z at split.
strsplit(z, " ")

#2.5 Concatenate strings after using sep string to seperate them.
paste("crazy", z)

#2.6 UpperCase nd LowerCase
toupper(z)
tolower(z)
