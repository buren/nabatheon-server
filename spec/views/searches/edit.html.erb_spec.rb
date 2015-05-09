require 'rails_helper'

RSpec.describe "searches/edit", type: :view do
  before(:each) do
    @search = assign(:search, Search.create!(
      :json_text => "MyText",
      :chunk => nil
    ))
  end

  it "renders the edit search form" do
    render

    assert_select "form[action=?][method=?]", search_path(@search), "post" do

      assert_select "textarea#search_json_text[name=?]", "search[json_text]"

      assert_select "input#search_chunk_id[name=?]", "search[chunk_id]"
    end
  end
end
