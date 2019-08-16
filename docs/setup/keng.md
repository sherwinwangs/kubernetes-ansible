# flannel
- forget add parms: Directrouting
```$xslt
  net-conf.json: |
    {
      "Network": "{{ CLUSTER_CIDR }}",
      "Backend": {
        "Directrouting":true,
        "Type": "vxlan"
      }
    }
```
# etcd
etcd的证书分为server证书(server auth)，client证书(client auth)，peer证书(server auth &client auth)

# ansible lookup module
```$xslt
lookup only lookup files on ansible controller,even the playbook is running on the target machine.
so you should developy lookupmodule or use other module,eg: use shell module to register a file content to a ENV or 
use lookup module and templete args to render templates on ansible controller
```

# etcd
```
2019-08-16 14:32:02.226522 W | rafthttp: health check for peer 272dad16f2666b47 could not connect: x509: certificate has expired or is not yet valid (prober "ROUND_TRIPPER_SNAPSHOT")
2019-08-16 14:32:02.228160 W | rafthttp: health check for peer 272dad16f2666b47 could not connect: x509: certificate has expired or is not yet valid (prober "ROUND_TRIPPER_RAFT_MESSAGE")
2019-08-16 14:32:02.230605 W | rafthttp: health check for peer 86235e7e1aebc500 could not connect: x509: certificate has expired or is not yet valid (prober "ROUND_TRIPPER_RAFT_MESSAGE")
2019-08-16 14:32:02.230750 W | rafthttp: health check for peer 86235e7e1aebc500 could not connect: x509: certificate has expired or is not yet valid (prober "ROUND_TRIPPER_SNAPSHOT")
2019-08-16 14:32:02.263188 I | embed: rejected connection from "192.168.2.11:44902" (error "remote error: tls: bad certificate", ServerName "")
2019-08-16 14:32:02.264059 I | embed: rejected connection from "192.168.2.11:44904" (error "remote error: tls: bad certificate", ServerName "")
2019-08-16 14:32:02.301248 I | embed: rejected connection from "192.168.2.13:51962" (error "remote error: tls: bad certificate", ServerName "")
2019-08-16 14:32:02.301565 I | embed: rejected connection from "192.168.2.13:51964" (error "remote error: tls: bad certificate", ServerName "")
```
time not synced or cert not include node ip

