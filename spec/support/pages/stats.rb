class Stats < SitePrism::Section
  element :stat_id, '[data-testid=stat-id]'
  element :created_at, '[data-testid=created-at]'
  element :remote_addr, '[data-testid=remote-addr]'
  element :server_name, '[data-testid=server-name]'
  element :accept_language, '[data-testid=accept-language]'
  element :user_agent, '[data-testid=user-agent]'
end
