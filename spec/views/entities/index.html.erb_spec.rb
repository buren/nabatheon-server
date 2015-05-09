require 'rails_helper'

RSpec.describe "entities/index", type: :view do
  before(:each) do
    assign(:entities, [
      Entity.create!(
        :type => "Type",
        :value => "Value",
        :chunk => nil
      ),
      Entity.create!(
        :type => "Type",
        :value => "Value",
        :chunk => nil
      )
    ])
  end

  it "renders a list of entities" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
