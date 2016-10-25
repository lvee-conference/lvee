desc "Get role admin and activation by first user"
task :get_role_admin  => :environment do
  User.first.update(role: "admin", activated_at: "2001-01-01 01:01:01")
  puts "#{User.first.login} was activated"
end

desc "Get role admin and activation by any id"
task :get_role_admin_ids  => :environment do
  ARGV.each { |a| task a.to_sym do puts a; end }
  ARGV.each_index do |b|
    puts ARGV[b]
    if b > 0
      User.find(ARGV[b]).update(role: "admin", activated_at: "2001-01-01 01:01:01")
      puts "#{User.find(ARGV[b])} was activated"
    end
  end
end
