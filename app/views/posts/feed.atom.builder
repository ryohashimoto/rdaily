atom_feed do |feed|
  feed.title @title
  feed.updated @updated
  @posts.each do |post|
    feed.entry post, :published => post.published_at do |entry|
      entry.title post.title
      entry.content markdown(post.body)
      entry.author do |author|
        author.name post.user.name
      end
    end
  end  	     
end