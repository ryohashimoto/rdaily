class AmazonService
  SEARCH_INDEXES = ['All', 'Books', 'DVD', 'Music', 'Software', 'VideoGames']
  
  def initialize(search_index)
    if SEARCH_INDEXES.include?(search_index)
      @search_index = search_index
    else
      @search_index = 'All'
    end
  end
  
  def lookup(asin)
    result = Amazon::Ecs.item_lookup(asin, { response_group: 'Medium'})
    raise 'Amazon API Error' if result.has_error?
    raise 'Item not found.' if result.items.count == 0
    item = result.items.first
    parse_item(item)
  end 
  
  def search(keyword)
    result = Amazon::Ecs.item_search(keyword, {
      search_index: @search_index,
      response_group: 'Medium',
      sort: 'salesrank',
      country: 'jp'})
    raise 'Amazon API Error' if result.has_error?
    result_hash = {}
    result_hash[:items] = []
    result.items.each do |item|
      result_hash[:items] << parse_item(item)
    end
    result_hash
  end
  
  private
  def parse_item(item)
    case @search_index
    when 'Books'
      info = {
        asin: item.get('ASIN'),
        isbn: item.get('ItemAttributes/ISBN'),
        author: item.get('ItemAttributes/Author'),
        title: item.get('ItemAttributes/Title'),
        publisher: item.get('ItemAttributes/Published'),
        published_on: item.get('ItemAttributes/PublicationDate'),        
        page_url: URI.decode(item.get('DetailPageURL')),
        image_url: item.get('MediumImage/URL'),
        image_small_url: item.get('SmallImage/URL'),
        image_large_url: item.get('LargeImage/URL')
      }
    when 'Music'
      info = {
        asin: item.get('ASIN'),
        title: item.get('ItemAttributes/Title'),
        page_url: URI.decode(item.get('DetailPageURL')),
        image_url: item.get('MediumImage/URL'),
        image_small_url: item.get('SmallImage/URL'),
        image_large_url: item.get('LargeImage/URL')
      }
    else
      info = {
        asin: item.get('ASIN'),
        title: item.get('ItemAttributes/Title'),
        page_url: URI.decode(item.get('DetailPageURL')),
        image_url: item.get('MediumImage/URL'),
        image_small_url: item.get('SmallImage/URL'),
        image_large_url: item.get('LargeImage/URL')
      }
    end
    info
  end
end