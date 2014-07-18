guard :bundler do
  watch('Gemfile')
end

guard :rspec do
  watch(%r{^lib/(.+)\.rb$})     { "spec" }
  watch(%r{^spec/(.+)\.rb$})     { "spec" }
end

