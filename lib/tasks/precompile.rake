namespace :frontend do
  # TODO: yarn
  task :build do
    sh 'npm install'
    sh 'npm run build'
  end
end

Rake::Task['assets:precompile'].enhance(%i(frontend:build))
