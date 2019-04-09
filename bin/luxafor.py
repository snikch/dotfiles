#!/usr/local/homebrew/bin/python

import usb.core
import usb.util
import sys
import getopt
import time

# find our device
dev = usb.core.find(idVendor=0x04d8, idProduct=0xf372)

# was it found?
if dev is None:
    raise ValueError('Device not found')

# Linux kernel sets up a device driver for USB device, which you have
# to detach. Otherwise trying to interact with the device gives a
# 'Resource Busy' error.
try:
  dev.detach_kernel_driver(0)
except Exception, e:
  pass

dev.set_configuration()

dev.write(1, [0, 0])

# "red" == 82
# "green" == 71
# "blue" == 66
# "yellow" == 89
# "off" == 79

def flash(color, speed=0.5, loops=2):
  #loop = 0
  #for _ in range(loops):
  #  dev.write(1, [0, 79])
  #  time.sleep(speed)
  #  dev.write(1, [0, color])
  #  time.sleep(speed)
  #  dev.write(1, [0, 79])
  return;

def setclr(color):
  dev.write(1, [0, color])
  return;

def main(argv):

   doflash = False
   color = 79
   delay = 0.5
   loops = 1

   try:
      opts, args = getopt.getopt(argv,"f:c:",["delay=","loops="])
   except getopt.GetoptError:
      print 'luxafor.py -c <colors=82,71,66,89,79>'
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
        print 'luxafor.py -c <colors=82,71,66,89,79>'
	sys.exit()
      elif opt == '-c':
        setclr(int(arg))
      elif opt == '-f':
	doflash = True
	color = int(arg)
      elif opt == '--delay':
        delay = int(arg)
      elif opt == '--loops':
	loops = int(arg)

   if doflash:
     flash(color, delay, loops)
     doflash = False

if __name__ == "__main__":
   main(sys.argv[1:])
