require 'json'

class Model
  # In order to work with DataSource#from_json children classes
  # should be named so that DataSource#to_class correctly 
  # converts a symbol to their class.
  attr_accessor :oa_id
  def data_source ds
    @data_source = ds
    self
  end
  def get sym
    @data_source.get sym => @oa_id
  end
  def self.from_hash hash
    raise NotImplementedError
  end
  def to_json options=nil
    raise NotImplementedError
  end
  protected
  def self.hash_select hash, obj, mapping
    obj.oa_id = hash['id']
    mapping.each do |value|
      if value.class.eql? String
        key,val = value, value
      else
        val,key = value.keys.first, value.values.first
      end
      obj.send "#{key}=", hash[val]
    end
    obj
  end
end

class DataSource
  # Converts a symbol to a class
  def to_class klass_sym
    Kernel.const_get( klass_sym.capitalize )
  end
  # Given a symbol for a class, converts json to that class
  # This requires the class constant to be in the global scope.
  # This could be changed by passing a dictionary of symbols to class to the datasource, if desired.
  def from_json klass_sym, json
    to_class( klass_sym )
      .from_hash( parse_json(json) )
      .map { |result| result.data_source( self ) }
  end

  def parse_json json
    JSON.parse json
  end
  # Use query to get results from respective data source
  def get query
    raise NotImplementedError
  end
end
