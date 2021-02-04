# Tomatoesh
Bash script that uses OMDb API to get the Rotten Tomatoes critic score of input movie(s).

(Not so) fun fact: I wrote this a few years ago, before I understood JSON. I parsed the response with grep instead!

![](usage.gif)

# Syntax:
### One movie:
```./rt.sh TITLE YEAR(optional)```

### Multiple movies:
```./rt.sh -m TITLE YEAR(optional), TITLE YEAR(optional), ...``` 
  
The spaces between commas and subsequent titles are optional.  

# Note:
### Titles do not have to be exact:  
```./rt.sh return of the king```  
Returns the score of "The Lord of the Rings: The Return of the King"  
  
### Handling ambiguity:
```./rt.sh the lion king```  
Returns the score of "The Lion King (1994)" instead of the 2019 version.  
In these cases, you should specify a year.

```./rt.sh the lion king 2019```

