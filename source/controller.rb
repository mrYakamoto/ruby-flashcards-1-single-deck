require_relative 'model'
require_relative 'view'


View.welcome_message
deck_txt_file_path = View.ask_for_deck
View.lets_play

my_deck = Flashcards::Deck.new(Flashcards::ParseOurTxt.parse_text(deck_txt_file_path))

until my_deck.cards.all?{|card|card.is_solved == :solved} do

  current_card = my_deck.find_next_unsolved_card
  View.display_definition(current_card)
  user_answer = View.get_answer

  while !current_card.is_card_solved?
    status = current_card.check_answer(user_answer)
    case status
    when :skip
      my_deck.move_card_to_end
      break
    when :correct
      View.display_correct
    when :incorrect
      View.display_incorrect
      View.display_definition(current_card)
      user_answer = View.get_answer
    end
  end

end



