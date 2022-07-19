module Slug
  extend ActiveSupport::Concern

  included do
    before_validation :generate_slug, on: :create
    validates :slug,  uniqueness: { case_sensitive: false, message: 'That URL has already been taken' }, format: { with: /\A[a-zA-Z0-9\-_]+\z/, message: "You can use letters, numbers, and dashes for your collector's public URL." }
  end

  def generate_slug
    possible = name.strip.parameterize
    count = Poll.where('slug LIKE ?', "#{possible}%").count
    if count.zero?
      self.slug ||= possible
    else
      self.slug ||= "#{possible}-#{SecureRandom.base36 8}"
    end
  end

  def to_param
    slug
  end

end
