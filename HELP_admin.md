As an administrator, you may setup pages for your other users but may ultimately want them
to be the authors of the individual pages.

When you have set `Radiant::Config['roles.pages.allow_author_change'] = true` (done by default)
you'll be able to select from a list of users as the author when creating or editing a page.

If you want to turn off this feature, simply set `Radiant::Config['roles.pages.allow_author_change'] = false`
and restart the application.