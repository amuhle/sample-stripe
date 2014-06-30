# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{^test/.+_test\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "test/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "test/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["test/routing/#{m[1]}_routing_test.rb", "test/#{m[2]}s/#{m[1]}_#{m[2]}_test.rb", "test/acceptance/#{m[1]}_test.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "test" }
  watch('config/routes.rb')                           { "test/routing" }
  watch('app/controllers/application_controller.rb')  { "test/controllers" }

  # Capybara features specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "test/features/#{m[1]}_test.rb" }

  # Turnip features and steps
  watch(%r{^test/integration/(.+)\.spec.rb$})
end

