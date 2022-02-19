import requests
import sys

url = sys.argv[1]
# r = requests.get(url, verify='/etc/ssl/cert.pem', timeout=1)
## no need for verify=
r = requests.get(url, timeout=1)
print(r.text)
