module Taggable 
  extend ActiveSupport::Concern
  included do
    before_save do |document|
      if document.tags.nil?
        document.tags = []
      end
    end
  end
end
