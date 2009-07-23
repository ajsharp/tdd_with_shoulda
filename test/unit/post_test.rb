require 'test_helper'

class PostTest < ActiveSupport::TestCase
  context "a valid Post" do
    context "shoulda macros" do
      setup do
        Post.create(:title => "Post Title", :body => "...")
      end
      
      should_have_db_columns :title, :body, :permalink
      should_validate_presence_of :title, :body
      should_validate_uniqueness_of :title
    end # end of shoulda macros
    
    context "instance methods" do
      setup do
        @post = Post.create(:title => "New Post Title", :body => "...")        
      end
      
      context "permalink" do
        should "be an underscored version of the post title" do
          assert_equal("new_post_title", @post.permalink)
        end
      end # end of permalink
      
    end # end of instance methods
    
  end
  
end
