class NotificationWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default, :retry => true

  def perform(snippet_id)
    snippet = Snippet.find(snippet_id)
    snippet.run
  end


end
