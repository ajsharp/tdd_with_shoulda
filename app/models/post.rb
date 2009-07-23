class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  
  def permalink
    title.gsub(" ", "_").downcase
  end
end
