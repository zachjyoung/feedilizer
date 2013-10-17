class UpdateBlogFeedWorker
  include Sidekiq::Worker
  def perform(blog_id)
     blog = Blog.find(blog_id)
     blog.update_from_feed
  end
end
