require 'will_paginate/collection'

module WillPaginate
  module NoBrainer
    # Collection methods.
    module CollectionMethods
      extend ActiveSupport::Concern
      include WillPaginate::CollectionMethods

      attr_accessor :current_page
      attr_accessor :per_page
      attr_accessor :page_multiplier

      def total_entries
        @total_entrie ||= self.skip(nil).limit(nil).count
      end

      def total_pages
        (total_entries / per_page.to_f).ceil
      end

      def offset
        page_multiplier * per_page
      end
    end
  end
end
