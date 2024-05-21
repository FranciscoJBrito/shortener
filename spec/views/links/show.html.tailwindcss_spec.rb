require 'rails_helper'

RSpec.describe "links/show", type: :view do
  before(:each) do
    assign(:link, Link.create!(
      link: "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Link/)
  end
end
