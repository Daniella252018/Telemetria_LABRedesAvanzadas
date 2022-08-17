import argparse
import base64
import codecs
import broadlink
import time
from broadlink.const import DEFAULT_PORT
from broadlink.exceptions import ReadError, StorageError
TIMEOUT = 30



device = broadlink.hello('192.168.0.100')
device.auth()
device.enter_learning()
print("learning ..")

start = time.time()

print(device)
while time.time() - start < TIMEOUT:
    time.sleep(1)
    try:
       data = device.check_data()
       print(data)
       #device.send_data(temp17)
    except (ReadError, StorageError):
        continue
    else:
        break
