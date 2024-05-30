class Link < ApplicationRecord
  validates :original_url, presence: true
  validates :lookup_code, presence: true
  validates :name, presence: true
  validate :original_url_format
  belongs_to :user

  def original_url_format
    uri = URI.parse(original_url || '')
    return unless uri.host.nil?

    errors.add(:original_url, 'Invalid URL format.')
  end

  def shortened_url
    "#{ENV.fetch('HOST', nil)}/s/#{lookup_code}"
  end
end
