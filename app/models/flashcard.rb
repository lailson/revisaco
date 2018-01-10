class Flashcard < ActiveRecord::Base
	validates :front, presence: true
	validates :back, presence: true
	belongs_to :deck
	before_create :default_values

private
	def default_values
      self.due ||= Time.now
      self.interval ||= 0
      self.ease_factor ||= 2.6
      self.last_review ||= Time.now
    end
end
