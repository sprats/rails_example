class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :text, :type => String
  field :tags, :type => Array, default: []

  has_many :comments, dependent: :destroy
  validates :title, presence:true,
  					length: { minimum: 5 }

  def tags_list=(arg)
    self.tags = arg.split(',').map{ |v| v.strip }
  end

  def tags_list
    self.tags.join(', ')
  end

  def self.articles_for_tag
    Article.any_in(:tags => [tag])
  end

end
