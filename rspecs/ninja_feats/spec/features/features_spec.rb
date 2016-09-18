require "rails_helper"
describe "Register" do
  it "prompts for the user fields" do
    visit "/ninjas/new"
    expect(page).to have_field('name')
    expect(page).to have_field('description')
  end
  it "creates ninja and redirects to success page" do
    visit "/"
    fill_in "name", with: "Mandy"
    fill_in "description", with: "Idksomethingcoolaboutthispersonalthoughihavenoidea"
    click_button "Submit"
    expect(current_path).to eq("/success")
    expect(page).to have_text("Form submitted successfully ")
  end
end
