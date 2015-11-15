class NotificationWorker
  include Sidekiq::Worker

  def perform(snippet_id)
    snippet = Snippet.find(snippet_id)
    snippet.run
  end


end
