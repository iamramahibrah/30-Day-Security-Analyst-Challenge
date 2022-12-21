import subprocess
import ipaddress

def ping(host):
    result = subprocess.run(['ping', '-c', '3', host], stdout=subprocess.PIPE)
    return result.returncode == 0

def main():
    # IP subnet to ping
    subnet = '192.168.100.0/24'

    # Iterate over all the addresses in the subnet
    for ip in ipaddress.ip_network(subnet).hosts():
        if ping(str(ip)):
            print(f'{ip} is reachable')
        else:
            print(f'{ip} is not reachable')

if __name__ == '__main__':
    main()
