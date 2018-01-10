module ApplicationHelper
  def jwt_token
    payload = {
        :user_id => current_user.id,
        :user_name => current_user.username,
        :exp => Time.now.to_i + 60
    }
    JWT.encode payload, '4fvs6d51fv815s1bsg651fdv81fb65fs1gnd1dq62d1vs8b1e951tui9n1bv5dcs9c15qsc1vg65hd1u9kuiy156g1fev'
  end

  def remote_ip
    r = RestClient.get'http://ip-api.com/json'
    JSON.parse(r)['query']
  end

  def get_ip_info
    r = RestClient.get'http://ip-api.com/json/' + remote_ip
    JSON.parse(r)
  end
end
