require 'rails_helper'

RSpec.describe "chunks/edit", type: :view do
  before(:each) do
    @chunk = assign(:chunk, Chunk.create!(
      :content => "MyText"
    ))
  end

  it "renders the edit chunk form" do
    render

    assert_select "form[action=?][method=?]", chunk_path(@chunk), "post" do

      assert_select "textarea#chunk_content[name=?]", "chunk[content]"
    end
  end
end
