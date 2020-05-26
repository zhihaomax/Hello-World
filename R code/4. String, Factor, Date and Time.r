library(tidyverse)

# Note: To include "\" in a string variable, always use "\\", since "\" means escape a point
# Also to see the content of a string vector, use writeLines()
x <- c("\"", "\\")
x
writeLines(x)
# Note: \n means change line and \t means tab, \r means carraige return, \b means backspace
x <- "long \t lines can be \n broken with \r newlines"
writeLines(x)

## get string length
str_length(c("a", "R for data science", NA))

## combine strings (str_c or paste())
str_c("x", "y", "z", sep=",")
x <- c("abc", NA)
str_c("|-", x, "-|")
str_c("|-", str_replace_na(x), "-|")
name <- "Hadley"
time_of_day <- "morning"
birthday <- FALSE

str_c(
  "Good ", time_of_day, " ", name,
  if (birthday) " and HAPPY BIRTHDAY",
  "."
)

# Note: difference between str_c(collapse=..) and str_c(sep="")
x <- c("d","e","f")
str_c(x, "a", sep = "-")
str_c(x, "a", collapse = "-")

## subsetting strings
x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 1) <- str_to_lower(str_sub(x, 1, 1))
x

## sort strings
x <- c("apple", "eggplant", "banana")
str_sort(x, locale = "en")  # English

## trim and expand strings 
x <- "   tea   "
(y <- str_trim(x, side = "both"))
str_pad(y, width = 9, side = "both")

### 2. String Regular Expression
x <- c("apple", "banana", "pear")
str_view(x, "an")
## "." matches any character
str_view(x, ".a.")

# Note: If we want to match ".", need the regexp "\."
str_view(c("abc", "a.c", "bef"), "a\\.c")
# Note: If we want to match "\", need the regexp "\\"
x <- "a\\b"
str_view(x, "\\\\")

## ^ to match the start of the string. $ to match the end of the string.
x <- c("apple", "banana", "pear")
str_view(x, "^a")
str_view(x, "a$")
str_view(x, "^apple$") # this matches the whole string

## select length-3 and >=length-7 words
str_subset(words, "^...$")
str_subset(words, ".......")

## match either letters
str_view(c("grey", "gray"), "gr(e|a)y")
str_view(words, "ing$|ise$") # find the word ending with ing or ise

## match specific rule []
str_view(c("abc", "a.c", "a*c", "a c"), "a[ ]")
# selecr words starting with a vowel
str_subset(words, "^[aeiou]")
str_view(c("abc", "a.c", "a*c", "a c"), ".[*]c")

## operators that control how many times matching 
# ?: 0 or 1
# +: 1 or more
# *: 0 or more
x <- "1888 is the longest year in Roman numerals: MDCLXXXVIII"
str_view(x, "CC?") # match CC twice
str_view(x, 'C[LX]+')

## You can also specify the number of matches precisely:
# {n}: exactly n
# {n,}: n or more
# {,m}: at most m
# {n,m}: between n and m
str_view(x, "C{2}")
str_view(x, "C{2,}")
str_view(x, "C{2,3}")

# Note" You can make them â€œlazyâ€?, matching the shortest string possible by putting a ? after them.
str_view(x, 'C{2,3}?')
str_view(x, 'C[LX]+?')

string2