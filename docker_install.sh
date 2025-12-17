# Clean any previous Docker repo
sudo rm /etc/apt/sources.list.d/docker.list

# Install prerequisites
sudo apt update && sudo apt install -y \
    ca-certificates curl gnupg lsb-release

# Add Docker’s GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use Debian 'bookworm' instead of Kali
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian bookworm stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update and install Docker
sudo apt update && sudo apt install -y \
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Optional: Run Docker as non-root
sudo usermod -aG docker $USER && newgrp docker

