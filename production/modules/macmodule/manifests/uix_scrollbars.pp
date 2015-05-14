class macmodule::uix_scrollbars {


#always show scroll bars
include macdefaults
mac-defaults { "always show scroll bars":
      domain => '/Library/Preferences/.GlobalPreferences.plist',
      key => 'AppleShowScrollBars',
      type => 'string',
      value => Always,
}
}
