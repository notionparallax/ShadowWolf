require './app/core.rb'
require 'json'
class Project < Model
  attr_accessor :project_number, :name
  def images
    @_images ||= get :image
  end
  def images_by_tag tag
    (images || []).sort_by do |image|
      tag_name, tag_rank = image.tags_with_rank
           .find { |tag_rank| tag_rank[0] == tag }
      tag_rank || 0
    end.reverse
  end
  def self.from_hash hash
    unless false and hash.nil? or hash.empty?
      hash = hash.first
      p = Project.new
      p.project_number = hash['code'] || hash['project_number']
      p.oa_id = hash['id'] || hash['oa_id']
      p.name = hash['name']
      [p]
    else
      []
    end
  end
  def to_json options=nil
    {
      oa_id: @oa_id,
      project_number: @project_number,
      name: @name
    }.to_json
  end
end
class Image < Model
  attr_accessor :access_level_id, :caption, :copyright_holder_id, :created_at, :description, :filename, :original_filename, :photographer_id, :rank, :user_id
  def self.from_hash hash
    hash.map do |image_hash|
      i = Model.hash_select image_hash, Image.new, [
        {'access_level' => 'access_level_id'},
        'caption',
        {'created' => 'created_at'},
        'description',
        'filename',
        'original_filename',
        'photographer_id',
        'rank',
        'user_id'
      ]
      i.oa_id = image_hash['oa_id'] if i.oa_id.nil?
      i.rank = i.rank.to_i
      i
    end
  end
  def to_json options=nil
    {
      oa_id: @oa_id,
      caption: @caption,
      created_at: @created_at,
      description: @description,
      filename: @filename,
      original_filename: @original_filename,
      rank: @rank,
      tags: tags_with_rank.inject({}) { |sum,a|
        sum[a.first] = a.last
        sum
      }
    }.to_json
  end
  def [] index
    if index == 'square'
      sizes.find_all { |size| size.width == size.height }
           .min(&:width)
    else
      image_size,symbol_size = sizes
        .sort_by { |size| [size.width, size.height] }
        .reject { |size| size == self['square'] }
        .zip([
          :thumbnail,
          :small,
          :web_view,
          :medium
        ])
        .find { |pair| pair.last.to_s == index }
      image_size
    end
  end
  def access_level
    @access_level_id ||= get :access_level
  end
  def copyright_holder
    @copyright_holder_id ||= get :copyright_holder
  end
  def photographer
    @photographer_id ||= get :photographer
  end
  def user
    @user_id ||= get :user
  end
  def sizes
    @_sizes ||= get :size
  end
  def tags
    parse_tags @description
  end
  def tags_with_rank
    parse_tags_with_rank @description
  end
  private
  def parse_tags str
    parse_tags_with_rank( str ).map(&:first)
  end
  def parse_tags_with_rank str
    str.scan( /\[\[([^\]]*)\]\]/ )
      .map do |top|
        top.map do |bot|
          bot.split(',').map(&:strip)
             .map { |tag_text| rank_tag tag_text }
        end
      end.flatten(2).uniq(&:first)
  end
  def rank_tag str
    tag,rank = str.split('-')
    unless rank.nil?
      [tag,rank.to_i]
    else
      [tag,@rank]
    end
  end
end
class Size < Model
  # The documentation on size objects is incomplete. Below is
  # an example of a json result:
  #
  #   {
  #     "cropped": "0",
  #     "width": "1500",
  #     "watermarked": "0",
  #     "relative_path": "Projects/S0910004/S0910004_N214_jpg/S0910004_N214_medium.jpg",
  #     "y_resolution": "72",
  #     "allow_use": 1,
  #     "http_relative_path": "5365c6ad6e3ab4e16cfe34cdb41fe993/0/0/Projects/S0910004/S0910004_N214_jpg/S0910004_N214_medium.jpg",
  #     "id": "8",
  #     "quality": "0",
  #     "unc_root": "//dc2-oa001/",
  #     "colourspace": "RGB",
  #     "height": "1000",
  #     "http_root": "/Images/",
  #     "filesize": "397681",
  #     "x_resolution": "72",
  #     "recreate": "0",
  #     "file_format": "jpg"
  #   }
  #
  attr_accessor :width, :height, :relative_path, :http_relative_path, :http_root, :unc_root
  def self.from_hash hash
    hash.map do |size_hash|
      s = Model.hash_select size_hash, Size.new, %w(
        relative_path
        http_relative_path
        http_root
        unc_root
      )
      s.oa_id = size_hash['oa_id'] if s.oa_id.nil?
      s.width = size_hash['width'].to_i
      s.height = size_hash['height'].to_i
      s
    end
  end
  def to_json options=nil
    {
      oa_id: @oa_id,
      width: @width,
      height: @height,
      relative_path: @relative_path,
      http_relative_path: @http_relative_path,
      http_root: @http_root,
      unc_root: @unc_root,
      url: url
    }.to_json
  end
  def url
    "http://#{ENV['OPEN_ASSET_ENDPOINT']}#{@http_root}#{@relative_path}"
  end
end
