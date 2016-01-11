module WillPaginate
  module NoBrainer
    # Collection methods.
    module CollectionMethods
      attr_reader :current_page

      def total_entries
        @total_entries ||= count
        # @total_entries ||= skip(nil).limit(nil).count
      end

      def total_pages
        (total_entries / per_page.to_f).ceil
      end

      def offset
        @page_multiplier * per_page
      end
    end
  end
end
