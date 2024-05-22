class Link < ApplicationRecord
  def original_url_format
    uri = URI.parse(original_url || '')
    return unless uri.host.nil?

    errors.add(:original_url, 'Invalid URL format.')
  end

  def shortened_url
    "#{ENV.fetch('HOST', nil)}/#{lookup_code}"
  end
end
