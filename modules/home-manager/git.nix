{
  config,
  pkgs,
  settings,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
  ];

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
'';

  home.sessionVariables = {
    GIT_HTTP_MAX_REQUEST_BUFFER = "100M";
  };
}