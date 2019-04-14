# -*- encoding: utf-8 -*-
# stub: neography 1.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "neography".freeze
  s.version = "1.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Max De Marzi".freeze]
  s.date = "2015-10-22"
  s.description = "A Ruby wrapper to the Neo4j Rest API see http://docs.neo4j.org/chunked/stable/rest-api.html for more details.".freeze
  s.email = "maxdemarzi@gmail.com".freeze
  s.homepage = "http://rubygems.org/gems/neography".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "neography".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "ruby wrapper to Neo4j Rest API".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, ["= 3.0"])
      s.add_development_dependency(%q<net-http-spy>.freeze, ["= 0.2.1"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<excon>.freeze, [">= 0.33.0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 1.7.7"])
      s.add_runtime_dependency(%q<os>.freeze, [">= 0.9.6"])
      s.add_runtime_dependency(%q<rubyzip>.freeze, [">= 1.0.0"])
      s.add_runtime_dependency(%q<multi_json>.freeze, [">= 1.3.2"])
      s.add_runtime_dependency(%q<rake>.freeze, [">= 0.8.7"])
    else
      s.add_dependency(%q<rspec>.freeze, ["= 3.0"])
      s.add_dependency(%q<net-http-spy>.freeze, ["= 0.2.1"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_dependency(%q<excon>.freeze, [">= 0.33.0"])
      s.add_dependency(%q<json>.freeze, [">= 1.7.7"])
      s.add_dependency(%q<os>.freeze, [">= 0.9.6"])
      s.add_dependency(%q<rubyzip>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<multi_json>.freeze, [">= 1.3.2"])
      s.add_dependency(%q<rake>.freeze, [">= 0.8.7"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["= 3.0"])
    s.add_dependency(%q<net-http-spy>.freeze, ["= 0.2.1"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<excon>.freeze, [">= 0.33.0"])
    s.add_dependency(%q<json>.freeze, [">= 1.7.7"])
    s.add_dependency(%q<os>.freeze, [">= 0.9.6"])
    s.add_dependency(%q<rubyzip>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<multi_json>.freeze, [">= 1.3.2"])
    s.add_dependency(%q<rake>.freeze, [">= 0.8.7"])
  end
end
