class HardWorker
  include Sidekiq::Worker
  def perform(blog_id)
    BlogEntry.update_from_feed(Blog.find(blog_id))
  end
end
