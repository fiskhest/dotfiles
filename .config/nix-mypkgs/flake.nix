{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    packages."x86_64-linux".default =
      let pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };

      fonts = {
        packages = builtins.filter pkgs.lib.isDerivation (builtins.attrValues pkgs.nerd-fonts);
      };
      in pkgs.buildEnv {
        name = "home-packages";
        paths = with pkgs; [
          act
          actionlint
          aichat
          bat
          buildifier
          btop
          cliphist
          clipse
          fzf
          difftastic
          gh
          gron
          fd
          lsd
          argocd
          hclfmt
          jq
          kubectx
          kubecolor
          yamllint
          kustomize
          eza
          libreoffice
          ldns
          tig
          direnv
          hyperfine
          fonts.packages
          nnn
          material-icons
          mdl
          hyprland-autoname-workspaces
          hyprswitch.packages.x86_64-linux.default
          jira-cli-go
          pass
          postgresql_16
          dust
          bazelisk
          fasd
          fuzzel
          thefuck
          emacs-lsp-booster
          #emacs
          #emacsPackages.mu4e
          cmctl
          shfmt
          shellcheck
          go-2fa
          gojq
          yadm
          gopass
          gopls
          godef
          gofumpt
          isync
          helmfile
          hey
          istioctl
          k9s
          kail
          kind
          krew
          pyenv
          kubernetes-helm
          nix-zsh-completions
          nodePackages.prettier
          nodePackages.stylelint
          nodePackages.typescript-language-server
          # rofi-network-manager.packages.x86_64-linux.default
          rustup
          starship
          starpls-bin
          tf-summarize
          tenv
          tree-sitter
          trivy
          pandoc
          tfautomv
          tflint
          tfswitch
          terraform-ls
          tmux-sessionizer
          tmux
          tmuxPlugins.extrakto
          typescript
          vscode-langservers-extracted
          yaml-language-server
          yq-go
          wtf
          (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ]))
        ];
        pathsToLink = [ "/bin" "/share" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
}


# wrap nixGL? https://github.com/nix-community/nixGL/issues/44#issuecomment-1182548777
