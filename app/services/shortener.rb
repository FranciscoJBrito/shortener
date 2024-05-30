class ShortenerService
  attr_reader :url, :link_name, :user_id, :link_model

  def initialize(url, link_name, user_id, link_model = Link)
    @url = url
    @link_model = link_model
    @link_name = link_name
    @user_id = user_id
  end

  def generate_short_link
    link_model.create(original_url: url, lookup_code: lookup_code, name: link_name, user_id: user_id)
  end

  def lookup_code
    loop do
      code = fresh_code
      break code unless link_model.exists?(lookup_code: code)
    end
  end

  private

  def fresh_code
    SecureRandom.uuid[0..6]
  end
end
