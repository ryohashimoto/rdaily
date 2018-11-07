module ActionPager
  module Pagination
    DEFAULTS = { page: 1, per: 5 }.freeze

    def pager_for(collection, options={})
      opts = DEFAULTS.merge(options.reject { |_k, v| v.to_i.zero? })
      ActionPager::Pager.new(
        collection,
        page: opts[:page].to_i,
        per: opts[:per].to_i
      )
    end
  end
end
