#!/bin/bash

function total_packets()
{
  file="data.pcap"
  echo
  echo "Total packets:" `tshark -r $file | wc -l `
  echo -e "
  Records in this Capture
  ===================="
  tshark -r $file -Y "dns.qry.type == 1"
  
  echo -e "
  Most Common Source IP
  ===================="
  tshark -r $file -T fields -e ip.src | sort | uniq -c | sort -n | tail

    echo -e "
  Most Common Destination IP
  =========================="
  tshark -r $file -T fields -e ip.dst | sort | uniq -c | sort -n | tail

  echo -e "
  Protocals Used
  ==============="
  tshark -r $file -T fields -e frame.protocols | sort | uniq -c | sort -n 

  echo -e "
  TCP Traffic
  ==============="
  tshark -r $file -Y "tcp and tcp.srcport==80"

  echo -e "
  SMB Traffic
  ============"
  tshark -r $file -Y "smb"

  echo -e "
  DNS Traffic
  ==============="
 tshark -r $file -Y "dns"

echo -e "
  Hostnames
  ========="

tshark -r $file -T fields -e dns.qry.name -Y "dns" | sort | uniq
}
total_packets