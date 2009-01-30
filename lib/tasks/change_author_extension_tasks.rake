namespace :radiant do
  namespace :extensions do
    namespace :change_author do
      
      desc "Runs the migration of the Change Author extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          ChangeAuthorExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          ChangeAuthorExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Change Author to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from ChangeAuthorExtension"
        Dir[ChangeAuthorExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(ChangeAuthorExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
