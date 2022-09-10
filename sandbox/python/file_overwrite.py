from datetime import datetime

with open('text.txt', 'w+') as f:
  f.write(datetime.now().strftime('%Y%m%d'))
