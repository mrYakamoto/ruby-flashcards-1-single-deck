module View

  def self.welcome_message
    puts "Welcome, let's do some flashcards!"
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

end
