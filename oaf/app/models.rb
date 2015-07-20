require './app/core.rb'
require 'json'
class Project < Model
  attr_accessor :project_number, :name
  def images
    @_images ||= get :image
  end
  def self.from_hash hash
    p = Project.new
    p.project_number = hash['code']
    p.oa_id = hash['id']
    p.name = hash['name']
    p
  end
  def to_json options=nil
    {
      oa_id: @oa_id,
      project_number: @project_number,
      name: @name,
      images: @images
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
      },
      sizes: sizes
    }.to_json
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
  attr_accessor :url
  def self.from_hash hash
    hash.map { |size_hash| s = Size.new; s.oa_id = size_hash['id']; s }
  end
end
