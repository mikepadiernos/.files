
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zpm-zsh/check-deps ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/check-deps                                           # check-deps
git clone https://github.com/voronkovich/ddev.plugin.zsh ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/ddev                                        # ddev
git clone https://github.com/unixorn/docker-helpers.zshplugin ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/docker-helpers                         # docker-helpers
git clone https://github.com/yhaefliger/zsh-drupal.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/drupal                                                # drupal
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting     # fast-syntax-highlighting
# git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin                             # fzf-zsh-plugin
git clone https://github.com/mannuel/lando-alias-zsh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/lando-alias-zsh                                     # lando-alias-zsh
git clone https://github.com/akash329d/zsh-alias-finder ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-alias-finder                                     # zsh-alias-finder
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete            # zsh-autocomplete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions                               # zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions                               # zsh-completions
git clone https://github.com/renovate-bot/z-shell-_-zsh-eza.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-eza                                      # zsh-eza
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search                      # zsh-fzf-history-search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search             # zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting                   # zsh-syntax-highlighting

git clone https://github.com/chrisgrieser/zsh-magic-dashboard $HOME/.zsh/zsh-magic-dashboard                                                            # magic-dashboard
