class users::dummy {

  include virtualusers
  User <| tag == 'ops' |>

}
