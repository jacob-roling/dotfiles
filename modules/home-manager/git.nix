{
  config,
  pkgs,
  settings,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  home.file.".gitconfig".text = ''
[alias]
  br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
  co = "checkout"
  cob = "checkout -b"
  del = "branch -D"
  done = "!git push origin HEAD"
  lg = "!git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30"
  res = "!git reset --hard"
  s = "status"
  save = "!git add -A && git commit -m 'chore: savepoint'"
  undo = "reset HEAD~1 --mixed"

[http]
  lowSpeedLimit = 0
  lowSpeedTime = 999999
  postBuffer = 524288000

[init]
  defaultBranch = "main"

[user]
  email = "${settings.email}"
  name = "${settings.name}"

[pull]
  rebase = true
  
[credential]
  helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";

[url "ssh://git@github.com/"]
  insteadOf = "https://github.com/"

[url "ssh://git@gitlab.com/"]
  insteadOf = "https://gitlab.com/"

[url "ssh://git@bitbucket.org/"]
  insteadOf = "https://bitbucket.org/"
'';

  home.sessionVariables = {
    GIT_HTTP_MAX_REQUEST_BUFFER = "100M";
  };
}