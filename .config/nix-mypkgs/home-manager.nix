{ config, options, lib, pkgs, ... }:

with lib;
let
  name = "Johan Radivoj";
  maildir = "/home/johan/.mail";
  email = "johan@radivoj.se";
  gmail = "johan.radivoj@gmail.com";
  workmail = "johan.radivoj@gmail.com";
  # notmuchrc = "/home/johan/.config/notmuch/notmuchrc";
in {
  options.modules.shell.mail = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.shell.mail.enable {
    my = {
      packages = with pkgs; [ unstable.mu isync ];
      home = {
        accounts.email = {
          maildirBasePath = "${maildir}";
          accounts = {
            Gmail = {
              address = "${gmail}";
              userName = "${gmail}";
              flavor = "gmail.com";
              passwordCommand = "${pkgs.pass}/bin/gopass --password ${gmail}";
              primary = true;
              # gpg.encryptByDefault = true;
              mbsync = {
                enable = true;
                create = "both";
                expunge = "both";
                patterns = [ "*" "[Gmail]*" ]; # "[Gmail]/Sent Mail" ];
              };
              realName = "${name}";
              msmtp.enable = true;
            };
            Radivoj = {
              address = "${email}";
              userName = "${email}";
              flavor = "plain";
              passwordCommand = "${pkgs.pass}/bin/gopass --password privat/mail.radivoj.se";
              mbsync = {
                enable = true;
                create = "both";
                expunge = "both";
                patterns = [ "*" ];
              };
              imap = {
                host = "outlook.office365.com";
                port = 993;
                tls.enable = true;
              };
              realName = "${name}";
              msmtp.enable = true;
              smtp = {
                host = "smtp.office365.com";
                port = 587;
                tls.useStartTls = true;
              };
            };
          };
        };

        programs = {
          msmtp.enable = true;
          mbsync.enable = true;
        };

        services = {
          mbsync = {
            enable = true;
            frequency = "*:0/15";
            preExec = "${pkgs.isync}/bin/mbsync -Ha";
            postExec = "${pkgs.mu}/bin/mu index -m ${maildir}";
          };
        };
      };
    };
  };
}
