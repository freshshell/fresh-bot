require 'bundler/setup'
Bundler.require

nick = 'fredsh'
github_url = 'https://github.com/freshshell/fresh'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = 'irc.freenode.org'
    c.nick = nick
    c.realname = github_url
    c.channels = ['#freshshell']
  end

  on :message, /(^\d+$|#\d+)/ do |m, num|
    issue_number = num.tr('#', '')
    title = Github.new.issues.get('freshshell', 'fresh', issue_number)['title']
    m.reply "#{title} #{github_url}/issues/#{issue_number}"
  end

  on :message, /^#{nick}:? wiki/ do |m|
    m.reply "#{github_url}/wiki"
  end

  on :message, /^#{nick}:? dir.*/ do |m|
    m.reply "#{github_url}/wiki/Directory"
  end
end

bot.start
