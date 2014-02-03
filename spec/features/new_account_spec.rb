require "spec_helper"

feature "New account creation" do
  scenario "User creates a new account", js: true do
    visit root_path
  end
end
