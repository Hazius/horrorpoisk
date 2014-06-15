require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :user_id => 1,
      :film_id => 1,
      :liked => false,
      :text => "MyText"
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "input#comment_user_id[name=?]", "comment[user_id]"
      assert_select "input#comment_film_id[name=?]", "comment[film_id]"
      assert_select "input#comment_liked[name=?]", "comment[liked]"
      assert_select "textarea#comment_text[name=?]", "comment[text]"
    end
  end
end
