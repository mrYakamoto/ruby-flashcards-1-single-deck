module Flashcards

  class Card
    attr_accessor :term, :definition, :is_solved

    def initialize(definition, term)
      @term = term
      @definition = definition
      @is_solved = :unsolved
    end

    def solve_answer
      @is_solved = :solved
    end

    def check_answer(answer)
      case answer
      when @term
        solve_answer
        :correct
      when "skip"
        :skip
      when "exit"
        abort("Seeya Later!")
      else
        :incorrect
      end
    end

    def is_card_solved?
      return true if @is_solved == :solved
      false
    end

  end

  class Deck
    attr_accessor :cards

    def initialize(nested_array_card_info)
      @cards = nested_array_to_array_of_card_objects(nested_array_card_info)
      @current_card = 0
    end

    def nested_array_to_array_of_card_objects(nested_array)
      nested_array.map! do |card_info|
        Card.new(card_info[0],card_info[1])
      end
    end

    def find_next_unsolved_card
      @cards.find{ |card| card.is_solved == :unsolved }
    end

    def move_card_to_end
      @cards.push(@cards.delete(find_next_unsolved_card))
    end
  end


  module ParseOurTxt

    def self.parse_text(filename)
      holder = self.txt_to_array(filename)
      self.array_to_nested_array(holder)
    end

    def self.txt_to_array(filename)
      file_info_arr = []
      File.open(filename, 'r') do |f|
        f.each_line do |line|
          file_info_arr << line.chomp
        end
        file_info_arr
      end
    end

    def self.array_to_nested_array(array)
      remove_blank_spaces(array)
      nested_array = []
      nested_array << array.slice!(0..1) until array.length == 0
      nested_array
    end

    def self.remove_blank_spaces(array)
      array.delete("")
    end
  end

end


