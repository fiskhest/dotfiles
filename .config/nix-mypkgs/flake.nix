{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    renovatePkgs.url = "github:NixOS/nixpkgs/d806a8e152f683fe3e40a16e8e288d4db52e19dd";
    hyprswitch.url = "github:H3rmt/hyprswitch";
  };

  outputs = { self, nixpkgs, renovatePkgs, hyprswitch }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    packages."x86_64-linux".default =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
        renovatePkgsLocal = renovatePkgs.legacyPackages.x86_64-linux;

      fonts = {
        packages = with pkgs; [
          nerd-fonts.fira-code
          nerd-fonts.hack
          nerd-fonts.jetbrains-mono
          nerd-fonts.iosevka
          source-code-pro
          font-awesome_5
        ];
      };
      in pkgs.buildEnv {
        name = "home-packages";
        paths = with pkgs; [
          act
          actionlint
          aichat
          argocd
          (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ]))
          bat
          bazelisk
          btop
          buildifier
          cliphist
          clipse
          cmctl
          difftastic
          dust
          emacs-lsp-booster
          #emacs
          #emacsPackages.mu4e
          eza
          fasd
          fd
          fonts.packages
          fuzzel
          fzf
          gh
          git-absorb
          go-2fa
          godef
          gofumpt
          gojq
          gopass
          gopls
          gron
          hclfmt
          helmfile
          hey
          hyperfine
          hyprland-autoname-workspaces
          hyprswitch.packages.x86_64-linux.default
          istioctl
          isync
          jira-cli-go
          jq
          k9s
          kail
          kind
          krew
          kubecolor
          kubectx
          kubernetes-helm
          kubeseal
          kustomize
          ldns  # drill
          libreoffice
          lnav
          lsd
          material-icons
          mdl
          netmask
          nix-zsh-completions
          nnn
          nodePackages.prettier
          nodePackages.stylelint
          nodePackages.typescript-language-server
          pandoc
          pass
          postgresql_16
          pwvucontrol
          pyenv
          renovatePkgsLocal.renovate
          # renovate  # replace above as soon as https://github.com/nixos/nixpkgs/issues/425474 is fixed
          rustup
          shellcheck
          shfmt
          sipcalc
          skim
          starpls-bin
          starship
          temporal-cli
          tenv
          terraform-ls
          tf-summarize
          tfautomv
          tflint
          tfswitch
          pay-respects
          tig
          tmux
          tmux-sessionizer
          tmuxPlugins.extrakto
          tree-sitter
          trivy
          typescript
          vscode-langservers-extracted
          yadm
          yaml-language-server
          yamllint
          yq-go
          wtfutil
        ];
        pathsToLink = [ "/bin" "/share" "/share/fonts" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
}


# wrap nixGL? https://github.com/nix-community/nixGL/issues/44#issuecomment-1182548777
