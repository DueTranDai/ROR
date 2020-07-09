class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  belongs_to :site, optional: true
  belongs_to :role, optional: true
  has_many :good_catches
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
  def self.from_omniauth(auth)
    self.from_oauth(auth.provider, auth.uid, auth.info.email, auth.info.name, auth.credentials.token, Time.at(auth.credentials.expires_at))
  end
  def self.from_oauth(provider, uid, email, name, token, expires_at)
    user = User.where(email: email).first_or_create

    user.provider = provider
    user.uid = uid
    user.full_name = name if user.full_name.blank?

    user.oauth_token = token
    user.oauth_expires_at = expires_at

    current_time = Time.now
    if user.current_sign_in_at.present?
      user.last_sign_in_at = user.current_sign_in_at
    else
      user.last_sign_in_at = current_time
    end
    user.current_sign_in_at = current_time
    user.sign_in_count += 1

    authentication_token = Devise.friendly_token
    user.authentication_token = authentication_token

    user.save!
    user
  end
end
