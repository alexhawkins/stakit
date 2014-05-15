require 'spec_helper'

describe "supplements/index" do
  before(:each) do
    assign(:supplements, [
      stub_model(Supplement,
        :name => "Name",
        :default_dose => "Default Dose",
        :default_frequency => "Default Frequency"
      ),
      stub_model(Supplement,
        :name => "Name",
        :default_dose => "Default Dose",
        :default_frequency => "Default Frequency"
      )
    ])
  end

  it "renders a list of supplements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Default Dose".to_s, :count => 2
    assert_select "tr>td", :text => "Default Frequency".to_s, :count => 2
  end
end
