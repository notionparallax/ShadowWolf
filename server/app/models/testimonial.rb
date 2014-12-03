class Testimonial
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :legacy

  field :testimonial, type: String
  field :date, type: Date
  field :citation, type: String
  field :tags, type: Array, default: []

  before_save do |document|
    puts 'zomg'
    if document.tags.nil?
      puts 'zomg nil'
      document.tags = []
    end
  end
end
