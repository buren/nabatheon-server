require 'rails_helper'

RSpec.describe "entities/new", type: :view do
  before(:each) do
    assign(:entity, Entity.new(
      :type => "",
      :value => "MyString",
      :chunk => nil
    ))
  end

  it "renders new entity form" do
    render

    assert_select "form[action=?][method=?]", entities_path, "post" do

      assert_select "input#entity_type[name=?]", "entity[type]"

      assert_select "input#entity_value[name=?]", "entity[value]"

      assert_select "input#entity_chunk_id[name=?]", "entity[chunk_id]"
    end
  end
end
