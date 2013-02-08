# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{qif}
  s.version = "0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeremy Wells"]
  s.date = %q{2010-11-09}
  s.description = %q{A library for reading and writing quicken QIF files.}
  s.email = %q{jemmyw@gmail.com}
  s.extra_rdoc_files = ["CHANGELOG", "LICENSE", "lib/qif.rb", "lib/qif/date_format.rb", "lib/qif/reader.rb", "lib/qif/transaction.rb", "lib/qif/writer.rb"]
  s.files = ["CHANGELOG", "LICENSE", "Manifest", "Rakefile", "lib/qif.rb", "lib/qif/date_format.rb", "lib/qif/reader.rb", "lib/qif/transaction.rb", "lib/qif/writer.rb", "qif.gemspec", "spec/fixtures/3_records_ddmmyy.qif", "spec/fixtures/3_records_ddmmyyyy.qif", "spec/fixtures/3_records_mmddyy.qif", "spec/fixtures/3_records_mmddyyyy.qif", "spec/lib/date_format_spec.rb", "spec/lib/reader_spec.rb", "spec/lib/transaction_spec.rb", "spec/lib/writer_spec.rb", "spec/spec.opts", "spec/spec_helper.rb"]
  s.homepage = %q{}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Qif"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{qif}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A library for reading and writing quicken QIF files.}
end
