TSHIRT_SIZES = %w(S M L XL XXL)

NEW_STATUS = "new"
APPROVED_STATUS = "approved"
CANCELLED_STATUS = "cancelled"

IMAGE_WEB_ROOT = 'images/uploaded'
IMAGE_UPLOAD_ROOT = File.join(Rails.root, 'public', 'images', 'uploaded')


ALL_USER_MAILLIST = "maillist"
TALKS_MAILLIST = "talks"
ADMIN_MAILLIST = "orgmaillist"

AVATAR_SIZE = [500, 500]
LIST_AVATAR_SIZE = [100, 75]

RANDOM_PHOTOS_ROOT = 'images/random_photos'

# Map old language names to new
LANGUAGE_MAP = {
  "by" => "be",
  "ua" => "uk"
}

LOCALE_MAP = {
    "ru" => "ru_RU",
    "en" => "en_US"
}

# Diff stuff
INS_STYLE = "background-color: #AAFFAA; text-decoration:none;"
DEL_STYLE = "background-color: #FF9999; text-decoration:none;"
INS_CLASS = "ins"
DEL_CLASS = "del"

# Statistics
STATISTICS_TYPES = [
  :total_registrations,
  :approved_registrations,
  :total_men,
  :approved_men,
]

TRANSPORT = %w(bus_minsk independent)
AGE = %w(18–24 25–34 35–44 45–54 55–64 65_and_older)
POSITION = %w(developer/tester system_administrator devops manager director/business_owner other)
KNOWN = %w(was_last_year e-mail_delivery news_on_the_site social_networks post_of_a_friend called_a_friend found_on_search other)

SPONSOR_TYPES = [
  ["sponsor", "sponsors"],
  ["technical", "technical_sponsor"],
  ["information", "information_sponsor"],
  ["tech_partner", "technical_partner"],
  ["hidden", "hidden"],
]

DEFAULT_LICENSE = "Creative Commons Attribution-ShareAlike 3.0"

LATEX_WS_BASE = 'http://www.codecogs.com/png.latex?'

SITE_DOMAIN = ENV['DOMAIN'] || "lvee.org"
SITE_PROTOCOL = ENV['PROTOCOL'] || "https"
SITE_URL = "#{SITE_PROTOCOL}://#{SITE_DOMAIN}/"
SITE_TITLE = ENV['TITLE'] || "LVEE"
SITE_FULL_TITLE = ENV['FULL_TITLE'] || "Linux Vacation/Eastern Europe"
INFO_MAIL = ENV['EMAIL'] || "info@lvee.org"
MOBILE_COLOR = ENV['MOBILE_COLOR'] || "#009933"


EVENTSME = {:id => "", :tickets => {:room => [], :floor => []}}
