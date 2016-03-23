Rails.env.on(:development) do
  # https://github.com/flyerhzm/bullet
  config.after_initialize do
    Bullet.enable = true # enable Bullet gem, otherwise do nothing
    Bullet.bullet_logger = true # log to the Bullet log file (Rails.root/log/bullet.log)
    Bullet.rails_logger = true # add warnings directly to the Rails log
    # Bullet.console = true # log warnings to your browser's console.log (Safari/Webkit browsers or Firefox w/Firebug installed)
    # Bullet.alert = true # pop up a JavaScript alert in the browser
    # Bullet.growl = true # pop up Growl warnings if your system has Growl installed. Requires a little bit of configuration
    # Bullet.xmpp = { :account  => 'bullets_account@jabber.org', # send XMPP/Jabber notifications to the receiver indicated.
    #                 :password => 'bullets_password_for_jabber',
    #                 :receiver => 'your_account@jabber.org',
    #                 :show_online_status => true }
    # Bullet.bugsnag = true # add notifications to bugsnag
    # Bullet.airbrake = true # add notifications to airbrake
    # Bullet.rollbar = true # add notifications to rollbar
    # Bullet.raise = true # raise errors, useful for making your specs fail unless they have optimized queries
    # Bullet.add_footer = true # adds the details in the bottom left corner of the page
    # Bullet.stacktrace_includes = [ 'your_gem', 'your_middleware' ] # include paths with any of these substrings in the stack trace, even if they are not in your main app
  end
end
