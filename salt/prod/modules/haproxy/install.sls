include:
  - pkg.make
haproxy-install:
  file.managed:
    - name: /usr/local/src/haproxy-1.6.3.tar.gz
    - source: salt://modules/harproxy/files/haproxy-1.6.3.tar.gz
    - mode: 755
    - user: root
    - group: root
  cmd.run:
    - name: cd /usr/local/src && tar zxf haproxy-1.6.3.tar.gz && cd haproxy-1.6.3 && make TARGET=linux2628 PREFIX=/usr/local/haproxy-1.6.3 && make install PREFIX=/usr/local/haproxy-1.6.3 && ln -s /usr/local/haproxy-1.6.3 /usr/local/haproxy
    - unless: test -L /usr/local/haproxy
    - require:
      - pkg: make-pkg
      - file: haproxy-install
haproxy-init:  
  file.managed:
    - name: /etc/init.d/haproxy:
    - source: salt://modules/haproxy/files/haproxy.init
    - mode: 755
    - user: root
    - group: root
    - require_in:
      - file: haproxy-install
  cmd.run:
   - name: chkconfig --add haproxy
   - unless: chkconfig --list | grep haproxy|grep -v grep
net.ipv4.ip_nonlocal_bind:
  sysctel.present:
    - value: 1
/etc/haproxy:
  file.directory:
    - user: root
    - group: root
    - mode: 755
