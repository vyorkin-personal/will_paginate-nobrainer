require 'will_paginate/collection'
require 'will_paginate/nobrainer/collection_methods'

module WillPaginate
  module NoBrainer
    # Contains `page` and `per_page` model methods implementation.
    module CriteriaMethods
      def paginate(options = {})
        extend CollectionMethods

        @current_page = WillPaginate::PageNumber(options[:page] || @current_page || 1)
        @page_multiplier = current_page - 1
        pp = (options[:per_page] || per_page || WillPaginate.per_page).to_i
        limit(pp).skip(@page_multiplier * pp)
      end

      def per_page(value)
        limit(value)
      end

      def page(page)
        paginate(page: page)
      end
    end
  end
end
