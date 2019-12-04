module Api
  class DocumentationParameter
    attr_accessor :name, :type, :required, :values, :default, :notes, :test_value

    def initialize(options = {})
      @name = options[:name]
      @type = options[:type] || String
      @required = options[:required] || false
      @values = options[:values]
      @default = options[:default]
      @notes = options[:notes]
      @test_value = options[:test_value]
      @default = false if boolean? && @default == nil
    end

    def integer?
      @type == Integer
    end

    def string?
      @type == String
    end

    def boolean?
      @type == 'Boolean'
    end

    def array?
      @values.class == Array
    end

    def range?
      @values.class == Range
    end

    def required?
      @required == true
    end
  end
end