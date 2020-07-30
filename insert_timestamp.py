#!/usr/bin/env python
import time
t = time.localtime()
# yyyy-mm-dd hh:mm:ss
print( '%d-%02d-%02d %02d:%02d:%02d' % (t.tm_year, t.tm_mon, t.tm_mday, t.tm_hour, t.tm_min, t.tm_sec))

#Use /Applications/Automator.app to create a Service that executes this script. Add the Run Shell Script Automator action and insert the code above. Select no input in any application and replaces selected text.
