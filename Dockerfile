FROM ubuntu:xenial

RUN apt-get update && \
        apt-get install --no-install-recommends software-properties-common -y && \
        rm -rf /var/lib/apt/lists/*

# Install OpenSSH Server & zsh/vim/sudo deps
RUN add-apt-repository ppa:neovim-ppa/unstable -y && \
        apt-get update && \
        apt-get install -y --no-install-recommends openssh-server zsh git highlight curl tmux neovim sudo && \
        mkdir -p /var/run/sshd && \
        # Create new SSH Host Keys every build to avoid fingerprint issues
        rm -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -t dsa -N '' -f /etc/ssh/ssh_host_dsa_key && \
        rm -f /etc/ssh/ssh_host_rsa_key && ssh-keygen -t rsa -N '' -f /etc/ssh/ssh_host_rsa_key && \
        rm -f /etc/ssh/ssh_host_ecdsa_key && ssh-keygen -t ecdsa -N '' -f /etc/ssh/ssh_host_ecdsa_key && \
        rm -f /etc/ssh/ssh_host_ed25519_key && ssh-keygen -t ed25519 -N '' -f /etc/ssh/ssh_host_ed25519_key && \
        rm -rf /var/lib/apt/lists/*

# Add Vagrant User & SSH Keys
RUN useradd -m vagrant -G sudo -s /bin/bash && \
        mkdir -p /home/vagrant/.ssh && \
        chmod 700 /home/vagrant/.ssh && \
        curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub >> /home/vagrant/.ssh/authorized_keys && \
        chmod 600 /home/vagrant/.ssh/authorized_keys && \
        # Add zsh & vim deps
        git clone https://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh && \
        curl -fLo /home/vagrant/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
        curl -fLo /home/vagrant/.oh-my-zsh/custom/themes/bullet-train.zsh-theme --create-dirs  http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme && \
        chown -R vagrant:vagrant /home/vagrant/.ssh /home/vagrant/.config /home/vagrant/.oh-my-zsh && \
        # Add vagrant user to sudo group
        echo "#includedir /etc/sudoers.d" >> /etc/sudoers && \
        echo "vagrant            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

# Expose port 22 for ssh
EXPOSE 22

# Run SSH Server
CMD ["/usr/sbin/sshd", "-D"]
