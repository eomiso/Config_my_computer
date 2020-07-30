if command -v curl &> /dev/null; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
elif command -v wget &> /dev/null; then
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo -en "You need curl or wget. "
  echo "Unexpected termination of $0"
  exit 0
fi

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
