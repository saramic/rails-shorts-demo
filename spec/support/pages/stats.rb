module Pages
  class Stats < SitePrism::Section
    element :stat_id, :qa, 'stat-id'
    element :created_at, :qa, 'created-at'
    element :remote_addr, :qa, 'remote-addr'
    element :server_name, :qa, 'server-name'
    element :accept_language, :qa, 'accept-language'
    element :user_agent, :qa, 'user-agent'
  end
end
