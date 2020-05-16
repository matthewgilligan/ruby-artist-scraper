require 'nokogiri'
require 'open-uri'
  
def fetch_artists
  page_number = 1
  url = "https://rateyourmusic.com/customchart?page=#{page_number}&chart_type=top&type=album&year=alltime&genre_include=1&include_child_genres=1&genres=&include_child_genres_chk=1&include=both&origin_countries=japan&limit=none&countries="
  file = open(url).read
  doc = Nokogiri::HTML(file)

  artists = doc.search('.chart_detail_line1 a').first(5)
  
  artists_array = []

  artists.each do |artist|
    artist_array << artist.text.strip      
  end

  p links_array
end

fetch_recipes

def scrape_recipes(artist)
  url = "https://rateyourmusic.com/artist/#{artist}"
  file = open(url).read
  doc = Nokogiri::HTML(file)

  first_name = 
  last_name = 
  japanese_name = 
  place_of_origin = 
  date_of_birth =
  date_of_death = 
  aka =
    
  return {
    first_name: first_name
    last_name: last_name
    japanese_name: japanese_name
    place_of_origin: place_of_origin
    date_of_birth: date_of_birth
    date_of_death: date_of_birth
    aka = aka
  }
end

# name = doc.search('.recipe-header__title').text.strip