require 'nokogiri'
require 'open-uri'
  
# def fetch_artists
#   page_number = 1
#   url = "https://rateyourmusic.com/customchart?page=#{page_number}&chart_type=top&type=album&year=alltime&genre_include=1&include_child_genres=1&genres=&include_child_genres_chk=1&include=both&origin_countries=japan&limit=none&countries="
#   file = open(url).read
#   doc = Nokogiri::HTML(file)

#   artists = doc.search('.chart_detail_line1 a').first(5)
  
#   artists_array = []

#   artists.each do |artist|
#     artist_array << artist.text.strip      
#   end

#   p links_array
# end

# fetch_recipes

# def scrape_recipes(artist)
#   url = "https://rateyourmusic.com/artist/#{artist}"
#   file = open(url).read
#   doc = Nokogiri::HTML(file)

#   first_name = 
#   last_name = 
#   japanese_name = 
#   place_of_origin = 
#   date_of_birth =
#   date_of_death = 
#   aka =
    
#   return {
#     first_name: first_name
#     last_name: last_name
#     japanese_name: japanese_name
#     place_of_origin: place_of_origin
#     date_of_birth: date_of_birth
#     date_of_death: date_of_birth
#     aka = aka
#   }
# end

# name = doc.search('.recipe-header__title').text.strip


fetched_artists = ["Fishmans", "Boris", "山岡晃 [Akira Yamaoka]", "Boris", "Boredoms"]


def parse_name(artist)
  if artist.include? "["
    parse_traditional_japanese(artist)
  elsif artist.downcase.start_with?('the ') || artist.downcase.start_with?('a ')  || artist.downcase.start_with?('an ')
    parse_article(artist)
  elsif artist.include?(" ") == false
    last_name = artist
  end
end

def parse_traditional_japanese(artist)
  japanese_english_array = artist.split('[')
  japanese_name = japanese_english_array[0]
  if japanese_english_array[1].include? " "
    english_array = japanese_english_array[1].split(" ")
    first_name = english_array[0]
    last_name = english_array[1].chomp("]")
  else 
    last_name = japanese_english_array[1].chomp("]")
  end
end

def parse_article(artist)
  artist_array = artist.split(' ', 2)
  first_name = artist_array[0]
  last_name = artist_array[1]
end

fetched_artists.each do |artist|
  parse_name(artist)
end