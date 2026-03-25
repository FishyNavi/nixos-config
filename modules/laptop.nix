{pkgs, ...}: {
  # TODO: make this thing work idk
  environment.SystemPackages = with pkgs; [
    auto-cpufreq
    acpid

  ];

}