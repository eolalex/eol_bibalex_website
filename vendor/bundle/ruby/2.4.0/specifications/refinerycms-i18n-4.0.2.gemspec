# -*- encoding: utf-8 -*-
# stub: refinerycms-i18n 4.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "refinerycms-i18n".freeze
  s.version = "4.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Philip Arndt".freeze, "U\u0123is Ozols".freeze]
  s.date = "2018-03-15"
  s.description = "i18n logic extracted from Refinery CMS, for Refinery CMS.".freeze
  s.email = "info@refinerycms.com".freeze
  s.homepage = "https://refinerycms.com".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.9".freeze)
  s.rubygems_version = "2.7.7".freeze
  s.summary = "i18n logic for Refinery CMS.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<routing-filter>.freeze, [">= 0.4.0"])
      s.add_runtime_dependency(%q<rails-i18n>.freeze, ["~> 5.0.0"])
    else
      s.add_dependency(%q<routing-filter>.freeze, [">= 0.4.0"])
      s.add_dependency(%q<rails-i18n>.freeze, ["~> 5.0.0"])
    end
  else
    s.add_dependency(%q<routing-filter>.freeze, [">= 0.4.0"])
    s.add_dependency(%q<rails-i18n>.freeze, ["~> 5.0.0"])
  end
end
