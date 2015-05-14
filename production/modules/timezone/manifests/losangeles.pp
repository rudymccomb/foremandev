class timezone::losangeles {
	#hq location
	class { 'timezone':
  		region   => 'America',
  		locality => 'Los_Angeles',
	}
}
