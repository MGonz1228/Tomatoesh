#Author: Matthew Gonzalez
#returns Rotten Tomatoes score of input movie with optional year


grabRotten()
{
	movie=$1
	commandLineYear=$2
	#convert "input movie title" to "input_movie_title" for future URL
	movieurl=${movie//' '/_} 

	#check if year entered, then create URL accordingly
	if [ -z "$commandLineYear" ]
	then
		urlToGrab="http://www.omdbapi.com/?t=$movieurl&apikey=f11650f1"
	else
		movieurl=${movieurl::-5}
		urlToGrab="http://www.omdbapi.com/?t=$movieurl&y=$commandLineYear&apikey=f11650f1"	
	fi

	#grab URL, extract Title and Year
	finalURL=$(curl -s $urlToGrab)
	titleAndYear=$(echo $finalURL | grep -E -o '"Title":".*"Year":"[0-9]{4}"')
	title=$(echo $titleAndYear | grep -E -o '"Title":"[^"]+"' | grep -E -o ':"[^"]+"' | grep -E -o '[^:"]+')
	year=$(echo $titleAndYear | grep -E -o '"Year".*' | grep -E -o '[0-9]{4}')

	#check if movie was found
	if [ -z "$title" ]
	then
		echo "Movie not found!"
#		exit 1
	else
		#echo "Movie found!"

		echo -e "Title:\t"$title
		echo -e "Year:\t"$year

		#grab Rotten Tomatoes score
		criticScore=$(echo $finalURL | grep -E -o 'Rotten Tomatoes","Value":"[0-9]{0,3}%' | grep -E -o '[0-9]{0,3}%')

		#check if critic score found, if so change color and print accordingly
		if [ -z "$criticScore" ]
		then
			echo "No Critic Score found"
		else
			criticScoreInteger=${criticScore::-1}
			if [ "$criticScoreInteger" -lt 60 ]
			then
				echo -e "Score:\t\e[92m$criticScore"
			else
				echo -e "Score:\t\e[91m$criticScore"
			fi
		fi


	fi
}

#grab movie and year from command line arguments
if [ $1 == "-m" ]
then
#	echo "-m picked up."
	movies=${@:2}
	IFS=',' read -ra movieArray <<< "$movies"
	for movie in "${movieArray[@]}"
	do
		if [ "${movie:0:1}" == " " ]
		then
			movie="${movie:1}"
		fi
	
		movieYear=$(echo $movie | grep -oE '[0-9]{4}$')
		grabRotten "$movie" "$movieYear"
		echo -e "\e[39m"
#		echo $movie $movieYear
	done
else	
	movie=$@
	commandLineYear=${!#}
	commandLineYear=$(echo $commandLineYear | grep -E -o '[0-9]{4}')
	grabRotten "$movie" "$commandLineYear"
	
fi

