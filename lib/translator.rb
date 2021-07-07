# require modules hereemo
require "yaml"

def load_library(file)
  emojis = YAML.load_file(file)
  dictionary = {}
  emojis.each do |meaning, pic_array|
    filler = {:english => pic_array[0], :japanese => pic_array[1]}
    dictionary[meaning] = filler
  end
  dictionary
end

def get_japanese_emoticon(file, eng_emoji)
  dictionary =load_library(file)
  entry = dictionary.select {|meanings, emoji_hash| emoji_hash[:english] == eng_emoji}
  jap_emoji = nil
  entry.each do |meanings, emoji_hash|
    if entry[meanings][:japanese]
      jap_emoji = entry[meanings][:japanese]
    end 
  end 
  if jap_emoji == nil
    jap_emoji = "Sorry, that emoticon was not found"
  end 
  jap_emoji
end 
  

def get_english_meaning (file, jap_emoji)
  dictionary = load_library(file)
  entry = dictionary.select {|meanings, emoji_hash| emoji_hash[:japanese] == jap_emoji}
  if entry.keys[0]
    eng_meaning = entry.keys[0]
  else
    eng_meaning = "Sorry, that emoticon was not found"
  end 
  eng_meaning
end
