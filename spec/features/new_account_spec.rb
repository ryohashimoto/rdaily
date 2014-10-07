require "spec_helper"

feature "New account creation" do
  scenario "User creates a new account", js: true do
    visit root_path

    expect(page).to have_content "Welcome to Rdaily !"
    click_link "Create new user"

    expect(current_path).to eq new_account_user_path
    fill_in "user_name", with: "test"
    fill_in "user_email", with: "test@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Create"

    expect(page).to have_content "Please login."

    fill_in "email", with: "test@example.com"
    fill_in "password", with: "password"
    click_button "Login"

    expect(current_path).to eq account_path
    expect(page).to have_content "Logged in as test."

    visit page_path(:id => 'about')
    expect(page).to have_content "You can modify this page in account/pages menu."

    visit account_path
    expect(page).to have_content "New Post"

    fill_in "post_title", with: "First post"
    fill_in "post_body", with: "This is the first post body."
    click_button "Create Post"

    expect(current_path).to eq account_path
    expect(page).to have_content "Post is successfully created."

    within ".post" do
      click_link "Publish"
    end

    visit(root_path)
    expect(page).to have_content "First post"
    expect(page).to have_content "This is the first post body."
  end
end
