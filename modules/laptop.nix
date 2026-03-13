{pkgs, ...}: {

  environment.SystemPackages = with pkgs; [
    auto-cpufreq
    acpid

  ];

}