require 'will_paginate/collection'
require 'will_paginate/nobrainer/collection_methods'

module WillPaginate
  module NoBrainer
    # will_paginate API implementation.
    module CriteriaMethods
      extend ActiveSupport::Concern

      # Requred methods for will_paginate.
      module ClassMethods
        def paginate(options = {})
          extend CollectionMethods

          @current_page = WillPaginate::PageNumber(options[:page] || @current_page || 1)
          @page_multiplier = current_page - 1
          pp = (options[:per_page] || WillPaginate.per_page).to_i
          limit(pp).skip(@page_multiplier * pp).extend(CollectionMethods)
        end

        def per_page(value = nil)
          limit(value)
        end

        def page(page = 1)
          paginate(page: page)
        end
      end
    end
  end
end
