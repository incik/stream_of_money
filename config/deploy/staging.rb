set :stage,     :staging
set :deploy_to, '/var/www/stream_of_money_webapps_cz'
set :rails_env, 'staging'

server 'REPLACE_ME',
        user: 'stream_of_money_webapps_cz',
        roles: %w(web app db)

