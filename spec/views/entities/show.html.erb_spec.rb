require 'rails_helper'

RSpec.describe "entities/show", type: :view do
  before(:each) do
    @entity = assign(:entity, Entity.create!(
      :type => "Type",
      :value => "Value",
      :chunk => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Value/)
    expect(rendered).to match(//)
  end
end
