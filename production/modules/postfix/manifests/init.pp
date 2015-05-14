# core postfix # == Class: postpostfix
#
class postfix {
  # resources
  include postfix::install
  include postfix::config
  include postfix::service
}
