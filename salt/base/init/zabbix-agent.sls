zabbix-agent:
  pkg.installed:
    - name: zabbix-agent
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://init/files/zabbix_agentd7.conf
    - template: jinja
    - backup: minion
    - defaults:
      Server: {{ pillar['Zabbix_Server'] }}
      Hostname: {{ grains['fqdn'] }}
    - require:
      - pkg: zabbix-agent
  service.running:
    - enable: True
    - watch:
      - pkg: zabbix-agent
      - file: /etc/zabbix/zabbix_agentd.conf
