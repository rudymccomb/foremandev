class users::rmccomb {

  include virtualusers
  User <| tag == 'ops' |>

  #or the following
  ##include virtualusers
  #User <| user == 'rmccomb' |>
  #

}
