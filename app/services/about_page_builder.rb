class AboutPageBuilder
  def initialize(user)
    @user = user
  end

  def create_page
    @page = @user.pages.new(title: 'About',
                            body: 'You can modify this page in account/pages menu.',
                            slug: 'about',
                            published_at: Time.now)
    @page.save
  end
end
