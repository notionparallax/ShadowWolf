json.array!(@quality_assurances) do |qa|
  json.partial! "quality_assurances/quality_assurance.json.jbuilder", quality_assurance: quality_assurance
end
