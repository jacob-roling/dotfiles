{ ... }:
{
  programs.mangohud = {
    enable = true;
    settings = {
      gamemode = true;
      resolution = true;
      show_fps_limit = true;
      cpu_temp = true;
      gpu_temp = true;
      ram = true;
      vram = true;
      winesync = true;
      present_mode = true;
    };
  };
}