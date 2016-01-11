module WillPaginate
  module NoBrainer
    # Criteria methods.
    module CriteriaMethods
      attr_reader :current_page

      def total_entries
        @total_entries ||= self.count
      end

      def total_pages
        (total_entries / per_page.to_f).ceil
      end

      def current_page
        @current_page ||= WillPaginate::PageNumber(options[:page] || 1)
      end

      def offset
        (current_page - 1) * per_page
      end

      def per_page(value = nil)
        limit(value)
      end

      def page(page)
        paginate(page: page)
      end
    end
  end
end
