class UpdateAllBlogsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  recurrence { hourly(3) }
  def perform
    Blog.pluck(:id).each do |blog_id|
      UpdateBlogFeedWorker.perform_async(blog_id)
    end
  end
end
