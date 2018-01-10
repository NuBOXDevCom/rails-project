class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= UserApi.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user ||= errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['X-Auth-Token'].present?
      return headers['X-Auth-Token'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end