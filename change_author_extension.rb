# Uncomment this if you reference any of your controllers in activate
require "radiant-change_author-extension"

class ChangeAuthorExtension < Radiant::Extension
  version RadiantChangeAuthorExtension::VERSION
  description RadiantChangeAuthorExtension::DESCRIPTION
  url RadiantChangeAuthorExtension::URL
  
  def activate
    if ActiveRecord::Base.connection.tables.include?('config')
      Radiant::Config['roles.pages.allow_author_change'] = true unless Radiant::Config['roles.pages.allow_author_change']
    end
    admin.pages.edit.add :layout, "author_select", :after => "edit_published_at"
    if admin.respond_to?(:help)
      admin.help.index.add :page_type, "author_select"  
    end
    UserActionObserver.class_eval {
      def before_create(model)
        model.created_by = UserActionObserver.current_user if model.created_by_id.blank?
      end
    }
  end
  
  def deactivate
  end
  
end