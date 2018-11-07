module ActionPager
  module PaginationHelper
    def render_pager(pager)
      render "action_pager/pager", pager: pager # if total pages > 1
    end

    def url_for_page(url: url_for, page: nil, per: nil)
      return url if page.nil? && per.nil?

      uri = URI.parse(url)
      query = Rack::Utils.parse_nested_query(uri.query)
      query[:page] = page if page
      query[:per] = per if per
      uri.query = query.to_query
      uri.to_s
    end
  end
end
