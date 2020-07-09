# Main app constants
DEFAULT_PER_PAGE = ENV['DEFAULT_PER_PAGE'] || 10
SUPER_ADMIN = %w(admin@maildrop.cc)
APPLICATION_NAME = ENV['APPLICATION_NAME'] || 'Ruby Sample'
COMPANY_NAME = ENV['COMPANY_NAME'] || 'Allied Solutions'

# ==> GOOGLE LOGIN
GOOGLE_LOGIN = {
    :KEY              => ENV['GOOGLE_LOGIN_KEY']                || '428129224378-i2jagln0fu4uclcut79ph21661nna5if.apps.googleusercontent.com',
    :SECRET           => ENV['GOOGLE_LOGIN_SECRET']             || '553uxwxVuqWpL6SMTwRcmzlY',
    :TOKEN_INFO_URL   => 'https://www.googleapis.com/oauth2/v3/tokeninfo?access_token='
}.freeze