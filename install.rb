files = [
  '.gitconfig',
  '.gitmessage'
]

files.each do |file|
  target_file = File.expand_path("~/#{ file }")
  source_file = File.expand_path("~/.dotfiles/#{ file }")

  puts "skipping #{ target_file }" if File.exists?(target_file)

  unless File.exists?(target_file) || File.symlink?(target_file)
    File.symlink(source_file, target_file)
  end
end

# sublime text
target_file = File.expand_path("~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings")
source_file = File.expand_path("~/.dotfiles/sublime/Preferences.sublime-settings")

if File.exists?(target_file) && ! File.symlink?(target_file)
  File.delete(target_file)
else
  File.symlink(source_file, target_file)
end