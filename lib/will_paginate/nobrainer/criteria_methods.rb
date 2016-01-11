require 'will_paginate/nobrainer/collection_methods'

module WillPaginate
  module NoBrainer
    # will_paginate API implementation.
    module CriteriaMethods
      extend ActiveSupport::Concern

      # Requred methods for will_paginate.
      module ClassMethods
        def paginate(options = {})
          current_page = WillPaginate::PageNumber(options[:page] || 1)
          pp = (options[:per_page] || WillPaginate.per_page).to_i

          rel = limit(pp).skip((current_page - 1) * pp).extend(CollectionMethods)

          rel.current_page = current_page
          rel.page_multiplier = current_page - 1
          rel.per_page = pp

          rel
        end

        def per_page(value)
          limit(value)
        end

        def page(page = 1)
          paginate(page: page)
        end
      end
    end
  end
end
