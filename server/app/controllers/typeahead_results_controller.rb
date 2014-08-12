class TypeaheadResultsController < ApplicationController
  # Currently doesn't handle permissions.
  # Security for the route depends on an honour based system (i.e. FIXME)
  def fetch
    # clean params into sequence of class names
    # construct mongo query to get distinct
    # render as json array
    render json: { possibilities: [] }
  end
end
