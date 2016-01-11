require 'will_paginate/collection'
require 'will_paginate/nobrainer/criteria_methods'

module WillPaginate
  module NoBrainer
    # Contains `page` and `per_page` model methods implementation.
    module Extension
      extend ActiveSupport::Concern

      included do
        scope :paginate do |options = {}|
          pp = (options[:per_page] || WillPaginate.per_page).to_i

          limit(pp)
            .skip(pp * ([options[:page].to_i, 1].max - 1))
            .extend(WillPaginate::NoBrainer::CriteriaMethods)
        end
      end
    end
  end
end
