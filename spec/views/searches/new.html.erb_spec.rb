require 'rails_helper'

RSpec.describe "searches/new", type: :view do
  before(:each) do
    assign(:search, Search.new(
      :json_text => "MyText",
      :chunk => nil
    ))
  end

  it "renders new search form" do
    render

    assert_select "form[action=?][method=?]", searches_path, "post" do

      assert_select "textarea#search_json_text[name=?]", "search[json_text]"

      assert_select "input#search_chunk_id[name=?]", "search[chunk_id]"
    end
  end
end
