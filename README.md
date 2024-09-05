# Hogwarts GPA Calculator
Welcome to the Hogwarts GPA Calculator project! This tool is designed to help wizarding students at Hogwarts School of Witchcraft and Wizardry calculate their Grade Point Average (GPA) based on the grades and credits they receive in their O.W.Ls. It provides not only a calculated GPA but also a detailed marksheet and a visual representation of academic progress.

<img src="https://github.com/user-attachments/assets/22c83159-57dc-41e4-9005-65a655081ed9" alt="OWLS marksheet" width="350"/>
<img src="https://github.com/user-attachments/assets/f7bfe3e4-07c2-4255-87ac-4c8dfb8e5243" alt="Hogwarts" width="350"/>

## Project Overview
The GPA Calculator is a function implemented in R that:
- Takes a list of subjects with their corresponding credits and points.
- Validates the input to ensure it meets specific criteria.
- Calculates the GPA based on the given points and credits.
- Generates a marksheet and a scatter plot of credits against individual GPA.

## Function Description
gpa_calculator(subjects_list)

**Parameters**

subjects_list: A list of vectors where each vector contains:
1. Subject Name (String)
2. Credits for that subject (Numeric between 0 and 12)
3. Points for the subject (Numeric between 0 and 100)
   
**Output**

Marksheets: A data frame containing:
1. Subject Name
2. Credits
3. Points achieved
4. Grades achieved

GPA: The calculated Grade Point Average of the student, rounded to 2 decimal places.

Plot: A scatter plot showing the relationship between credits and individual GPA, with each subject represented in a different color.

**Algorithm**

-Input Validation:

Checks if the input is a list and contains vectors of length 3.

Validates that the subject name is a string, credits are between 0 and 12, and points are numeric.

-Grade and GPA Calculation:

Assigns grades and individual GPA based on points.

Calculates weighted GPA and final GPA.

-Data Representation:

Creates a dataframe for the marksheet.

Plots credits vs. individual GPA with color-coded subjects.

-Return:

Returns a list containing the dataframe (marksheet) and GPA.

## Usage
**Calling the function**
- Example input list

subjects_list <- list(c("Charms", 5, 42), c("Divination", 10, 73), c("Potions", 0, 18))

- Calculate GPA
  
result <- gpa_calculator(subjects_list)

- View the marksheet

print(result$Marksheet)

- View the GPA

print(result$GPA)

**Test Cases**
1. Failing Cases:
- Missing value in a vector:

hermione <- gpa_calculator(list(c("Muggle Studies", 3, 95), c("Astronomy", 92), c("Herbology", 2, 95), c("Ancient Runes", 3, 85)))

print(hermione)

- Subject name is a number:

ron <- gpa_calculator(list(c("History of Magic", 3, 95), c("Arithmancy", 4, 92), c(45, 2, 95)))

print(ron)

2. Passing Cases:
- Valid inputs:
harry <- gpa_calculator(list(c("Charms", 5, 42), c("Divination", 10, 73), c("Potions", 0, 18)))

print(harry)

luna <- gpa_calculator(list(c("Defense against the Dark Arts", 3, 95), c("Care of Magical Creatures", 4, 75), c("Herbology", 8, 77), c("Divination", 11, 67)))

print(luna)

## Conclusion
The Hogwarts GPA Calculator is a valuable tool for students to track and evaluate their academic performance. It not only computes the GPA but also provides a detailed marksheet and visual representation of their progress.
