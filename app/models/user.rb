class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :site, optional: true
  
  def site_name
    self.site.blank? ? nil : self.site.name
  end
  def status_class
    self.disabled ? 'm-badge--danger' : 'm-badge--success'
  end

  def status_text
    self.disabled ? I18n.t('views.users.status.disable') : I18n.t('views.users.status.enable')
  end
  def role_name
    return I18n.t('views.users.roles.super_admin') if self.is_super_admin
    self.role.present? ? self.role.name : I18n.t('views.users.roles.user')
  end
  def is_super_admin
    SUPER_ADMIN.include?(email)
  end
  def can_edit(current_user)
    # return false if self.is_super_admin && self.id != current_user.id
    return true
  end
end
