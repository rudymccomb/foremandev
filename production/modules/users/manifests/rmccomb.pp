class users::rmccomb {

  include virtualusers
  User <| user == 'rmccomb' |>

  #or the following
  #include virtualusers
  #User <| tag == 'ops' |>


}
