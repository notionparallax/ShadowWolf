require 'rest-client'
require 'sinatra/base'

class OAF < Sinatra::Base
  def render status, body
    [status, body]
  end

  get '/:project_number/:tag/:index/:size' do
    project_number = params['project_number']
    @project = 
      settings.data_source.get( project:  project_number )
    if @project.nil?
      return render( 404, "No project found with project number: \"#{project_number}\"." )
    end
    @project = @project.first
    images = @project.images_by_tag params['tag']
    begin
      index = Integer(params['index'])
      raise Exception if index < 0
    rescue Exception
      return render( 400, 'Image index must be positive integer (-1 provided).' )
    end
    if images.empty?
      return render( 404, 'No images found with tag: "' + params['tag'] + '".' )
    end
    image  = images[index]
    if image.nil?
      return render( 404, "No image at index: #{index.to_s}." )
    end
    if not %w(square thumbnail small web_view medium).include? params['size']
      return render( 400, 'Size must be one of: square, thumbnail, small, web_view, medium.' )
    end
    image_size = image[params['size']]
    if image_size.nil?
      return render( 404, 'The requested size was not available.' )
    end

    [303,{ 'Location' => image_size.url }, nil] # your image is in another castle
  end

  get '/:project_number.json' do
    headers "Content-Type" => 'application/json'
    project_number = params['project_number']
    @project = settings.data_source.get project:  project_number
    if @project.nil?
      render 404, '{}'
    else
      render 200, @project.to_json
    end
  end
end
