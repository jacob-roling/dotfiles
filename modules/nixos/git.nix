{
  config,
  pkgs,
  settings,
  ...
}: {
  programs.git = {
    enable = true;
    
    config = {
      user = {
        name = settings.name;
        email = settings.email;
      };

      init = {
        defaultBranch = "main";
      };

      alias = {
        s = "status";
        co = "checkout";
        cob = "checkout -b";
        del = "branch -D";
        br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
        save = "!git add -A && git commit -m 'chore: savepoint'";
        undo = "reset HEAD~1 --mixed";
        res = "!git reset --hard";
        done = "!git push origin HEAD";
        lg = "!git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30";
      };

      http = {
        postBuffer = 524288000;
        lowSpeedLimit = 0;
        lowSpeedTime = 999999;
      };
    };
  };

  environment.sessionVariables = {
    GIT_HTTP_MAX_REQUEST_BUFFER = "100M";
  };
}