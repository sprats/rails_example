class Comment
  include Mongoid::Document
  field :name, :type => String
  field :body, :type => String
  belongs_to :article
end
