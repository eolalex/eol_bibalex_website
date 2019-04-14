# -*- encoding: utf-8 -*-
# stub: active_record_bulk_insert 1.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "active_record_bulk_insert".freeze
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Abejide Ayodele".freeze]
  s.date = "2017-05-25"
  s.description = "Exposes a bulk insert API to AR subclasses".freeze
  s.email = ["abejideayodele@gmail.com".freeze]
  s.homepage = "https://github.com/bjhaid/active_record_bulk_insert".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "bulk insert records into the DB".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<activerecord>.freeze, [">= 3.2.0"])
      s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["= 2.13.0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 3.2.0"])
      s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["= 2.13.0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 3.2.0"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["= 2.13.0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
  end
end
