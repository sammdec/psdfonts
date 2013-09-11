# -*- encoding: utf-8 -*-
# stub: shotgun 0.9 ruby lib

Gem::Specification.new do |s|
  s.name = "shotgun"
  s.version = "0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Tomayko"]
  s.date = "2011-02-24"
  s.description = "reloading rack development server"
  s.email = "rtomayko@gmail.com"
  s.executables = ["shotgun"]
  s.extra_rdoc_files = ["README"]
  s.files = ["bin/shotgun", "README"]
  s.homepage = "http://github.com/rtomayko/shotgun"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.1"
  s.summary = "reloading rack development server"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 1.0"])
    else
      s.add_dependency(%q<rack>, [">= 1.0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 1.0"])
  end
end
