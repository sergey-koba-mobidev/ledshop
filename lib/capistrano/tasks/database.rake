namespace :database do
  task :seed do
    on roles(:db), in: :sequence, wait: 5 do
      within release_path do
        execute :rake, 'db:seed'
      end
    end
  end
end