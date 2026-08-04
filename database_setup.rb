require 'yaml'
class DatabaseSetup

  def set_db
    data = YAML.load_file('config/database.yml', aliases: true)

    env        = ARGV[0] || ENV["RAILS_ENV"] || "development"
    db_user    = data[env]["username"]
    db_name    = data[env]["database"]
    db_pass    = data[env]["password"]
    sudo       = ""

    command = "echo #{sudo} | sudo -u postgres createuser #{db_user}"
    system command

    command = "echo #{sudo} | sudo -u postgres createdb -e --encoding=UTF8 -l hr_HR.UTF-8 -T template0 -O #{db_user} #{db_name}"
    system command

    command = "echo #{sudo} | sudo -u postgres -H -- psql -d #{db_name} -c \"alter user #{db_user} with encrypted password '#{db_pass}';\""
    system command

    command = "echo #{sudo} | sudo -u postgres -H -- psql -d #{db_name} -c \"grant all privileges on database #{db_name} to #{db_user};\""
    system command

    if File.exist?("dump.sql")
      command = "echo #{sudo} | sudo -u postgres -H -- psql -d #{db_name} -f dump.sql"
      system command

      # dump.sql is loaded as the postgres superuser, so every table/sequence
      # it creates ends up owned by postgres. The DB-level grant above does
      # NOT cover table privileges, so without this the app user can connect
      # but gets "permission denied for relation ..." on every query.
      command = "echo #{sudo} | sudo -u postgres -H -- psql -d #{db_name} -c \"grant all privileges on all tables in schema public to #{db_user};\""
      system command

      command = "echo #{sudo} | sudo -u postgres -H -- psql -d #{db_name} -c \"grant all privileges on all sequences in schema public to #{db_user};\""
      system command
    end
  end

end

db = DatabaseSetup.new
db.set_db
