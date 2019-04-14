# -*- encoding: utf-8 -*-
# stub: speakingurl-rails 8.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "speakingurl-rails".freeze
  s.version = "8.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "contributor" => "Josef \u0160im\u00E1nek <https://github.com/simi>" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sascha Droste".freeze]
  s.date = "2016-01-05"
  s.description = "Generate a slug \u2013 transliteration with a lot of options".freeze
  s.email = ["pid@posteo.net".freeze]
  s.homepage = "http://pid.github.io/speakingurl/".freeze
  s.licenses = ["BSD".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Speakingurl for Rails asset pipeline".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.1"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 3.1"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.1"])
  end
end
