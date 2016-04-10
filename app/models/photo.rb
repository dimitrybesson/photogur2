class Photo < ActiveRecord::Base
  def self.created_before(time)
    where("created_at < ?", time)
  end

  def self.newest_first
    order("created_at DESC")
  end

  def self.most_recent_five
    newest_first.limit(5)
  end
end
