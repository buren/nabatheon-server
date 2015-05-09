require 'rails_helper'

RSpec.describe "searches/index", type: :view do
  before(:each) do
    assign(:searches, [
      Search.create!(
        :json_text => "MyText",
        :chunk => nil
      ),
      Search.create!(
        :json_text => "MyText",
        :chunk => nil
      )
    ])
  end

  it "renders a list of searches" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
