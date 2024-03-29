# -*- encoding: utf-8 -*-
# stub: PriorityQueue 0.1.2 ruby lib lib ext
# stub: ext/priority_queue/extconf.rb

Gem::Specification.new do |s|
  s.name = "PriorityQueue".freeze
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze, "lib".freeze, "ext".freeze]
  s.authors = ["Brian Schroeder".freeze]
  s.autorequire = "priority_queue.rb".freeze
  s.date = "2005-10-30"
  s.description = "This is a fibonacci-heap priority-queue implementation. That means  insert: O(1) decrease_priority: Amortized O(1) delete_min:        Amortized O(log n) This project is different from K. Kodamas PQueue in that it allows a decrease key operation.  That makes PriorityQueue usable for algorithms like dijkstras shortest path algorithm, while PQueue is more suitable for Heapsort and the like.".freeze
  s.email = "priority_queue@brian-schroeder.de".freeze
  s.extensions = ["ext/priority_queue/extconf.rb".freeze]
  s.files = ["ext/priority_queue/extconf.rb".freeze]
  s.homepage = "http://ruby.brian-schroeder.de/priority_queue".freeze
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0".freeze)
  s.rubygems_version = "3.2.7".freeze
  s.summary = "This is a fibonacci-heap priority-queue implementation".freeze

  s.installed_by_version = "3.2.7" if s.respond_to? :installed_by_version
end
