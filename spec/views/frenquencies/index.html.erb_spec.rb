require 'spec_helper'

describe "frenquencies/index" do
  before(:each) do
    assign(:frenquencies, [
      stub_model(Frenquency,
        :value => "Value"
      ),
      stub_model(Frenquency,
        :value => "Value"
      )
    ])
  end

  it "renders a list of frenquencies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
