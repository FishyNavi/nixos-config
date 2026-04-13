{pkgs, ...}:

{
  services.conky = {
    enable = true;
    package = pkgs.conky;
    extraConfig = ''    
      conky.config = {
        out_to_x = false,
        out_to_wayland = true,
        backend = 'wayland',

        alignment = 'bottom_left',
        gap_x = 30,
        minimum_width = 230,
        minimum_height = 5,
        own_window = true,
        own_window_type = 'normal',
        own_window_argb_visual = true,
        own_window_argb_value = 0,
        own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
        update_interval = 1.0,
        double_buffer = true,
        no_buffers = true,
        cpu_avg_samples = 2,
        net_avg_samples = 2,
        use_xft = true,
        font = 'Iosevka Nerd Font:size=10',
        default_color = '#b662ff',

        draw_shades = false,
        draw_outline = false,
        draw_borders = false,
      };

      conky.text = [[

      System 
         Host:$alignr''${nodename}
         Uptime:$alignr$uptime
         Kernel:$alignr$kernel
      ''${hr 1}
      Resources 
         CPU: ''${cpu cpu0}% ''${alignr}''${cpubar 8,100}
         RAM: $memperc% ''${alignr}''${membar 8,100}
         Swap: $swapperc% ''${alignr}''${swapbar 8,100}
      ''${hr 1}
      Storage
         /  ''${alignr}''${fs_used /}/''${fs_size /} ''${fs_bar 8,100 /}
      ''${alignr}''${fs_free /} free
      ''${hr 1}

      Processes 
          user    %CPU    %RAM    comm    pid    
      ''${execi 1 "ps -eo user,%cpu,%mem,comm,pid --sort=-%mem --no-headers | head -n 5 | awk '{print "   " $0}' "}

      ]];
    '';
    #            Network
    #     IP Address:''${alignr}''${addr ''${gw_iface}}
    #     Down: ''${alignr}''${downspeed ''${gw_iface}}
    #     Up: ''${alignr}''${upspeed ''${gw_iface}}
    #  ''${hr 1}
  };  
}