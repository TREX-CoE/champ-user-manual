# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "CHAMP"
  spec.version       = "0.4.0.rc3"
  spec.authors       = ["Ravindra Shinde"]
  spec.email         = ["r.l.shinde@utwente.nl"]

  spec.summary       = %q{Cornell-Holland Ab-initio Materials Package}
  spec.homepage      = "https://github.com/filippi-claudia/champ"
  spec.license       = "MIT"
  spec.metadata      = {
    "bug_tracker_uri"   => "https://github.com/filippi-claudia/champ/issues",
    "changelog_uri"     => "https://github.com/filippi-claudia/champ/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://trex-coe.github.io/champ-user-manual/",
    "source_code_uri"   => "https://github.com/filippi-claudia/champ",
  }

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|bin|_layouts|_includes|lib|Rakefile|_sass|LICENSE|README|CHANGELOG|favicon)}i) }
  spec.executables   << 'champ'

  spec.add_development_dependency "bundler", "~> 2.3.5"
  spec.add_runtime_dependency "jekyll", ">= 3.8.5"
  spec.add_runtime_dependency "jekyll-seo-tag", ">= 2.0"
  spec.add_runtime_dependency "rake", ">= 12.3.1"
end
