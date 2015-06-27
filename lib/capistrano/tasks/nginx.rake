namespace :nginx do
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      execute "sudo service nginx restart"
    end
  end
end