# require modules here
require 'pry'
require 'yaml'

def load_library(file_name)
  emoticons = YAML.load(File.read(file_name))
  
  emote_hash = {}

  emoticons.each do |key,value|
    emote_hash[key] = {}
    emote_hash[key][:english] = value[0]
    emote_hash[key][:japanese] = value[1]
  end

  emote_hash
end

def get_japanese_emoticon(file_name,emote)
 library = load_library(file_name)
 emote = library.keys.find do |key|
    library[key][:english] == emote
  end
  emote ? library[emote][:japanese] : "Sorry, that emoticon was not found"
end


def get_english_meaning(file_name, emote)
  library = load_library(file_name)
  emote = library.keys.find do |key|
    library[key][:japanese] == emote
  end
  emote ? emote : "Sorry, that emoticon was not found"
end

#{
   #"angel" => [ "O:)", "☜(⌒▽⌒)☞" ],
   #"angry" => [ ">:(", "ヽ(ｏ`皿′ｏ)ﾉ" ],
   #"bored" => [ ":O", "(ΘεΘ;)" ],
   #"confused" => [ "%)", "(゜.゜)" ],
   #"embarrassed" => [ ":$", "(#^.^#)" ],
   #"fish" => [ "><>", ">゜))))彡" ],
   #"glasses" => [ "8D", "(^0_0^)" ],
   #"grinning" => [ "=D", "(￣ー￣)" ],
   #"happy" => [ ":)", "(＾ｖ＾)" ],
   #"kiss" => [ ":*", "(*^3^)/~☆" ],
   #"sad" => [ ":'(", "(Ｔ▽Ｔ)" ],
   #"surprised" => [ ":o", "o_O" ],
   #"wink" => [ ";)", "(^_-)" ]
#}