# Tomatoes
Bash script that uses OMDb API to get the Rotten Tomatoes critic score of input movie(s).

![](usage.gif)

# Syntax:
### One movie:
```rt TITLE YEAR(optional)```

### Multiple movies:
```rt -m TITLE YEAR(optional), TITLE YEAR(optional), ...``` 
*Currently only supports movies.*  

  
The spaces between commas and subsequent titles are optional.

# Note:
### Titles do not have to be exact:  
```rt return of the king```  
Returns the score of "The Lord of the Rings: Return of the King"  
  
### Handling ambiguity:
```rt the lion king```  
Returns the score of "The Lion King (1994)" instead of the 2019 version.  
In these cases, you should specify a year.

