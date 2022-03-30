# -*- encoding: utf-8 -*-
# stub: i18n-debug 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "i18n-debug".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Philipe Fatio".freeze]
  s.date = "2018-10-11"
  s.description = "Ever wondered which translations are being looked up by Rails, a gem, or simply your app? Wonder no more!".freeze
  s.email = "me@phili.pe".freeze
  s.homepage = "https://github.com/fphilipe/i18n-debug".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Ever wondered which translations are being looked up by Rails, a gem, or simply your app? Wonder no more!".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.8"])
      s.add_runtime_dependency(%q<i18n>.freeze, ["< 2"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.8"])
      s.add_dependency(%q<i18n>.freeze, ["< 2"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.8"])
    s.add_dependency(%q<i18n>.freeze, ["< 2"])
  end
end
