{
  pkgs,
  ...
}: rec {
  username = "jacob";
  name = "Jacob";
  email = "jacob.roling@hey.com";
  locale = "en_AU.UTF-8";
  timezone = "Australia/Adelaide";
  dotfiles-directory = "/home/${username}/dotfiles";
  hashedPassword = "$6$q9vznMFhVXJH1H2W$yjoPJfsOpa0Obvu.cnF1lqrSs20ebYlQQpZKFFZoOz5z1mJkeDSG0QckBUfZ8KKqvgQ/k/8IJTw5mr2jgWAOf.";
  font = {
    family = "FiraCode Nerd Font";
    package = (pkgs.nerdfonts.override { fonts = ["FiraCode"]; });
  };
  extraGroups = ["networkmanager" "transmission" "wheel" "audio" "realtime"];

  bookmarks = [
    {
      name = "Toolbar";
      toolbar = true;
      bookmarks = [
        {
          name = "Addons";
          url = "https://addons.mozilla.org/firefox/extensions";
        }
        {
          name = "MyNixOS";
          url = "https://mynixos.com";
        }
        {
          name = "YouTube";
          url = "https://www.youtube.com";
        }
        {
          name = "Imbox";
          url = "https://app.hey.com";
        }
        {
          name = "GitHub";
          url = "https://github.com/jacob-roling?tab=repositories";
        }
        {
          name = "Claude";
          url = "https://claude.ai/chats";
        }
        {
          name = "Investing";
          bookmarks = [
            {
              name = "Pearler";
              url = "https://pearler.com/dashboard";
            }
          ];
        }
        {
          name = "Media";
          bookmarks = [
            {
              name = "Netflix";
              url = "https://www.netflix.com";
            }
            {
              name = "Prime Video";
              url = "https://app.primevideo.com/home";
            }
            {
              name = "Binge";
              url = "https://binge.com.au/profile";
            }
          ];
        }
        {
          name = "Business";
          bookmarks = [
            {
              name = "Notion";
              url = "https://www.notion.so";
            }
            {
              name = "Stripe";
              url = "https://dashboard.stripe.com/dashboard";
            }
          ];
        }
        {
          name = "Libraries & Resources";
          bookmarks = [
            {
              name = "TailwindCSS";
              url = "https://tailwindcss.com/docs/installation";
            }
            {
              name = "htmx";
              url = "https://htmx.org";
            }
            {
              name = "heroicons";
              url = "https://heroicons.com";
            }
            {
              name = "Adrian Roselli";
              url = "https://adrianroselli.com";
            }
            {
              name = "Posthog";
              url = "https://posthog.com";
            }
            {
              name = "FloatingUI";
              url = "https://floating-ui.com";
            }
            {
              name = "Open Props";
              url = "https://open-props.style";
            }
          ];
        }
        {
          name = "Hosting";
          bookmarks = [
            {
              name = "Netlify";
              url = "https://app.netlify.com";
            }
          ];
        }
        {
          name = "Music";
          bookmarks = [
            {
              name = "Female Vocal More Than A Woman Cover";
              url = "https://www.youtube.com/watch?v=j5EX9UULXCc";
            }
            {
              name = "Beggin' Loop Cover";
              url = "https://www.youtube.com/watch?v=_qXJEJ75nK4";
            }
          ];
        }
      ];
    }
  ];
}