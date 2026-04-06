{pkgs, ...}:
let
  script = pkgs.writeShellScriptBin "rofi-powermenu" ''
    #!/usr/bin/env bash


    # Author : Aditya Shakya (adi1090x)
    # Github : @adi1090x
    # Modify : @FishyNavi

    theme="$HOME/.config/rofi/powermenu.rasi"

    # CMDs
    uptime_info="`awk '{printf "%dh %dm", $1/3600, ($1%3600)/60}' /proc/uptime`"
    host=`hostname`

    # Options
    shutdown='  Shutdown'
    reboot='  Reboot'
    lock='  Lock'
    suspend='⏼  Suspend'
    logout='󰗽  Logout'
    yes='  Yes'
    no='  No'

    # Rofi CMD
    rofi_cmd() {
      rofi -dmenu \
        -mesg "$USER@$host | $uptime_info" \
        -theme "$theme" \
        -name "powermenu"
    }

    # Confirmation CMD
    confirm_cmd() {
      rofi -dmenu \
        -mesg 'Are you sure?' \
        -theme "$theme" \
        -name "powermenu-confirm"
    }

    # Ask for confirmation
    confirm_exit() {
      echo -e "$yes\n$no" | confirm_cmd
    }
    
    # Pass variables to rofi dmenu
    run_rofi() {
      echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
    }

    # Execute Command
    run_cmd() {
      selected="$(confirm_exit)"
      if [[ "$selected" == "$yes" ]]; then
        if [[ $1 == '--shutdown' ]]; then
          systemctl poweroff
        elif [[ $1 == '--reboot' ]]; then
          systemctl reboot
        elif [[ $1 == '--suspend' ]]; then
          systemctl suspend 
        elif [[ $1 == '--logout' ]]; then
          loginctl terminate-user $USER
        fi
      else
        exit 0
      fi
    }

    chosen="$(run_rofi)"
    case ''${chosen} in
        $shutdown)
        run_cmd --shutdown
            ;;
        $reboot)
        run_cmd --reboot
            ;;
        $lock)
        hyprlock
            ;;
        $suspend)
        run_cmd --suspend
            ;;
        $logout)
        run_cmd --logout
            ;;
    esac
  '';
in
{
  home.packages = [script];
}