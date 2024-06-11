#load library
library(babynames)
library(ggplot2)
library(dplyr)
library(tidyverse)

#create data for baby names
bb_names <- babynames

# Create a histogram of the name Marie since 1982. anything weird?

ggplot( data = bb_names %>% 
  filter( name == "Mary", year >= "1982"), aes( x = year) ) +
  geom_histogram()

#Create a line plot for proportion of the name Joe, colored by sex. Make the lines a bit thicker and more transparent.

ggplot( data = bb_names %>% filter( name == "Joe"),
        aes( x = year, y = prop, color = sex )) +
  geom_line( alpha = 0.5)

#Add new x and y axis labels, as well as a chart title

ggplot( data = bb_names %>% 
          filter( name == "Joe"),
        aes( x = year, y = prop, color = sex )) +
  geom_line( alpha = 0.5) +
labs( x = "Year",
      y = "Proportion", 
      title = "Proportion of Males named Joe")

#Create a bar chart of all female names in 2002.
#Make the bars transparent and filled with the color blue.
ggplot( data = bb_names %>% 
          filter( sex == "F", year == "2002") %>% 
          arrange( desc( n )) %>% slice_head( n = 10 ),
        aes( x = name, y = n )) +
geom_col( alpha = 0.5, fill = 'blue') 


#Create a new data set called the_nineties that only contains years from the 1990s.
the_nineties <- bb_names %>% 
  filter( year == "1990" )

# Save this dataset to your repository (use write_csv()).
write_csv(the_nineties, 'the_nineties.csv')

# Add, commit, and push your files to GitHub. Check GitHub and make sure that your code successfully pushed.


# In RStudio pull from GitHub. Is it already up to date?


#   Now that everything is up to date, make a visualisation of you and your team member’s names for a year of your choice.
group_names <- bb_names %>% 
  filter( year == "2004" )

ggplot( data = group_names %>% 
          filter( name %in% c( "Cheyenne", "Mason", "Lucy", "Ruth")),
        aes( x = name, y = n)) +
  geom_col() +
  facet_wrap( ~sex )

# Make a visual that looks at your name over time. What happens if you color by sex?
ggplot( data = group_names %>% 
          filter( name %in% c( "Cheyenne", "Mason", "Lucy", "Ruth")),
        aes( x = name, y = n, color = sex )) +
  geom_col() +
  facet_wrap( ~sex )

# Don’t forget to stage/add, commit, and push your hardwork to GitHub!
