yum_repo_relese:
  pkg.installed:
    - sources:
      - epel-release: https://mirrors.aliyun.com/zabbix/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
