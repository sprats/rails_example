class Tag
  include Mongoid::Document

  field :name, :type => String

  attr_accessor :tag_tokens
  has_and_belongs_to_many :articles, autosave: true

end
