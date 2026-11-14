{
  config,
  lib,
  myvars,
  ...
}:
let
  sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKgFCAPwVhm/Xly252wSaFaqyR2Ci9qPnhL1/CjfZzX/";
in
{
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f ${config.home.homeDirectory}/.gitconfig
  '';

  home.file.".config/git/allowed_signers".text = ''
    ${myvars.useremail} namespaces="git" ${sshSigningKey}
  '';

  # # GitHub CLI tool
  # # https://cli.github.com/manual/
  # programs.gh = {
  #   enable = true;
  #   settings = {
  #     git_protocol = "ssh";
  #     prompt = "enabled";
  #     aliases = {
  #       co = "pr checkout";
  #       pv = "pr view";
  #     };
  #   };
  #   hosts = {
  #     "github.com" = {
  #       "users" = {
  #         "p1x3lid" = null;
  #       };
  #       "user" = "p1x3lid";
  #     };
  #   };
  # };

  programs.git = {
    enable = true;
    lfs.enable = true;
    ignores = [
      # macOS
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
      "._*"
      ".Spotlight-V100"
      ".Trashes"
      ".fseventsd"
      "Icon?"

      # Editor temporary files
      "*~"
      "*.swp"
      "*.swo"
      ".#*"
      "#*#"
    ];

    signing = {
      key = sshSigningKey;
      signByDefault = true;
    };

    includes = [
      {
        # use different email & name for work:
        #
        # [user]
        #   email = "xxx@xxx.com"
        #   name = "Xxx Xxx"
        path = "~/work/.gitconfig";
        condition = "gitdir:~/work/";
      }
    ];

    settings = {
      user.email = myvars.useremail;
      user.name = myvars.userfullname;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "${config.home.homeDirectory}/.config/git/allowed_signers";

      init.defaultBranch = "main";
      trim.bases = "develop,master,main"; # for git-trim
      push.autoSetupRemote = true;
      pull.rebase = true;
      log.date = "iso"; # use iso format for date
      url = {
        "ssh://git@github.com/p1x3lid" = {
          insteadOf = "https://github.com/p1x3lid";
        };
      };

      alias = {
        # common aliases
        br = "branch";
        co = "checkout";
        st = "status";
        ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
        ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
        cm = "commit -m"; # commit via `git cm <message>`
        ca = "commit -am"; # commit all changes via `git ca <message>`
        dc = "diff --cached";

        amend = "commit --amend -m"; # amend commit message via `git amend <message>`
        unstage = "reset HEAD --"; # unstage file via `git unstage <file>`
        merged = "branch --merged"; # list merged(into HEAD) branches via `git merged`
        unmerged = "branch --no-merged"; # list unmerged(into HEAD) branches via `git unmerged`
        nonexist = "remote prune origin --dry-run"; # list non-exist(remote) branches via `git nonexist`

        # delete merged branches except master & dev & staging
        #  `!` indicates it's a shell script, not a git subcommand
        delmerged = ''! git branch --merged | egrep -v "(^\*|main|master|dev|staging)" | xargs git branch -d'';
        # delete non-exist(remote) branches
        delnonexist = "remote prune origin";

        # aliases for submodule
        update = "submodule update --init --recursive";
        foreach = "submodule foreach";
      };
    };
  };

  # A syntax-highlighting pager for git, diff, grep, and blame output
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      diff-so-fancy = true;
      line-numbers = true;
      true-color = "always";
      # features => named groups of settings, used to keep related settings organized
      # features = "";
    };
  };

  # Git terminal UI (written in go).
  programs.lazygit.enable = true;

  # Yet another Git TUI (written in rust).
  programs.gitui.enable = false;
  programs.lazygit.settings = {
    git.overrideGpg = true;
  };
}
