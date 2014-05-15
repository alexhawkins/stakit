require 'spec_helper'

describe "frenquencies/edit" do
  before(:each) do
    @frenquency = assign(:frenquency, stub_model(Frenquency,
      :value => "MyString"
    ))
  end

  it "renders the edit frenquency form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", frenquency_path(@frenquency), "post" do
      assert_select "input#frenquency_value[name=?]", "frenquency[value]"
    end
  end
end
