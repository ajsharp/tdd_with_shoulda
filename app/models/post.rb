class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  validates_uniqueness_of :title

  before_save :generate_permalink
  
  protected
    def generate_permalink
      #attributes[:permalink] = title.gsub(" ", "_").downcase
      write_attribute(:permalink, title.gsub(" ", "_").downcase)
    end
end
