#function to calculate gpa
gpa_calculator <- function(subjects_list){
  #vector to store grades
  grades_vector <- c() 
  #vector to store gpas
  gpa_vector <- c()
  #vector to store weighted grade
  weight_grade <- c()
  #vector to store credit
  credit_vec <- c()
  #vector to store subject name
  sub_vec <- c()
  #vector to store points
  points_vec <- c()
  
  #checking if input is a list 
  if(is.list(subjects_list) == FALSE || length(subjects_list) <= 0){
    return("Invalid Input. Input must be a valid list!")
  }
  
  #for loop iterating over the list 
  for (i in 1:length(subjects_list)) {
    if (!is.vector(subjects_list[[i]])) { 
      #checking if subjects are in the form of a vector
      return("Invalid Input. Input must have a vector inside the list!")
    }
    else if (length(subjects_list[[i]]) != 3) { 
      #checking if list has vectors of length 3
      return(paste("Missing information for Subject ", i))
    }
    else if (!is.character((subjects_list[[i]][1]))){ 
      # checking if subject name is a string
      return("Subject Name should be a string")
    }else if(!is.numeric(as.integer(subjects_list[[i]][2])) && (as.integer(subjects_list[[i]][2])>=0 && as.integer(subjects_list[[i]][2]) <=12)){ 
      # checking if credits are a number and between 0 and 12
      return("Credits should be a valid number")
    }else if(!is.numeric(as.integer(subjects_list[[i]][3]))) { 
      # checking if points are a number
      return("Points should be a number")
    }
  }
  
  #this runs if no errors
  #assigning grades and individual gpa based on points
  for(i in 1:length(subjects_list)){
    if(as.numeric(subjects_list[[i]][3]) >= 93 && as.numeric(subjects_list[[i]][3]) <= 100){
      grade <- "A"
      gpa <- 4
    }else if(as.numeric(subjects_list[[i]][3]) >= 90 && as.numeric(subjects_list[[i]][3]) <= 92){
      grade <- "A-"
      gpa <- 3.67
    }else if(as.numeric(subjects_list[[i]][3]) >= 87 && as.numeric(subjects_list[[i]][3]) <= 89){
      grade <- "B+"
      gpa <- 3.33
    }else if(as.numeric(subjects_list[[i]][3]) >= 83 && as.numeric(subjects_list[[i]][3]) <= 86){
      grade <- "B"
      gpa <- 3
    }else if(as.numeric(subjects_list[[i]][3]) >= 80 && as.numeric(subjects_list[[i]][3]) <= 82){
      grade <- "B-"
      gpa <- 2.67
    }else if(as.numeric(subjects_list[[i]][3]) >= 77 && as.numeric(subjects_list[[i]][3]) <= 79){
      grade <- "C+"
      gpa <- 2.33
    }else if(as.numeric(subjects_list[[i]][3]) >= 73 && as.numeric(subjects_list[[i]][3]) <= 76){
      grade<- "C"
      gpa <- 2
    }else if(as.numeric(subjects_list[[i]][3]) >= 70 && as.numeric(subjects_list[[i]][3]) <= 72){
      grade <- "C-"
      gpa <- 1.67
    }else if(as.numeric(subjects_list[[i]][3]) >= 60 && as.numeric(subjects_list[[i]][3]) <= 69){
      grade <- "D"
      gpa <- 1.33
    }else if(as.numeric(subjects_list[[i]][3]) >= 0 && as.numeric(subjects_list[[i]][3]) <60){
      grade <- "F"
      gpa <- 0
    }else{
      return("Invalid. Try with different scores")
    }
    #saving grades to a vector
    grades_vector <- c(grades_vector, grade)
    #saving individual gpa to a vector
    gpa_vector <- c(gpa_vector, gpa)
    #saving credits to a vector
    credit_vec <- c(credit_vec, as.numeric(subjects_list[[i]][2]))
    #weighted grade = credit * gpa 
    #saving weighted grade to a vector
    weight_grade <- c(weight_grade, (gpa*credit_vec[i]))
    #saving subjects to a vector
    sub_vec <- c(sub_vec, subjects_list[[i]][1])
    #saving points to a vector
    points_vec <- c(points_vec, as.numeric(subjects_list[[i]][3]))
  }
  
  #adding all weighted grades
  sum_weight_grade <- sum(weight_grade)
  #adding all credits
  sum_credit_vec <- sum(credit_vec)
  #calculating gpa
  #gpa = sum of weighted grade/sum of credits
  gpa_final <- round((sum_weight_grade/sum_credit_vec), 2)   
  #saving everything in a dataframe
  owls <- data.frame("Subject" = sub_vec,
                     "Credits" = credit_vec,
                     "Points" =  points_vec,
                     "Grade" = grades_vector)
  
  #making a plot of credits vs individual GPA 
  colors <- rainbow(length(subjects_list))
  #made x and y between (0,15) and (0,10) to fit legend
  plot(credit_vec, gpa_vector, main = "Credits vs. GPA", xlab = "Credits", ylab = "GPA", pch = 18, col = colors, xlim = c(0, 15), ylim = c(0, 10.0))
  legend("topright", legend = sub_vec, fill = colors, bty = "n", inset = 0)
  
  #returning dataframe of marksheet and gpa in form of a list
  return(list(Marksheet = owls, GPA = gpa_final))
}

#test cases that fail
#1
# missing value in a vector 
hermione <- gpa_calculator(list(c("Muggle Studies", 3, 95), c("Astronomy", 92), c("Herbology", 2, 95), c("Ancient Runes", 3, 85)))
hermione

#2
# name of subject is a number
ron <- gpa_calculator(list(c("History of Magic", 3, 95), c("Arithmancy", 4, 92), c(45, 2, 95)))
ron

#test cases that pass
#3
harry<- gpa_calculator(list(c("Charms", 5, 42), c("Divination", 10, 73), c("Potions", 0, 18)))
harry

#4
luna <- gpa_calculator(list(c("Defense against the Dark Arts", 3, 95), c("Care of Magical Creatures", 4, 75), c("Herbology", 8, 77), c("Divination", 11, 67)))
luna


