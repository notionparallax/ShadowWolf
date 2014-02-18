class ReferredBy
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :project_source

  field :BVN_staff_login, type: String
  field :contact_name, type: String
  field :contact_organisation, type: String
end
