def find_bad_units prj
  for eachDim in prj.building.dims
    if eachDim.measurement.nil?
    #Do nothing
    elsif eachDim.unit.nil?
      puts prj.project_number + " - has blank Unit"
    elsif eachDim.unit.exclude? 'm'
      puts prj.project_number + " units = " + eachDim.unit
    elsif eachDim.unit.include? '2'
      puts prj.project_number + " units = " + eachDim.unit
    end
  end
end

def change_hectares_to_ha prj
	for eachDim in prj.building.dims
		if eachDim.unit.nil?
			# Do nothing
		elsif eachDim.unit == 'ha'
			# Do nothing
		elsif eachDim.unit.upcase == 'HA'
			eachDim.unit = 'ha'
			puts prj.project_number + " - " + eachDim.unit
			eachDim.save
		elsif eachDim.unit.include? 'Hectares'
			eachDim.unit = 'ha'
			puts prj.project_number + " - " + eachDim.unit
			eachDim.save
		end
	end
end