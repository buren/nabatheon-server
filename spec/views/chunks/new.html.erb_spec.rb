require 'rails_helper'

RSpec.describe "chunks/new", type: :view do
  before(:each) do
    assign(:chunk, Chunk.new(
      :content => "MyText"
    ))
  end

  it "renders new chunk form" do
    render

    assert_select "form[action=?][method=?]", chunks_path, "post" do

      assert_select "textarea#chunk_content[name=?]", "chunk[content]"
    end
  end
end
