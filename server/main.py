#!/usr/bin/env python
# exixe modules: https://github.com/dekuNukem/exixe
# python library docs: https://github.com/dekuNukem/exixe/tree/master/python_library
import sys
import time
import spidev

# Hack to get Python to find the local library and import as a module
# Library dir: /home/pi/exixe/python_library
#sys.path.insert(1, '/home/pi/exixe/python_library')
import exixe

spi = spidev.SpiDev()
spi.open(0, 0)
spi.max_speed_hz = 7800000

def init_tubes():
  pass

tube1 = exixe.Exixe(7, spi)
tube2 = exixe.Exixe(11, spi)
tube3 = exixe.Exixe(13, spi)
tube4 = exixe.Exixe(15, spi)

count = 0
while True:
    #color = mapFromTo(count, 0, 127, 0, 10)
    color = count*10
    print(color)
    tube1.set_led(127, 15, 0)
    tube2.set_led(127, 15, 0)
    tube3.set_led(127, 15, 0)
    tube4.set_led(127, 15, 0)

    tube1.crossfade_init(count, 10)
    while tube1.animation_in_progress:
        tube1.crossfade_run()
        #time.sleep(0.033)

    #tube1.set_digit(count)
    tube2.set_digit(count)
    tube3.set_digit(count)
    tube4.set_digit(count)
    count = (count + 1) % 10
    #time.sleep(0.4)