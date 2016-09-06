class Article
  include Mongoid::Document
  field :title, type: String
  field :text, type: String
  has_many :comments
  validates :title, presence:true,
  					length: { minimum: 5 }
end