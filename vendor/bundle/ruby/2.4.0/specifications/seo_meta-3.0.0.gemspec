# -*- encoding: utf-8 -*-
# stub: seo_meta 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "seo_meta".freeze
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Philip Arndt".freeze]
  s.date = "2017-08-24"
  s.description = "SEO Meta tags plugin for Ruby on Rails".freeze
  s.email = "p@arndt.io".freeze
  s.homepage = "http://p.arndt.io".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "SEO Meta tags plugin".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<combustion>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<railties>.freeze, [">= 5.0.0"])
    else
      s.add_dependency(%q<combustion>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<railties>.freeze, [">= 5.0.0"])
    end
  else
    s.add_dependency(%q<combustion>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<railties>.freeze, [">= 5.0.0"])
  end
end
