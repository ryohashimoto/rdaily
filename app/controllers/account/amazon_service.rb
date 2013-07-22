class AmazonService
  SEARCH_INDEXES = ['All', 'Books', 'DVD', 'Music', 'Software', 'VideoGames']
  
  def search(keyword, search_index)
    unless SEARCH_INDEXES.include?(search_index)
      search_index = 'All'
    end
    result = Amazon::Ecs.item_search(keyword, {
      search_index: search_index,
      response_group: 'Medium',
      sort: 'salesrank',
      country: 'jp'})
    result.items
  end
end