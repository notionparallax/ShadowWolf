module ParamReader
  def update_from_params project_params
    apply_changes self, project_params
    self.save
  end

  # takes an object and a nested hash containing new values for it and applies
  # the changes to the object (without saving).
  def apply_changes object, changes
    changes.keys.each do |key|
      next if key == 'id'
      subobject, subchange = object.send(key), changes[key]
      if changes[key].class == Array
        relation = object.class.embedded_relations[key]
        if relation
          array_class = relation.klass
          apply_array_changes object, array_class, subobject, subchange, key
        else # it's an array of values to set
          object.send("#{key}=", changes[key] || [])
        end
      elsif changes[key].class.ancestors.include? ActiveSupport::HashWithIndifferentAccess
        apply_changes subobject, subchange
      else
        if not object.fields[key].nil? and object.fields[key].type == Array
          object.send("#{key}=", changes[key] || [])
        else
          object.send("#{key}=", changes[key])
        end
      end
    end
  end

  # applies changes to array elements, returning
  def apply_array_changes parent, klass, array, changes, key
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
    # check array is in same order as in changes
    changes_ids,array_ids = [changes,array].map { |a| a.map { |b| b[:id] } }
    if changes_ids.length == array_ids.length and not changes_ids.eql? array_ids
      new_array = changes_ids.reject(&:nil?).map { |id| array.find id }
      parent.send("#{key}=", new_array)
    end
  end
end
