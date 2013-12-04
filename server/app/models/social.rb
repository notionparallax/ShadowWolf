class Social
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :person_contact

  field :twitter, type: String
  field :instagram, type: String
  field :github, type: String
  field :pinterest, type: String
  field :google_plus, type: String
  field :linkedin, type: String
  field :facebook, type: String
  field :tumblr, type: String
end
