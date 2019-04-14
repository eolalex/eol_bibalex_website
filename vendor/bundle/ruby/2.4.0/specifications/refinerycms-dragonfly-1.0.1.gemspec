# -*- encoding: utf-8 -*-
# stub: refinerycms-dragonfly 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "refinerycms-dragonfly".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Philip Arndt".freeze, "U\u0123is Ozols".freeze, "Rob Yurkowski".freeze, "Anita Graham".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIEMjCCApqgAwIBAgIBATANBgkqhkiG9w0BAQsFADAjMSEwHwYDVQQDDBhnZW1z\nL0RDPXAvREM9YXJuZHQvREM9aW8wHhcNMTgxMDI5MDk0MjQ5WhcNMTkxMDI5MDk0\nMjQ5WjAjMSEwHwYDVQQDDBhnZW1zL0RDPXAvREM9YXJuZHQvREM9aW8wggGiMA0G\nCSqGSIb3DQEBAQUAA4IBjwAwggGKAoIBgQClF0/voptshDoTILFgUjvkViCOPe3W\nuuDwfSep+gc5AI83MmrmonN3L/dwm60D3HhZOtVt9el1n5E5b5aPzJngjdF9sFPX\nOIx3UlYde+WkzbG4iR2U0/8dMZ6DYuz6ijgPEpU1UKodUJVqEmt3Vc+rzDET9zoK\nTkIALNbSaV2G32ZDhoabeQJoJ0ce/2vjDqhM7awG7CYGRqRq4c0NOKKm0bGh+LOo\nvQNDvRjXPs0yp5i3keCgf6IcQ26nluqILYGPjuTExJj+k6AKfq6SPWDVtzSqdfiH\nSTs/W85rwrKdLfEzfXxNsHvJ6Ryx+0A0hsNbfTTOhp4dkYm/6fyOejp7Of7qWRw/\nkJhI/PTq1gqh+Irpr+wUz04xItGE8WglKv1ydTUqBlCz2l9NfVTChtUpYlrk4FvN\nr7s6fcXH5cNX1ll2D1X2XLxmYEUgbAv5xApspvmpdRY5zlmSXZapi2KbW5iqpOV2\nluxRjhjfcOKfMugvGrMUFiqDaDi5IXS25KECAwEAAaNxMG8wCQYDVR0TBAIwADAL\nBgNVHQ8EBAMCBLAwHQYDVR0OBBYEFLzeU7GH0rvnvDchSWtJhceiUDDTMBoGA1Ud\nEQQTMBGBD2dlbXNAcC5hcm5kdC5pbzAaBgNVHRIEEzARgQ9nZW1zQHAuYXJuZHQu\naW8wDQYJKoZIhvcNAQELBQADggGBABMRA737G23Oiy1xBgVJsDW5LgGbeK9JQCC9\neRdx22TDyrJ5vviqB22k13+zp/tq5fgeCsrk5iLAt5F/GgcP82p7pPm3qKi1QWip\ncnQvy5fLKcl+PaIX/+PYGVKUfV/wA+NuP06RSnzvNPepcUvbTJdAr6nQVdIh/ftB\n64QhOWuk2CuGlt+tLMGbjR65W3SppBkvVd4yYHArbl4Z0qPG+TVrVrj2JEjo82rT\njIUDLkdUlQ/FmH5fHhbrtn5PMCXjto414YBC7aQUxQsiNCN2qhsjwiyzVBbBTjnA\n1sA043YnGOd1XylVtnrARK5eT7DhFGrMGMp/KvOg+T7q19+65jaopvHH4zFXzBcY\nMxlH/7tMQ5+DdHcqbu3SOAe1/VaaRk28J0CdPZS6Y60YuRqL17Zg2WOODiBkA9WE\nJjcyzdERZXsSPh+DT5PrllEbTNTZPbBcnAWjqdEWLtBIxD3JpgZHTmYP4I2ExAeu\n2Oqsxsw30MIZnh2Cw/xLRkc1I50luA==\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2018-11-30"
  s.description = "Allows Refinery to use dragonfly for file storage and processing".freeze
  s.email = "anita@joli.com.au".freeze
  s.homepage = "http://refinerycms.com".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Dragonfly interface for Refinery CMS".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dragonfly>.freeze, ["~> 1.1"])
      s.add_runtime_dependency(%q<dragonfly-s3_data_store>.freeze, [">= 0"])
    else
      s.add_dependency(%q<dragonfly>.freeze, ["~> 1.1"])
      s.add_dependency(%q<dragonfly-s3_data_store>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<dragonfly>.freeze, ["~> 1.1"])
    s.add_dependency(%q<dragonfly-s3_data_store>.freeze, [">= 0"])
  end
end
