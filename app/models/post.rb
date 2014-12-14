class Post < ActiveRecord::Base

  has_many :comments
  belongs_to :user

  URL_REGEX = /https?:\/\/[\S]+/

  validates :title, :length => {maximum: 140, minimum:1}, :presence => true
  validates :url, :length => {maximum: 2083, minimum:1}, :allow_blank => true, :format => {with: URL_REGEX}

  validate :span_free

  validate :only_twenty

  private
  def span_free
    if Post.count > 1
      last_post = Post.order(:created_at).last
      latest_time = last_post.created_at

      if latest_time > 1.minute.ago
        self.errors.add(:base, "Cannot post within 1 minute")
      end
    end
  end

  def only_twenty
    post_count = Post.count

    if post_count > 21
      self.errors.add(:base, "No more than 20 posts")
    end
  end
end
