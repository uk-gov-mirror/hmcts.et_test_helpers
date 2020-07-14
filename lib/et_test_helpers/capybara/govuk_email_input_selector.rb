Capybara.add_selector(:govuk_email_input) do
  label 'GOVUK GDS email input'
  xpath do
    XPath.generate { |x| x.descendant(:input)[x.attr(:class).contains_word('govuk-input') & x.attr(:type).equals('email') & x.attr(:spellcheck).equals('false')] }
  end
end
