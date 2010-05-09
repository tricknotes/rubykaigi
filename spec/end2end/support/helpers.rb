module HelperMethods
  def header(key, value)
    page.driver.header key, value
  end
end

Spec::Runner.configuration.include(HelperMethods)
