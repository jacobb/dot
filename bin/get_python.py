import json
import os

swin_pipe = os.popen("osascript /Users/jacob/bin/get-music.applescript")
try:
    swin = json.loads(swin_pipe.read())
except ValueError:
    swin = {}
print(swin)

music_pipe = os.popen("osascript /Users/jacob/bin/get-itunes-music.applescript")
print(music_pipe.read())
music = json.loads(music_pipe.read())
print(swin)
