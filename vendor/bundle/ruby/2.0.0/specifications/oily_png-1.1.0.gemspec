# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "oily_png"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Willem van Bergen"]
  s.date = "2013-02-15"
  s.description = "    This Ruby C extenstion defines a module that can be included into ChunkyPNG to improve its speed.\n"
  s.email = ["willem@railsdoctors.com"]
  s.extensions = ["ext/oily_png/extconf.rb"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "ext/oily_png/extconf.rb"]
  s.homepage = "http://wiki.github.com/wvanbergen/oily_png"
  s.rdoc_options = ["--title", "oily_png", "--main", "README.rdoc", "--line-numbers", "--inline-source"]
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = "oily_png"
  s.rubygems_version = "2.0.6"
  s.summary = "Native mixin to speed up ChunkyPNG"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chunky_png>, ["~> 1.2.7"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rake-compiler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2"])
    else
      s.add_dependency(%q<chunky_png>, ["~> 1.2.7"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rake-compiler>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2"])
    end
  else
    s.add_dependency(%q<chunky_png>, ["~> 1.2.7"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rake-compiler>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2"])
  end
end
