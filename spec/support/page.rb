module Pages
end

class PageApp
  def initialize
    PageApp.constant_reader(::Pages)
  end

  def self.constant_reader(namespace) # rubocop:disable Metrics/MethodLength
    # access constants in namespace through accessors
    #
    # @example
    #   class Pages::Root; end
    #   class Pages::UrlPage; end
    #
    #   PageApp.constant_reader(::Pages)
    #
    #   will generate accessors
    #   def root= @root ||= Root.new
    #   def url_page= @url_page ||= UrlPage.new
    #
    #   TODO: what about nested Pages?
    #   class Pages::Url::Link; end
    #   class Pages::Url
    #     def link= @link ||= Pages::Url::Link.new
    #   end
    #   AND: deeper nesting?
    #   class Pages::Special::Url::Link; end
    #   class Pages::Special::Url
    #     def link= @link ||= Pages::Special::Url::Link.new
    #   end
    #
    namespace
      .constants
      .filter{_1.to_s != 'ClassMethods'}
      .each do |constant_name|
      method_name = constant_name.to_s.underscore
      variable_name = "@#{method_name}"
      klass = namespace.const_get(constant_name, false)

      define_method method_name do
        instance_variable_set variable_name, klass.new unless instance_variable_defined?(variable_name)
        instance_variable_get variable_name
      end
    end
  end
end
