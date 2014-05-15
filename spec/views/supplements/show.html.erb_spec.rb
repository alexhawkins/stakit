require 'spec_helper'

describe "supplements/show" do
  before(:each) do
    @supplement = assign(:supplement, stub_model(Supplement,
      :name => "Name",
      :default_dose => "Default Dose",
      :default_frequency => "Default Frequency"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Default Dose/)
    rendered.should match(/Default Frequency/)
  end
end
