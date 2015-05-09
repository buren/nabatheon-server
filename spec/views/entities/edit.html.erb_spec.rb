require 'rails_helper'

RSpec.describe "entities/edit", type: :view do
  before(:each) do
    @entity = assign(:entity, Entity.create!(
      :type => "",
      :value => "MyString",
      :chunk => nil
    ))
  end

  it "renders the edit entity form" do
    render

    assert_select "form[action=?][method=?]", entity_path(@entity), "post" do

      assert_select "input#entity_type[name=?]", "entity[type]"

      assert_select "input#entity_value[name=?]", "entity[value]"

      assert_select "input#entity_chunk_id[name=?]", "entity[chunk_id]"
    end
  end
end
