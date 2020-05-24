def parse_person_name(artist)
  name_hash = Hash.new
  
  if artist.include? "["
    return parse_traditional_japanese(artist)
  elsif artist.downcase.start_with?('the ') || artist.downcase.start_with?('a ')  || artist.downcase.start_with?('an ')
    return parse_article(artist)
  elsif artist.include?(" ") == false
    name_hash[:last_name] = artist
  end
  
  return name_hash
end

def parse_band_name(artist)
  name_hash = Hash.new
  
  if artist.include? "["
    return parse_japanese_band(artist)
  elsif artist.downcase.start_with?('the ') || artist.downcase.start_with?('a ')  || artist.downcase.start_with?('an ')
    return parse_article(artist)
  else
    name_hash[:last_name] = artist
  end
  
  return name_hash
end
  
def parse_traditional_japanese(artist)
  name_hash = Hash.new
  
  japanese_english_array = artist.split('[')
  name_hash[:japanese_name] = japanese_english_array[0]
  
  if japanese_english_array[1].include? " "
    english_array = japanese_english_array[1].split(" ")
    name_hash[:first_name] = english_array[0]
    name_hash[:last_name] = english_array[1].chomp("]")
  else 
    name_hash[:last_name] = japanese_english_array[1].chomp("]")
  end
  
  return name_hash
end

def parse_japanese_band(artist)
  name_hash = Hash.new
  
  japanese_english_array = artist.split('[')
  name_hash[:japanese_name] = japanese_english_array[0]
  
  if japanese_english_array[1].downcase.start_with?('the ') || japanese_english_array[1].downcase.start_with?('a ')  || japanese_english_array[1].downcase.start_with?('an ')
    name_hash[:first_name] = parse_article(japanese_english_array[1])[:first_name]
    name_hash[:last_name] = parse_article(japanese_english_array[1])[:last_name]
  else 
    name_hash[:last_name] = japanese_english_array[1].chomp("]")
  end
  
  return name_hash
end
  
def parse_article(artist)
  name_hash = Hash.new
  
  artist_array = artist.split(' ', 2)
  
  name_hash[:first_name] = artist_array[0]
  name_hash[:last_name] = artist_array[1]
  
  return name_hash
end


fetched_artists = ["Fishmans", "Melt Banana", "山岡晃 [Akira Yamaoka]", "The Seatbelts", "Boredoms", "山岡晃 [The Spring Hold]"]

fetched_artists.each do |artist|
  p parse_band_name(artist)
end