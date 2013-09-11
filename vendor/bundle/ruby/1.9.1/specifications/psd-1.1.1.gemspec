# -*- encoding: utf-8 -*-
# stub: psd 1.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "psd"
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan LeFevre", "Kelly Sutton"]
  s.date = "2013-09-11"
  s.description = "Parse Photoshop PSD files with ease"
  s.email = ["ryan@layervault.com", "kelly@layervault.com"]
  s.homepage = "http://cosmos.layervault.com/psdrb.html"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.1"
  s.summary = "General purpose library for parsing Photoshop files"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bindata>, [">= 0"])
      s.add_runtime_dependency(%q<oily_png>, [">= 0"])
      s.add_runtime_dependency(%q<psd-enginedata>, ["~> 1.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<rb-fsevent>, ["~> 0.9"])
    else
      s.add_dependency(%q<bindata>, [">= 0"])
      s.add_dependency(%q<oily_png>, [">= 0"])
      s.add_dependency(%q<psd-enginedata>, ["~> 1.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<bindata>, [">= 0"])
    s.add_dependency(%q<oily_png>, [">= 0"])
    s.add_dependency(%q<psd-enginedata>, ["~> 1.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
  end
end
