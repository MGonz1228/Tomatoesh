# Tomatoes
Bash script that uses OMDb API to get the Rotten Tomatoes critic score of input movie(s).

![](usage.gif)

# Syntax:
### One movie:
```rt TITLE YEAR(optional)```

### Multiple movies:
```rt -m TITLE YEAR(optional), TITLE YEAR(optional), ...```  
  
The spaces between commas and subsequent titles are optional.

# Note:
Only one title is returned per input, but titles do not have to be exact:  
```rt return of the king```  
Returns the score of "The Lord of the Rings: Return of the King"  
   
However, this also allows room for some ambiguity.  
```rt the lion king```  
Returns the score of the 1994 version of "The Lion King"  
In this case, you should specify a year.

