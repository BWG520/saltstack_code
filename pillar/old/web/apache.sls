{% if grains['os'] == 'CentOS' %}
apache: httpd
{% elif grains['os'] == 'Debain' %}
apache: apache2
{% endif %}
