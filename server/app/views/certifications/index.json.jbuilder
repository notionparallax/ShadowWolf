json.array!(@certifications) do |certification|
  json.partial! "certifications/certification.json.jbuilder", certification: certification
end
