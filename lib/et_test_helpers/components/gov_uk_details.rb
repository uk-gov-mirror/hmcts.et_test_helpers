module EtTestHelpers
  module Components
    # A gov.uk GDS standard details section representation for testing
    class GovUKDetails < ::SitePrism::Section
      def open
        toggle unless open?
      end

      def close
        toggle if open?
      end

      private

      def open?
        root_element[:open] == 'true'
      end

      def toggle
        root_element.click
      end
    end
  end
end
