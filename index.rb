require 'nokogiri'
require 'open-uri'

require_relative "name_parser"
  
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

  return links_array
end

def scrape_artist(artist)
  url = "https://rateyourmusic.com/artist/#{artist}"
  file = open(url).read
  doc = Nokogiri::HTML(file)

  formed_or_born = doc.search('.info_hdr')[0].text.strip
  artist_type = person_or_band(formed_or_born)
  
  parsed_name = parse_person_name(artist)
  first_name = parsed_name[:first_name] if parsed_name.key?(:first_name)
  
  if artist_type == "Born"
    last_name = parsed_name[:last_name] if parsed_name.key?(:last_name)
  else
    last_name = parsed_name[:last_name] if parsed_name.key?(:last_name)
  end

  japanese_name = parsed_name[:japanese_name] if parsed_name.key?(:japanese_name)

  # place_of_origin = 
  # date_of_birth =
  # date_of_death = 
  # aka =
    
  # return {
  #   first_name: first_name
  #   last_name: last_name
  #   japanese_name: japanese_name
  #   place_of_origin: place_of_origin
  #   date_of_birth: date_of_birth
  #   date_of_death: date_of_birth
  #   aka = aka
  # }
end


# name = doc.search('.recipe-header__title').text.strip

def person_or_band(formed_or_born)
  if formed_or_born == "Born"
    artist_type = "Person"
  else
    artist_type = "Band"
  end

  return artist_type
end