__END__
require 'oauth2'
client = OAuth2::Client.new('x', 'y', :site => 'https://auth.teamsnap.com')

client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/auth/teamsnap')
# => "https://example.org/oauth/authorization?response_type=code&client_id=client_id&redirect_uri=http://localhost:8080/oauth2/callback"

token = client.auth_code.get_token('t', :redirect_uri => 'http://localhost:3000/auth/teamsnap')

# # token = client.auth_code.get_token('t', :redirect_uri => 'http://localhost:3000/auth/teamsnap', :headers => {'Authorization' => 'Basic some_password'})
# response = token.get('/api/resource', :params => { 'query_foo' => 'bar' })
# response.class.name
# => OAuth2::Response

#
# Callback urls:
#
# http://localhost:3000/auth/teamsnap	Authorize
# https://snap-me-up.herokuapp.com/auth/teamsnap
