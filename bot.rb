require 'cinch'

nick = 'fredsh'
github_url = 'http://github.com/freshshell/fresh'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = 'irc.freenode.org'
    c.nick = nick
    c.channels = ['#freshshell']
  end

  on :message, /(^\d+$|#\d+)/ do |m, num|
    m.reply "#{github_url}/issues/#{num.tr('#', '')}"
  end

  on :message, /^#{nick}:? wiki/ do |m|
    m.reply "#{github_url}/wiki"
  end

  on :message, /^#{nick}:? dir.*/ do |m|
    m.reply "#{github_url}/wiki/Directory"
  end
end

bot.start
