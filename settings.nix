{
  pkgs,
  themes,
  ...
}: rec {
  username = "jacob";
  name = "Jacob";
  email = "jacob.roling@hey.com";
  authorizedKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJh11dxunHSj8ZShJIRfgeI0hjFGjQWH76OLqWBd0bhN jacob.roling@hey.com" ];
  locale = "en_AU.UTF-8";
  timezone = "Australia/Adelaide";
  dotfiles-directory = "/home/${username}/dotfiles";
  hashedPassword = "$6$q9vznMFhVXJH1H2W$yjoPJfsOpa0Obvu.cnF1lqrSs20ebYlQQpZKFFZoOz5z1mJkeDSG0QckBUfZ8KKqvgQ/k/8IJTw5mr2jgWAOf.";
  font = {
    family = "FiraCode Nerd Font";
    package = (pkgs.nerdfonts.override { fonts = ["FiraCode"]; });
  };
  extraGroups = ["networkmanager" "transmission" "wheel" "audio" "realtime"];
  theme = themes.material-darker;
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
          name = "daily.dev";
          url = "https://app.daily.dev";
        }
        {
          name = "Claude";
          url = "https://claude.ai/chats";
        }
        {
          name = "Macquarie";
          url = "https://online.macquarie.com.au/io/#/accounts";
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
              name = "Astro";
              url = "https://docs.astro.build/en/getting-started";
            }
            {
              name = "Adrian Roselli";
              url = "https://adrianroselli.com";
            }
            {
              name = "Iconify";
              url = "https://iconify.design";
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
            {
              name = "Sanity CMS";
              url = "https://www.sanity.io/docs";
            }
            {
              name = "Fathom Analytics";
              url = "https://usefathom.com";
            }
            {
              name = "Traefik Proxy";
              url = "https://doc.traefik.io/traefik/";
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
              name = "Go High Level";
              url = "https://www.gohighlevel.com/main-page";
            }
            {
              name = "Zoom";
              url = "https://us04web.zoom.us/myhome";
            }
            {
              name = "Calendly";
              url = "https://calendly.com/event_types/user/me";
            }
            {
              name = "Stripe";
              url = "https://dashboard.stripe.com/dashboard";
            }
            {
              name = "Quickbooks";
              url = "https://quickbooks.intuit.com/au";
            }
            {
              name = "PayPal";
              url = "https://www.paypal.com/myaccount/summary";
            }
            {
              name = "Stripe";
              url = "https://dashboard.stripe.com/dashboard";
            }
            {
              name = "ASIC";
              url = "https://asicconnect.asic.gov.au/emeraldCONNECT/faces/HomePage";
            }
            {
              name = "SWAS Accelerator";
              url = "https://courses.swasaccelerator.com/library-v2";
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
            {
              name = "Porkbun";
              url = "https://porkbun.com";
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
        {
          name = "Job Search";
          bookmarks = [
            {
              name = "LinkedIn";
              url = "https://www.linkedin.com/feed";
            }
            {
              name = "Seek";
              url = "https://www.seek.com.au";
            }
            {
              name = "Indeed";
              url = "https://au.indeed.com";
            }
            {
              name = "We Work Remotely";
              url = "https://weworkremotely.com";
            }
            {
              name = "Glass Door";
              url = "https://www.glassdoor.com.au";
            }
            {
              name = "Crossover";
              url = "https://www.crossover.com/applications";
            }
            {
              name = "Meetup";
              url = "https://www.meetup.com/find/?location=au--Adelaide&source=EVENTS";
            }
            {
              name = "Whirlpool";
              url = "https://forums.whirlpool.net.au";
            }
          ];
        }
        {
          name = "AI";
          bookmarks = [
          ];
        }
      ];
    }
  ];
}