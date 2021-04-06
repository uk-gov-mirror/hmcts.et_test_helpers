Capybara.add_selector(:govuk_phone_field) do
  label 'GOVUK GDS Phone field container labelled'
  xpath do |locator, **options|
    locator = ::EtTestHelpers.normalize_locator(locator)
    locator = locator[:label] if locator.is_a?(Hash)
    # Helps with nicer error messages from rspec etc..
    @definition.label("GOVUK GDS Phone field container labelled <#{locator}>")
    xpath = XPath.generate { |x| x.descendant(:input)[x.attr(:type).equals('tel') & x.attr(:class).contains_word('govuk-input')] }
    field_xpath = locate_field(xpath, locator, **options)
    XPath.generate {|x| x.css('.govuk-form-group')[field_xpath] }
  end

  node_filter(:with) do |node, with|
    val = node.value
    (with.is_a?(Regexp) ? with.match?(val) : val == with.to_s).tap do |res|
      add_error("Expected value to be #{with.inspect} but was #{val.inspect}") unless res
    end
  end

  describe_node_filters do |**options|
    " with value #{options[:with].to_s.inspect}" if options.key?(:with)
  end
end
