require 'oauth2'
client = OAuth2::Client.new('x', 'y', :site => 'https://auth.teamsnap.com')

client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/auth/teamsnap')
# => "https://example.org/oauth/authorization?response_type=code&client_id=client_id&redirect_uri=http://localhost:8080/oauth2/callback"

token = client.auth_code.get_token('z', :redirect_uri => 'http://localhost:3000/auth/teamsnap')

# # token = client.auth_code.get_token('c94206bcc9903077ee03a14c430eecf2fa3ba6ec041503b1c9fa35fb2e4c8975', :redirect_uri => 'http://localhost:3000/auth/teamsnap', :headers => {'Authorization' => 'Basic some_password'})
# response = token.get('/api/resource', :params => { 'query_foo' => 'bar' })
# response.class.name
# => OAuth2::Response


# Client ID:
#
# 898b70bbfee64c70b65ce803f2406f694f4e2f104f95cceab0fb38ec9a5cab19
#
# Client Secret:
#
# 3a18e27cea7c0952300309d6589e6540fd9977c57dd52318653bb474a929c079
#
# Callback urls:
#
# http://localhost:3000/auth/teamsnap	Authorize
# https://snap-me-up.herokuapp.com/auth/teamsnap
