class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :building

  accepts_nested_attributes_for :building

  embeds_one :non_building

  accepts_nested_attributes_for :non_building
  field :project_number, type: String

  def update_from_params project_params
    puts "LEEEEEEEEEEEEEEERRRRROY JEEEEEEEEEEEEENNNNNNNNNNNNNNNKIIINS"
    process_object self, project_params
    self.save
  end

  private
  # takes an object and a nested hash containing new values for it and applies
  # the changes to the object (without saving).
  def process_object current_object, new_object
    # if it's an object it applies any changes necessary and calls
    #   process_object on its sub objects
    if new_object.class == Hash
      new_object.keys.each do |key|
        process_object current_object.send(key), new_object[key]
      end
    # if it's an array it adds any new objects and calls process_object on the rest
    elsif new_object.class == Array
      new_object.each do |sub_object|
        if sub_object.empty?
        end
        process_object current_object, sub_object
      end
    # if it's a property it applies appropriate changes
    else
      current_object.send("#{key}=", new_object)
    end
  end
end
