#!/usr/local/bin/python3
#
# randomize an integer sequence of 'faces'
# for creating pseudo-random 'fair' die numberings
#
import sys
import random

if(len(sys.argv) < 2):
  print("usage: random_order.py [faces]")
  print("  e.g. random_order.py 80")
  sys.exit(2)
    
length = int(sys.argv[1])
faces = [*range(1, length + 1, 1)]
for i in range(length):
    index = random.randint(0, len(faces) - 1)
    x = faces[index]
    faces.remove(x)
    print(x)
