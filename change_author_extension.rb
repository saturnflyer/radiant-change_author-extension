# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ChangeAuthorExtension < Radiant::Extension
  version "1.0"
  description "Allows administrators to change the author of a page."
  url "http://saturnflyer.com/"
  
  def activate
    if ActiveRecord::Base.connection.tables.include?('config')
      Radiant::Config['roles.pages.allow_author_change'] = true unless Radiant::Config['roles.pages.allow_author_change']
    end
    admin.page.edit.add :form, 'author_select'
    if admin.respond_to?(:help)
      admin.help.index.add :page_type, "author_select"  
    end
    UserActionObserver.class_eval {
      def before_create(model)
        model.created_by = @@current_user if model.created_by_id.blank?
      end
    }
  end
  
  def deactivate
  end
  
end