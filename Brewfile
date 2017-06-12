cask_args appdir: '/Applications'

brew 'git'

tap 'homebrew/services'
tap 'homebrew/bundle'

brew 'postgresql'
brew 'phantomjs'
brew 'gist'
brew 'openssh'
brew 'qt@5.5'
brew 'python'
brew 'wget'
brew 'openssl'
brew 'pkg-config'
brew 'node'
brew 'librsvg'
brew 'imagemagick', args: ['with-librsvg']
brew 'apm-bash-completion'
brew 'zsh'
brew 'zsh-completions'

for app in 'java', 'alfred', 'atom', 'flowdock', 'firefox', 'google-chrome', 'sourcetree', 'citrix-receiver', 'adobe-creative-cloud', 'android-platform-tools', 'android-sdk', 'android-studio'
; do
  cask $app
  defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications -iname $app*.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done 

killall Dock
