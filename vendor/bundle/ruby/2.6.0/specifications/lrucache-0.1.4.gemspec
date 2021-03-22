# -*- encoding: utf-8 -*-
# stub: lrucache 0.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "lrucache".freeze
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Johnson".freeze]
  s.date = "2012-11-28"
  s.description = "A simple LRU-cache based on a hash and priority queue".freeze
  s.email = ["chris@kindkid.com".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.7".freeze
  s.summary = "A simple LRU-cache based on a hash and priority queue".freeze

  s.installed_by_version = "3.2.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<PriorityQueue>.freeze, ["~> 0.1.2"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 2.12.0"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.7.1"])
    s.add_development_dependency(%q<rb-fsevent>.freeze, ["~> 0.9.2"])
    s.add_development_dependency(%q<guard>.freeze, ["~> 1.5.4"])
    s.add_development_dependency(%q<guard-bundler>.freeze, ["~> 1.0.0"])
    s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 2.2.1"])
    s.add_development_dependency(%q<timecop>.freeze, ["~> 0.5.3"])
  else
    s.add_dependency(%q<PriorityQueue>.freeze, ["~> 0.1.2"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.12.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.7.1"])
    s.add_dependency(%q<rb-fsevent>.freeze, ["~> 0.9.2"])
    s.add_dependency(%q<guard>.freeze, ["~> 1.5.4"])
    s.add_dependency(%q<guard-bundler>.freeze, ["~> 1.0.0"])
    s.add_dependency(%q<guard-rspec>.freeze, ["~> 2.2.1"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.5.3"])
  end
end
