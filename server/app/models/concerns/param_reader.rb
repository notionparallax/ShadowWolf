module ParamReader
  def update_from_params project_params
    apply_changes self, project_params
    self.save
  end

  # takes an object and a nested hash containing new values for it and applies
  # the changes to the object (without saving).
  def apply_changes object, changes
    changes.keys.each do |key|
      subobject, subchange = object.send(key), changes[key]
      if changes[key].class == Array
        array_class = object.class.embedded_relations[key].klass
        apply_array_changes object, array_class, subobject, subchange
      elsif changes[key].class == ActionController::Parameters
        apply_changes subobject, subchange
      else
        object.send("#{key}=", changes[key])
      end
    end
  end

  # applies changes to array elements, returning
  def apply_array_changes parent, klass, array, changes
    changes.each do |elem|
      id = elem.class == String ? elem : elem['id']
      if id.nil? # create new klass
        db_elem = klass.create parent.class.to_s.underscore.to_sym => parent
      else # find element in db
        db_elem = array.find(id)
      end
      if elem.class == String # destroy
        db_elem.destroy
      else # update
        apply_changes db_elem, elem.except('id')
      end
    end
  end
end
