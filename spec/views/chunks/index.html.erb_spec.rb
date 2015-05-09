require 'rails_helper'

RSpec.describe "chunks/index", type: :view do
  before(:each) do
    assign(:chunks, [
      Chunk.create!(
        :content => "MyText"
      ),
      Chunk.create!(
        :content => "MyText"
      )
    ])
  end

  it "renders a list of chunks" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
