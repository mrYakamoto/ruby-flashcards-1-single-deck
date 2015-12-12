module View

  def self.welcome_message
    puts "Welcome, let's do some flashcards!"
  end

  def self.lets_play
    puts "\nLet's play!!\n'skip' = skip flashcard\n'exit' = quits game\n"
  end

  def self.display_definition(card)
    puts "\nDefinition - "
    puts "#{card.definition}\n\n"
  end

  def self.get_answer
    gets.chomp
  end

  def self.display_correct
    puts "Correct!"
  end

  def self.display_incorrect
    puts "Incorrect, guess again"
  end

  def self.ask_for_deck
    puts "What's the filepath for your deck?"
    View.get_answer
  end

end
