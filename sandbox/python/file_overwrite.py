from datetime import datetime
import math
import random

date = 180
for i in range(math.ceil(date / 60)):
  print((i + 1) * 60)

with open('text.txt', 'w+') as f:
  f.write(datetime.now().strftime('%Y%m%d'))


with open('text.txt', 'a') as f:
  f.write('\n')
  f.write('追記')