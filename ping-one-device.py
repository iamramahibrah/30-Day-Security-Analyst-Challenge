import argparse
import ipaddress

def parse_ip(ip):
    try:
        return ipaddress.ip_address(ip)
    except ValueError:
        return None

def main():
    # Create an argument parser
    parser = argparse.ArgumentParser(description='Ping a device')

    # Add an IP address argument
    parser.add_argument('ip', type=str, help='IP address of the device')

    # Parse the command-line arguments
    args = parser.parse_args()

    # Get the IP address from the arguments
    ip = args.ip

    # Parse the IP address
    parsed_ip = parse_ip(ip)
    if parsed_ip:
        print(f'Device {ip} Connected')
    else:
        print(f'{ip} Disconnected')

if __name__ == '__main__':
    main()
