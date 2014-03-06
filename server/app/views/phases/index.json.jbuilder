json.array!(@phases) do |phase|
  json.partial! "phases/phase.json.jbuilder", phase: phase
end
