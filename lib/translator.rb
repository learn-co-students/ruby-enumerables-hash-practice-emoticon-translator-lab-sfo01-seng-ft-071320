# require modules here

require "yaml"
# require 'pry'

def load_library(file)
  
  emoticon = YAML.load_file(file)

  emoticon.each do |key, value|
    english = value[0]
    japanese = value[1]
    emoticon[key] = {english: english, japanese: japanese}
  end
end


def get_japanese_emoticon(file, emoticon)
  
  emoticons = load_library(file)
  output = emoticons.find do |name, value|
    value[:english] == emoticon
  end
  output ? output[1][:japanese] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  
    emoticons = load_library(file)
    output = emoticons.find do |name, value|
      value[:japanese] == emoticon
    end
    output ? output[0] : "Sorry, that emoticon was not found"
end
