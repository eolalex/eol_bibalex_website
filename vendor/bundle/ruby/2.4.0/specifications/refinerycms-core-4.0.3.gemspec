# -*- encoding: utf-8 -*-
# stub: refinerycms-core 4.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "refinerycms-core".freeze
  s.version = "4.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Philip Arndt".freeze, "U\u0123is Ozols".freeze, "Rob Yurkowski".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIEMjCCApqgAwIBAgIBATANBgkqhkiG9w0BAQsFADAjMSEwHwYDVQQDDBhnZW1z\nL0RDPXAvREM9YXJuZHQvREM9aW8wHhcNMTgxMDI5MDk0MjQ5WhcNMTkxMDI5MDk0\nMjQ5WjAjMSEwHwYDVQQDDBhnZW1zL0RDPXAvREM9YXJuZHQvREM9aW8wggGiMA0G\nCSqGSIb3DQEBAQUAA4IBjwAwggGKAoIBgQClF0/voptshDoTILFgUjvkViCOPe3W\nuuDwfSep+gc5AI83MmrmonN3L/dwm60D3HhZOtVt9el1n5E5b5aPzJngjdF9sFPX\nOIx3UlYde+WkzbG4iR2U0/8dMZ6DYuz6ijgPEpU1UKodUJVqEmt3Vc+rzDET9zoK\nTkIALNbSaV2G32ZDhoabeQJoJ0ce/2vjDqhM7awG7CYGRqRq4c0NOKKm0bGh+LOo\nvQNDvRjXPs0yp5i3keCgf6IcQ26nluqILYGPjuTExJj+k6AKfq6SPWDVtzSqdfiH\nSTs/W85rwrKdLfEzfXxNsHvJ6Ryx+0A0hsNbfTTOhp4dkYm/6fyOejp7Of7qWRw/\nkJhI/PTq1gqh+Irpr+wUz04xItGE8WglKv1ydTUqBlCz2l9NfVTChtUpYlrk4FvN\nr7s6fcXH5cNX1ll2D1X2XLxmYEUgbAv5xApspvmpdRY5zlmSXZapi2KbW5iqpOV2\nluxRjhjfcOKfMugvGrMUFiqDaDi5IXS25KECAwEAAaNxMG8wCQYDVR0TBAIwADAL\nBgNVHQ8EBAMCBLAwHQYDVR0OBBYEFLzeU7GH0rvnvDchSWtJhceiUDDTMBoGA1Ud\nEQQTMBGBD2dlbXNAcC5hcm5kdC5pbzAaBgNVHRIEEzARgQ9nZW1zQHAuYXJuZHQu\naW8wDQYJKoZIhvcNAQELBQADggGBABMRA737G23Oiy1xBgVJsDW5LgGbeK9JQCC9\neRdx22TDyrJ5vviqB22k13+zp/tq5fgeCsrk5iLAt5F/GgcP82p7pPm3qKi1QWip\ncnQvy5fLKcl+PaIX/+PYGVKUfV/wA+NuP06RSnzvNPepcUvbTJdAr6nQVdIh/ftB\n64QhOWuk2CuGlt+tLMGbjR65W3SppBkvVd4yYHArbl4Z0qPG+TVrVrj2JEjo82rT\njIUDLkdUlQ/FmH5fHhbrtn5PMCXjto414YBC7aQUxQsiNCN2qhsjwiyzVBbBTjnA\n1sA043YnGOd1XylVtnrARK5eT7DhFGrMGMp/KvOg+T7q19+65jaopvHH4zFXzBcY\nMxlH/7tMQ5+DdHcqbu3SOAe1/VaaRk28J0CdPZS6Y60YuRqL17Zg2WOODiBkA9WE\nJjcyzdERZXsSPh+DT5PrllEbTNTZPbBcnAWjqdEWLtBIxD3JpgZHTmYP4I2ExAeu\n2Oqsxsw30MIZnh2Cw/xLRkc1I50luA==\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2018-10-29"
  s.description = "The core of Refinery CMS. This handles the common functionality and is required by most extensions".freeze
  s.email = "refinerycms@p.arndt.io".freeze
  s.homepage = "https://www.refinerycms.com".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2".freeze)
  s.rubyforge_project = "refinerycms".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Core extension for Refinery CMS".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<refinerycms-i18n>.freeze, [">= 4.0.0", "~> 4.0"])
      s.add_runtime_dependency(%q<awesome_nested_set>.freeze, [">= 3.0.0", "~> 3.0"])
      s.add_runtime_dependency(%q<railties>.freeze, ["< 5.2", ">= 5.1.0"])
      s.add_runtime_dependency(%q<activerecord>.freeze, ["< 5.2", ">= 5.1.0"])
      s.add_runtime_dependency(%q<actionpack>.freeze, ["< 5.2", ">= 5.1.0"])
      s.add_runtime_dependency(%q<truncate_html>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<will_paginate>.freeze, [">= 3.1.0", "~> 3.1"])
      s.add_runtime_dependency(%q<sass-rails>.freeze, ["< 5.1", ">= 4.0"])
      s.add_runtime_dependency(%q<font-awesome-sass>.freeze, ["< 5.0", ">= 4.3.0"])
      s.add_runtime_dependency(%q<coffee-rails>.freeze, [">= 4.0.0", "~> 4.0"])
      s.add_runtime_dependency(%q<jquery-rails>.freeze, [">= 4.3.1", "~> 4.3"])
      s.add_runtime_dependency(%q<jquery-ui-rails>.freeze, [">= 5.0.0", "~> 5.0"])
      s.add_runtime_dependency(%q<decorators>.freeze, [">= 2.0.0", "~> 2.0"])
      s.add_runtime_dependency(%q<zilch-authorisation>.freeze, [">= 0.0.1", "~> 0"])
    else
      s.add_dependency(%q<refinerycms-i18n>.freeze, [">= 4.0.0", "~> 4.0"])
      s.add_dependency(%q<awesome_nested_set>.freeze, [">= 3.0.0", "~> 3.0"])
      s.add_dependency(%q<railties>.freeze, ["< 5.2", ">= 5.1.0"])
      s.add_dependency(%q<activerecord>.freeze, ["< 5.2", ">= 5.1.0"])
      s.add_dependency(%q<actionpack>.freeze, ["< 5.2", ">= 5.1.0"])
      s.add_dependency(%q<truncate_html>.freeze, ["~> 0.9"])
      s.add_dependency(%q<will_paginate>.freeze, [">= 3.1.0", "~> 3.1"])
      s.add_dependency(%q<sass-rails>.freeze, ["< 5.1", ">= 4.0"])
      s.add_dependency(%q<font-awesome-sass>.freeze, ["< 5.0", ">= 4.3.0"])
      s.add_dependency(%q<coffee-rails>.freeze, [">= 4.0.0", "~> 4.0"])
      s.add_dependency(%q<jquery-rails>.freeze, [">= 4.3.1", "~> 4.3"])
      s.add_dependency(%q<jquery-ui-rails>.freeze, [">= 5.0.0", "~> 5.0"])
      s.add_dependency(%q<decorators>.freeze, [">= 2.0.0", "~> 2.0"])
      s.add_dependency(%q<zilch-authorisation>.freeze, [">= 0.0.1", "~> 0"])
    end
  else
    s.add_dependency(%q<refinerycms-i18n>.freeze, [">= 4.0.0", "~> 4.0"])
    s.add_dependency(%q<awesome_nested_set>.freeze, [">= 3.0.0", "~> 3.0"])
    s.add_dependency(%q<railties>.freeze, ["< 5.2", ">= 5.1.0"])
    s.add_dependency(%q<activerecord>.freeze, ["< 5.2", ">= 5.1.0"])
    s.add_dependency(%q<actionpack>.freeze, ["< 5.2", ">= 5.1.0"])
    s.add_dependency(%q<truncate_html>.freeze, ["~> 0.9"])
    s.add_dependency(%q<will_paginate>.freeze, [">= 3.1.0", "~> 3.1"])
    s.add_dependency(%q<sass-rails>.freeze, ["< 5.1", ">= 4.0"])
    s.add_dependency(%q<font-awesome-sass>.freeze, ["< 5.0", ">= 4.3.0"])
    s.add_dependency(%q<coffee-rails>.freeze, [">= 4.0.0", "~> 4.0"])
    s.add_dependency(%q<jquery-rails>.freeze, [">= 4.3.1", "~> 4.3"])
    s.add_dependency(%q<jquery-ui-rails>.freeze, [">= 5.0.0", "~> 5.0"])
    s.add_dependency(%q<decorators>.freeze, [">= 2.0.0", "~> 2.0"])
    s.add_dependency(%q<zilch-authorisation>.freeze, [">= 0.0.1", "~> 0"])
  end
end
