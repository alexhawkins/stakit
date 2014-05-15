require 'spec_helper'

describe "frenquencies/show" do
  before(:each) do
    @frenquency = assign(:frenquency, stub_model(Frenquency,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
  end
end
