require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    assign(:links, [
      Link.create!(
        link: "Link"
      ),
      Link.create!(
        link: "Link"
      )
    ])
  end

  it "renders a list of links" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Link".to_s), count: 2
  end
end
