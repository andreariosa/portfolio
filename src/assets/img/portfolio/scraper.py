import itertools

from selenium import webdriver
from time import sleep
from PIL import Image

driver = webdriver.Firefox()
driver.maximize_window()
driver.implicitly_wait(30)

# Configs

drDelay = 14.5

urls = ["http://netrooper.com", "http://hitbox.it", "http://iffclan.com", "http://payload.pw", "http://topicron.com", "https://tastetweak.com", "https://boostnatura.com"]
names = ["netrooper", "hitbox", "iffclan", "payload", "topicron", "tastetweak", "boostnatura"]

imgExt = ".png"
imgCropRight = 21
imgCropBottom = 11
imgResizeW = 900

# Loop

i = 0
for (u, n) in zip(urls, names):
    print("\n[" + str(i+1) + "] Visiting: " + u)
    driver.get(u)

    print("Delay: " + str(drDelay) + " seconds")
    sleep(drDelay)

    print("Saving: " + n + imgExt)
    driver.get_screenshot_as_file(n + imgExt)

    imgOriginal = Image.open(n + imgExt)
    width, height = imgOriginal.size
    print(" - saved image width: " + str(width) + " px")
    print(" - saved image height: " + str(height) + " px")
    imgResizeH = int((imgResizeW * (height - imgCropBottom)) / (width - imgCropRight))
    print(" - resized image width: " + str(imgResizeW) + " px")
    print(" - resized image height: " + str(imgResizeH) + " px")

    imgCropped = imgOriginal.crop((0, 0, width - imgCropRight, height - imgCropBottom))
    imgResized = imgCropped.resize((imgResizeW, imgResizeH))
    imgResized = imgResized.save(n + imgExt)

    i += 1

driver.quit()
print("\nFetched " + str(i) + " elements!")
