# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "mina-composer"
  s.version     = File.read('VERSION')
  s.authors     = ["Daniel Pakuschewski"]
  s.email       = ["contato@danielpk.com.br"]
  s.homepage    = "http://github.com/danielpk/mina-composer"
  s.summary     = "Composer support for Mina"
  s.description = "Run composer with Mina."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "mina"
end