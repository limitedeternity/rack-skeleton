require 'bundler/setup'

Bundler.require(:default, ENV['RACK_ENV'])

use Rack::StaticCache, 
		:urls => ['/images', '/css', '/js', '/fonts'],
		:root => 'public'

use Rack::Rewrite do
  rewrite '/', '/index.html'
end

use Rack::Deflater

use Rack::ResponseHeaders do |headers|
	headers['X-Content-Type-Options'] = 'nosniff'
	headers['X-Frame-Options'] = 'DENY'
	headers['X-XSS-Protection'] = '1; mode=block'
	headers['Strict-Transport-Security'] = 'max-age=31536000; includeSubDomains'
end

run Rack::Directory.new('public')
