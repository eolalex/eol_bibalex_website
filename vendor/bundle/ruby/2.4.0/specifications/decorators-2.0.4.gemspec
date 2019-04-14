# -*- encoding: utf-8 -*-
# stub: decorators 2.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "decorators".freeze
  s.version = "2.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Philip Arndt".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDhjCCAm6gAwIBAgIBATANBgkqhkiG9w0BAQUFADBNMQ0wCwYDVQQDDARnZW1z\nMREwDwYKCZImiZPyLGQBGRYBcDEVMBMGCgmSJomT8ixkARkWBWFybmR0MRIwEAYK\nCZImiZPyLGQBGRYCaW8wHhcNMTcwNzI1MTMxMjIwWhcNMTgwNzI1MTMxMjIwWjBN\nMQ0wCwYDVQQDDARnZW1zMREwDwYKCZImiZPyLGQBGRYBcDEVMBMGCgmSJomT8ixk\nARkWBWFybmR0MRIwEAYKCZImiZPyLGQBGRYCaW8wggEiMA0GCSqGSIb3DQEBAQUA\nA4IBDwAwggEKAoIBAQDrjwB8be48TFEvGweP7BwWFnmsL2IMU9Ts2UKKWK9GYr7Z\n5uNZFmO1yVBCrmUQHHDlpku6SN6HDO8ChDL7LNugz/4eapRTifHZl8jhPRsOLBcF\n1hANy/V2v5NNkL5Zvb+vsUa7lyjbIOoD5yYzSDl4/T0nOe6xYzxJgBuxZK/nWSOe\nDb8Uffc7B4yhA2kuayUiQUXPYAoPdfUSxoTKDohw17Sm6LKTpg8GkT0ttof1a/xu\nvdsTvZHIcTsYv16e+8SrwLRZ/iBVVsyZFkMYPMxemw7WHxmWElWIgW9S7pUK5Q7J\noMS5uJVbtV2EmV+cOnhOWDz1A16P7QRFmGje5L+vAgMBAAGjcTBvMAkGA1UdEwQC\nMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQWBBQ7G/yxuQIzgszkOkaZBgoKBJ1rozAa\nBgNVHREEEzARgQ9nZW1zQHAuYXJuZHQuaW8wGgYDVR0SBBMwEYEPZ2Vtc0BwLmFy\nbmR0LmlvMA0GCSqGSIb3DQEBBQUAA4IBAQB12WMsC+yuuIeM0Ib6HUYZ2IbhRnuW\n4uydNRvKDPdwzjChnOI0POGpcL8O1s1gh+19o/ITq6zRfTLhkwR2ir7XfwHJNppJ\nyg48wbdL5gpZwggKWggKX5G9pqv9LjRsSAew6r0WB+5KW+ArCl/iNo9+AdeR3nUx\nI+L/QiUxYU6XAXSrczL/i7kF5Xc3ZXQYuFsyGW9plA3i9faWUMvGKQc6pvUHIUZC\njOQmH9VbgbfUrXYM1YOKdlwW5sPR1f4PKLDlvEE+bppIUgKOgLOIv3i7KwrGvFOq\n5r7Wz/HY31SM47mkK21saPJG4NvUFEycf0wlpzP657Pl9aVo47aKKbxX\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2018-06-03"
  s.description = "Manages the process of loading decorators into your Rails application.".freeze
  s.email = "gems@p.arndt.io".freeze
  s.homepage = "https://github.com/parndt/decorators".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Rails decorators plugin.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, ["< 6", ">= 4.0.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.5.0", "~> 3.5"])
    else
      s.add_dependency(%q<railties>.freeze, ["< 6", ">= 4.0.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 3.5.0", "~> 3.5"])
    end
  else
    s.add_dependency(%q<railties>.freeze, ["< 6", ">= 4.0.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.5.0", "~> 3.5"])
  end
end
