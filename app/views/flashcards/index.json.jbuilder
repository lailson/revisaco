json.array!(@flashcards) do |flashcard|
  json.extract! flashcard, :id, :front, :back, :due, :interval, :ease_factor, :last_review
  json.url flashcard_url(flashcard, format: :json)
end
