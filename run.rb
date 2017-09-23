#!/usr/bin/env ruby

require 'benchmark'
require 'faker'
require 'byebug'
if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2.4.0')
  require 'active_support/core_ext/enumerable'
end

class Klass
  def self.keyed(s1: s1, s2: s2)
    s1 + s2
  end

  def self.array(s1,s2)
    s1 + s2
  end
end


NUM_RUNS = 1000000
s1 = Faker::Lorem.sentence
s2 = Faker::Lorem.sentence

Benchmark.bm do |x|
  x.report('Keyed Args') do
    for i in 1..NUM_RUNS
      Klass.keyed( s1: s1, s2: s2 )
    end
  end
  x.report('Simple') do
    for i in 1..NUM_RUNS
      Klass.array( s1, s2 )
    end
  end
end
