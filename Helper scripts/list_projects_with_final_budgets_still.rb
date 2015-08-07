def list_projects ps
  ps.map do |p|
    [p.building.legacy.final_budget,
    p,
    p.building.legacy.legacy_budgets.map do |b|
      b.budget unless b.budget.nil?
    end]
  end.reject do |res|
    res.first.nil?
  end.reject do |res|
    res.last.include? res.first.to_i
  end
end
