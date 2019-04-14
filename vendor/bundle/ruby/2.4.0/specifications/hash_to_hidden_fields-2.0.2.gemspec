# -*- encoding: utf-8 -*-
# stub: hash_to_hidden_fields 2.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "hash_to_hidden_fields".freeze
  s.version = "2.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brian Hempel".freeze]
  s.date = "2016-10-26"
  s.description = "In goes a hash, out comes hidden fields. Great for preserving Rails parameters without abusing the session.".freeze
  s.email = ["plasticchicken@gmail.com".freeze]
  s.homepage = "https://github.com/brianhempel/hash_to_hidden_fields".freeze
  s.rubyforge_project = "hash_to_hidden_fields".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "In goes a hash, out comes hidden fields. Great for preserving Rails parameters without abusing the session.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<rack>.freeze, [">= 1.2"])
      s.add_runtime_dependency(%q<actionpack>.freeze, [">= 3"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<rack>.freeze, [">= 1.2"])
      s.add_dependency(%q<actionpack>.freeze, [">= 3"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rack>.freeze, [">= 1.2"])
    s.add_dependency(%q<actionpack>.freeze, [">= 3"])
  end
end
