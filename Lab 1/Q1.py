#checking integer flow in python
import sys

def overflow_add(a, b):
  if ((int(b) > 0) and (int(a) > (sys.maxsize -int(b)))) or ((int(b) < 0) and (int(a) < (-sys.maxsize -1 -int(b)))):
    return print("Integer overflow occured")
  else:
    return print(int(a) + int(b))

overflow_add(-9223372036854775808, -1)