module MusicsHelper
  # Checks if a number is odd:


  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def musicpic(singer)
    path = "/images/"
    pic = ["Alan Walker", "Alexandra Kay", "Avril Lavigne", "Beethoven", "Bizet", "Bruce Springsteen", "Charles Brown", "Charley Patton", "Don Henley", "Eagles", "Ella Fitzgerald", "Frank Sinatra", "J.S. Bach", "Louis Armstrong", "Maroon 5", "Miles Davis", "Monteverdi", "Morgan Wallen", "Mozart", "Muddy Waters", "Otis Rush", "Taylor Swift", "Troye Sivan"]

    if pic.include?(singer)
      picname = singer+".jpg"
    else
      picname = "music_icon.png"
    end
    return path + picname
  end
end
