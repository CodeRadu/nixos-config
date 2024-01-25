{ pkgs, ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [ "blur-my-shell@aunetx" "dash-to-dock@micxgx.gmail.com" "apps-menu@gnome-shell-extensions.gcampax.github.com" "places-menu@gnome-shell-extensions.gcampax.github.com" "drive-menu@gnome-shell-extensions.gcampax.github.com" ];
      favorite-apps = [ "google-chrome.desktop" "org.gnome.Console.desktop" "org.gnome.Nautilus.desktop" ];
    };      
    "org/gnome/shell/extensions/dash-to-dock" = {
      preferred-monitor = "-2";
      preferred-monitor-by-connector = "HDMI-1";
      show-apps-button = false;
      show-trash = false;
      transparency-mode = "DYNAMIC";
    };
    "org/gnome/desktop/pheripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };
  };
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
  ];
}
