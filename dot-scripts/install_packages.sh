
#!/bin/bash
installable_packages=$(comm -12 <(yay -Slq | sort) <(sort PACKAGES.txt))
yay -S --needed $installable_packages
