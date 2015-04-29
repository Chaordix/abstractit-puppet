class puppet::profile::agent (
  $allinone                  = false,
  $agent_cron_hour           = '*',
  $agent_cron_min            = 'two_times_an_hour',
  $agent_version             = 'installed',
  $cfacter                   = false,
  $collection                = undef,
  $custom_facts              = undef,
  $devel_repo                = false,
  $enabled                   = true,
  $enable_devel_repo         = false,
  $enable_mechanism          = 'service',
  $enable_repo               = true,
  $environment               = 'production',
  $facter_version            = 'installed',
  $hiera_version             = 'installed',
  $manage_etc_facter         = true,
  $manage_etc_facter_facts_d = true,
  $manage_repos              = true,
  $puppet_server             = 'puppet',
  $puppet_version            = 'installed',
  $reports                   = true,
  $runinterval               = '30m',
  $structured_facts          = false,
) {
  class { '::puppet':
    allinone                  => $allinone,
    agent_cron_hour           => $agent_cron_hour,
    agent_cron_min            => $agent_cron_min,
    agent_version             => $agent_version,
    cfacter                   => $cfacter,
    collection                => $collection,
    custom_facts              => $custom_facts,
    devel_repo                => $devel_repo,
    enabled                   => $enabled,
    enable_devel_repo         => $enable_devel_repo,
    enable_mechanism          => $enable_mechanism,
    enable_repo               => $enable_repo,
    environment               => $environment,
    facter_version            => $facter_version,
    hiera_version             => $hiera_version,
    manage_etc_facter         => $manage_etc_facter,
    manage_etc_facter_facts_d => $manage_etc_facter_facts_d,
    manage_repos              => $manage_repos,
    puppet_server             => $puppet_server,
    puppet_version            => $puppet_version,
    reports                   => $reports,
    runinterval               => $runinterval,
    structured_facts          => $structured_facts,
  }

}
