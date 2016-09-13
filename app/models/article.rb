class Article
  include Mongoid::Document

  field :title, :type => String
  field :text, :type => String

  attr_accessor :tag_tokens
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags, autosave: true

  attr_reader :tag_tokens

  validates :title, presence:true,
  					length: { minimum: 5 }

  def self.articles_for tag
    Article.any_in(:tags => [tag])
  end

  def tag_tokens=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    found_tags = tag_names.collect { |name| Tag.where(name: name) }
    new_tags = tag_names.collect { |name| Tag.where(name: name).first_or_create }
    self.tags = found_tags.concat new_tags
  end
end
