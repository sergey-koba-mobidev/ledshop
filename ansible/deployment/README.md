# Ansible
`ansible-playbook -i inventories/production appservers.yml`

# Capistrano
`cap production deploy`

# Problems
512 ram (DigitalOcean) is not enough for assets precompile you should create swap file:
http://stackoverflow.com/questions/22272339/rake-assetsprecompile-gets-killed-when-there-is-a-console-session-open-in-produ