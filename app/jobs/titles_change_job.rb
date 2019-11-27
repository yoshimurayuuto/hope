class TitlesChangeJob < ApplicationJob
  queue_as :default

  def perform(share_id)
    Share.find(share_id).title_change
  end
end
