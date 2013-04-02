# ruby 1.8.7 compatible
require 'rubygems'

if defined?(::Bundler) or true
  global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
  global_gemset ||= ENV['_ORIGINAL_GEM_PATH'].split(':').grep(/ruby.*@global/).first
  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end

require 'pry'
Pry.start
exit
