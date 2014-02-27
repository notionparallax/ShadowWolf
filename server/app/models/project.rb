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
    puts project_params
    puts project_params["building"]["phases"].class
    apply_changes self, project_params
    self.save
  end

  private
  # takes an object and a nested hash containing new values for it and applies
  # the changes to the object (without saving).
  def apply_changes object, changes
    puts "Applying changes, #{object.to_s}, #{changes.to_s}"
    changes.keys.each do |key|
      subobject, subchange = object.send(key), changes[key]
      puts "Key: #{key}, #{changes[key].class.to_s}"
      if changes[key].class == Array
        puts "array path"
        array_class = object.class.embedded_relations[key].klass
        apply_array_changes object, array_class, subobject, subchange
      elsif changes[key].class == ActionController::Parameters
        puts "hash path"
        apply_changes subobject, subchange
      else
        puts "prop path"
        object.send("#{key}=", changes[key])
      end
    end
  end

  # applies changes to array elements, returning
  def apply_array_changes parent, klass, array, changes
    puts "Appling array changes, #{parent.to_s}, #{klass.to_s}, #{changes.to_s}"
    changes.each do |elem|
      id = elem.class == String ? elem : elem['id']
      puts "Elem: #{elem.to_s}, id: #{id.to_s}"
      if id.nil? # create new klass
        db_elem = klass.create parent.class.to_s.underscore.to_sym => parent
        puts "Creating new object of class #{klass.to_s}, id: #{db_elem.id}, persited: #{db_elem.persisted?}"
        puts db_elem
      else # find element in db
        db_elem = array.find(id)
      end
      if elem.class == String # destroy
        puts "Destroying element"
        db_elem.destroy
      else # update
        puts "updating element"
        apply_changes db_elem, elem.except('id')
      end
    end
  end
end
