set :stage,     :production
set :rails_env, 'production'
set :deploy_to, '/var/www/stream_of_money_com'

server 'REPLACE_ME',
       user: 'stream_of_money',
       roles: %w(web app db)
