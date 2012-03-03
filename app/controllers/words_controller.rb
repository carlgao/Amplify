class WordsController < ApplicationController
  def get_word
  #respond_to :js
    words = Wordnik.words.search_words(:query => 'in*', :min_dictionary_count => 6)
    render :partial => get_word
    #respond_with(words)
  end

end
