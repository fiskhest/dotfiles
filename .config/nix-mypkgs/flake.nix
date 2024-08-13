{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    packages."x86_64-linux".default =
      let pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
      in pkgs.buildEnv {
        name = "home-packages";
        paths = with pkgs; [
          act
          aichat
          bat
          cliphist
          bottom
          fzf
          difftastic
          gh
          fd
          lsd
          argocd
          hclfmt
          jq
          kubectx
          yamllint
          kustomize
          eza
          libreoffice
          ldns
          tig
          direnv
          hyperfine
          nerdfonts
          nnn
          material-icons
          # mdl
          jira-cli-go
          pass
          postgresql_16
          dust
          bazelisk
          fasd
          thefuck
          emacs-lsp-booster
          cmctl
          shfmt
          shellcheck
          go-2fa
          gojq
          yadm
          gopass
          gopls
          #godef
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
          rustup
          starship
          tf-summarize
          tenv
          trivy
          pandoc
          tfautomv
          tflint
          tfswitch
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
