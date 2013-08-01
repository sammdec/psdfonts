# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "psd-enginedata"
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan LeFevre"]
  s.date = "2013-07-30"
  s.description = "Parser for the markup format used in the PSD file format"
  s.email = ["meltingice8917@gmail.com"]
  s.homepage = "http://cosmos.layervault.com/psdrb.html"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.6"
  s.summary = "Parser for the markup format used in the PSD file format"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hashie>, ["~> 2.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<rb-fsevent>, ["~> 0.9"])
    else
      s.add_dependency(%q<hashie>, ["~> 2.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<hashie>, ["~> 2.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
  end
end
