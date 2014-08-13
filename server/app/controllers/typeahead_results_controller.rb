class TypeaheadResultsController < ApplicationController
  # Currently doesn't handle permissions.
  # Security for the route depends on an honour based system (i.e. FIXME)
  def fetch
    # class_name and lens are required
    if params[:lens].nil? || params[:class_name].nil?
      return render status: 403, json: { errors: ['Param class_name or lens missing.'] }
    end

    # construct mongo query to get distinct
    klass = params[:class_name].camelize.constantize
    lens = params[:lens].gsub(/\[.*\]/,'')
    possibilities = klass.all.query.select(lens.to_sym => 1).distinct(lens)

    # render as json array
    render json: { possibilities: possibilities }
  end
end
