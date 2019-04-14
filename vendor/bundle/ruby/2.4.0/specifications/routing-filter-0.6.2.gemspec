# -*- encoding: utf-8 -*-
# stub: routing-filter 0.6.2 ruby lib

Gem::Specification.new do |s|
  s.name = "routing-filter".freeze
  s.version = "0.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sven Fuchs".freeze]
  s.date = "2018-04-26"
  s.description = "Routing filters wraps around the complex beast that the Rails routing system is, allowing for unseen flexibility and power in Rails URL recognition and generation.".freeze
  s.email = "svenfuchs@artweb-design.de".freeze
  s.homepage = "http://github.com/svenfuchs/routing-filter".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubyforge_project = "[none]".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Routing filters wraps around the complex beast that the Rails routing system is, allowing for unseen flexibility and power in Rails URL recognition and generation".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>.freeze, ["< 6", ">= 4.2"])
      s.add_runtime_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.2"])
      s.add_development_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_development_dependency(%q<test_declarative>.freeze, [">= 0"])
      s.add_development_dependency(%q<rack-test>.freeze, ["~> 0.6.2"])
      s.add_development_dependency(%q<rails>.freeze, ["< 6", ">= 4.2"])
      s.add_development_dependency(%q<minitest>.freeze, ["< 5.10.2"])
    else
      s.add_dependency(%q<actionpack>.freeze, ["< 6", ">= 4.2"])
      s.add_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.2"])
      s.add_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_dependency(%q<test_declarative>.freeze, [">= 0"])
      s.add_dependency(%q<rack-test>.freeze, ["~> 0.6.2"])
      s.add_dependency(%q<rails>.freeze, ["< 6", ">= 4.2"])
      s.add_dependency(%q<minitest>.freeze, ["< 5.10.2"])
    end
  else
    s.add_dependency(%q<actionpack>.freeze, ["< 6", ">= 4.2"])
    s.add_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.2"])
    s.add_dependency(%q<i18n>.freeze, [">= 0"])
    s.add_dependency(%q<test_declarative>.freeze, [">= 0"])
    s.add_dependency(%q<rack-test>.freeze, ["~> 0.6.2"])
    s.add_dependency(%q<rails>.freeze, ["< 6", ">= 4.2"])
    s.add_dependency(%q<minitest>.freeze, ["< 5.10.2"])
  end
end
