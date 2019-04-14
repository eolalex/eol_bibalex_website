# -*- encoding: utf-8 -*-
# stub: refinerycms-resources 4.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "refinerycms-resources".freeze
  s.version = "4.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Philip Arndt".freeze, "U\u0123is Ozols".freeze, "Rob Yurkowski".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDhjCCAm6gAwIBAgIBATANBgkqhkiG9w0BAQUFADBNMQ0wCwYDVQQDDARnZW1z\nMREwDwYKCZImiZPyLGQBGRYBcDEVMBMGCgmSJomT8ixkARkWBWFybmR0MRIwEAYK\nCZImiZPyLGQBGRYCaW8wHhcNMTcwNzI1MTMxMjIwWhcNMTgwNzI1MTMxMjIwWjBN\nMQ0wCwYDVQQDDARnZW1zMREwDwYKCZImiZPyLGQBGRYBcDEVMBMGCgmSJomT8ixk\nARkWBWFybmR0MRIwEAYKCZImiZPyLGQBGRYCaW8wggEiMA0GCSqGSIb3DQEBAQUA\nA4IBDwAwggEKAoIBAQDrjwB8be48TFEvGweP7BwWFnmsL2IMU9Ts2UKKWK9GYr7Z\n5uNZFmO1yVBCrmUQHHDlpku6SN6HDO8ChDL7LNugz/4eapRTifHZl8jhPRsOLBcF\n1hANy/V2v5NNkL5Zvb+vsUa7lyjbIOoD5yYzSDl4/T0nOe6xYzxJgBuxZK/nWSOe\nDb8Uffc7B4yhA2kuayUiQUXPYAoPdfUSxoTKDohw17Sm6LKTpg8GkT0ttof1a/xu\nvdsTvZHIcTsYv16e+8SrwLRZ/iBVVsyZFkMYPMxemw7WHxmWElWIgW9S7pUK5Q7J\noMS5uJVbtV2EmV+cOnhOWDz1A16P7QRFmGje5L+vAgMBAAGjcTBvMAkGA1UdEwQC\nMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQWBBQ7G/yxuQIzgszkOkaZBgoKBJ1rozAa\nBgNVHREEEzARgQ9nZW1zQHAuYXJuZHQuaW8wGgYDVR0SBBMwEYEPZ2Vtc0BwLmFy\nbmR0LmlvMA0GCSqGSIb3DQEBBQUAA4IBAQB12WMsC+yuuIeM0Ib6HUYZ2IbhRnuW\n4uydNRvKDPdwzjChnOI0POGpcL8O1s1gh+19o/ITq6zRfTLhkwR2ir7XfwHJNppJ\nyg48wbdL5gpZwggKWggKX5G9pqv9LjRsSAew6r0WB+5KW+ArCl/iNo9+AdeR3nUx\nI+L/QiUxYU6XAXSrczL/i7kF5Xc3ZXQYuFsyGW9plA3i9faWUMvGKQc6pvUHIUZC\njOQmH9VbgbfUrXYM1YOKdlwW5sPR1f4PKLDlvEE+bppIUgKOgLOIv3i7KwrGvFOq\n5r7Wz/HY31SM47mkK21saPJG4NvUFEycf0wlpzP657Pl9aVo47aKKbxX\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2018-05-21"
  s.description = "Handles all file upload and processing functionality in Refinery CMS.".freeze
  s.email = "refinerycms@p.arndt.io".freeze
  s.homepage = "https://www.refinerycms.com".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2".freeze)
  s.rubyforge_project = "refinerycms".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Resources extension for Refinery CMS".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<acts_as_indexed>.freeze, ["~> 0.8.0"])
      s.add_runtime_dependency(%q<dragonfly>.freeze, [">= 1.1.0", "~> 1.1"])
      s.add_runtime_dependency(%q<globalize>.freeze, ["< 5.2", ">= 5.1.0.beta1"])
      s.add_runtime_dependency(%q<activemodel-serializers-xml>.freeze, [">= 1.0.1", "~> 1.0"])
      s.add_runtime_dependency(%q<refinerycms-core>.freeze, ["= 4.0.2"])
      s.add_runtime_dependency(%q<refinerycms-dragonfly>.freeze, ["~> 1.0"])
    else
      s.add_dependency(%q<acts_as_indexed>.freeze, ["~> 0.8.0"])
      s.add_dependency(%q<dragonfly>.freeze, [">= 1.1.0", "~> 1.1"])
      s.add_dependency(%q<globalize>.freeze, ["< 5.2", ">= 5.1.0.beta1"])
      s.add_dependency(%q<activemodel-serializers-xml>.freeze, [">= 1.0.1", "~> 1.0"])
      s.add_dependency(%q<refinerycms-core>.freeze, ["= 4.0.2"])
      s.add_dependency(%q<refinerycms-dragonfly>.freeze, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<acts_as_indexed>.freeze, ["~> 0.8.0"])
    s.add_dependency(%q<dragonfly>.freeze, [">= 1.1.0", "~> 1.1"])
    s.add_dependency(%q<globalize>.freeze, ["< 5.2", ">= 5.1.0.beta1"])
    s.add_dependency(%q<activemodel-serializers-xml>.freeze, [">= 1.0.1", "~> 1.0"])
    s.add_dependency(%q<refinerycms-core>.freeze, ["= 4.0.2"])
    s.add_dependency(%q<refinerycms-dragonfly>.freeze, ["~> 1.0"])
  end
end
