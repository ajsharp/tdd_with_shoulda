require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  context "public actions" do
    setup do
      Post.create(:title => "Post", :body => "...")
    end
    
    context "GET index /posts" do
      setup do
        get :index
      end

      should "assign to @posts an array of Post models" do
        assert_instance_of(Array, assigns(:posts))
        assert_instance_of(Post, assigns(:posts).first)
      end

      should_respond_with :success
      should_render_template :index
      should_assign_to :posts
      should_route :get, "/posts", :controller => "posts", :action => :index
    end # end of GET index /posts
    
    context "GET show /posts/post-title" do
      setup do
        @post = Post.create(:title => "Post Title", :body => "...")
        get :show, :id => @post.permalink
      end

      should_respond_with :success
      should_render_template :show
      should_assign_to :post
      should_route :get, "/posts/post-title", :controller => "posts", :action => :show, :id => "post-title"
    end # end of GET index /posts
    
    # context "GET index /posts" do
    #   setup do
    #     get :index
    #   end
    # 
    #   should "assign to @posts an array of Post models" do
    #     assert_instance_of(Array, assigns(:posts))
    #     assert_instance_of(Post, assigns(:posts).first)
    #   end
    # 
    #   should_respond_with :success
    #   should_render_template :index
    #   should_assign_to :posts
    #   should_route :get, "/posts", :controller => "posts", :action => :index
    # end # end of GET index /posts
    
    
    
  end # end of public actionx  
  
end
