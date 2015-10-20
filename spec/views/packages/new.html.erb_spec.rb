require 'rails_helper'

RSpec.describe "packages/new", type: :view do
  before(:each) do
    assign(:package, Package.new(
      :title => "MyString",
      :description => "MyText",
      :notification_params => "MyText",
      :status => "MyString",
      :transaction_id => "MyString"
    ))
  end

  it "renders new package form" do
    render

    assert_select "form[action=?][method=?]", packages_path, "post" do

      assert_select "input#package_title[name=?]", "package[title]"

      assert_select "textarea#package_description[name=?]", "package[description]"

      assert_select "textarea#package_notification_params[name=?]", "package[notification_params]"

      assert_select "input#package_status[name=?]", "package[status]"

      assert_select "input#package_transaction_id[name=?]", "package[transaction_id]"
    end
  end
end