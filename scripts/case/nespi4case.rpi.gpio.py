try:
    import RPi.GPIO as GPIO
    from multiprocessing import Process
    import time
    import os

    time_to_restart = float(3)
    time_to_shutdown = float(2)

    # Pins of the Raspberry Pi
    resetPin = 2 #pin 13
    powerPin = 3 #pin 5
    ledPin = 14 #TXD
    powerenPin = 4 #pin 5

    def init():
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(resetPin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
        GPIO.setup(powerPin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
        GPIO.setup(ledPin, GPIO.OUT)
        GPIO.output(ledPin, GPIO.HIGH)
        GPIO.setup(powerenPin, GPIO.OUT)
        GPIO.output(powerenPin, GPIO.HIGH)

        pins = (3,5,7,8,10,11,12,13,15,16,18,19,21,22,23,24,26,29,31,32,33,35,36,37,38,40)

        for pin in range (0,26):
            GPIO.setup(pins[pin], GPIO.IN, pull_up_down=GPIO.PUD_UP)
            print ('pin: '+ str(pins[pin]), GPIO.input(pins[pin]))

    def resetButton():
        while True:
            GPIO.output(ledPin, GPIO.HIGH)
            GPIO.wait_for_edge(resetPin, GPIO.FALLING)
            print("The process of rebooting has started...")
            start = time.time()
            time_holding = time.time() - start
            while GPIO.input(resetPin) == GPIO.LOW and time_to_restart > time_holding:
                GPIO.output(ledPin, GPIO.LOW)
                time.sleep(0.3)
                GPIO.output(ledPin, GPIO.HIGH)
                time.sleep(0.3)
                time_holding = time.time() - start

            if time_to_restart <= time_holding:
                print("Restarting")
                GPIO.output(ledPin, GPIO.LOW)
                os.system("sudo reboot")
            else:
                print("Restarting aborted.")
    
    def shutDownButton():
        while True:
            GPIO.output(ledPin, GPIO.HIGH)
            GPIO.wait_for_edge(powerPin, GPIO.FALLING)
            print("The process of shutdown has started...")
            start = time.time()
            time_holding = time.time() - start
            while GPIO.input(powerPin) == GPIO.HIGH and time_to_shutdown > time_holding:
                GPIO.output(ledPin, GPIO.LOW)
                time.sleep(0.1)
                GPIO.output(ledPin, GPIO.HIGH)
                time.sleep(0.1)
                time_holding = time.time() - start

            if time_to_shutdown <= time_holding:
                print("The shutdown process has begun.")
                GPIO.output(ledPin, GPIO.LOW)
                os.system("sudo shutdown -r now")
            else:
                print("Shutdown aborted.")

    def shutDownButton2():
        while True:
            GPIO.output(ledPin, GPIO.HIGH)
            GPIO.wait_for_edge(powerenPin, GPIO.FALLING)
            print("The process of shutdown 2 has started...")
            start = time.time()
            time_holding = time.time() - start
            while GPIO.input(powerenPin) == GPIO.HIGH and time_to_shutdown > time_holding:
                GPIO.output(ledPin, GPIO.LOW)
                time.sleep(0.1)
                GPIO.output(ledPin, GPIO.HIGH)
                time.sleep(0.1)
                time_holding = time.time() - start

            if time_to_shutdown <= time_holding:
                print("The shutdown process has begun.")
                GPIO.output(ledPin, GPIO.LOW)
                os.system("sudo shutdown -r now")
            else:
                print("Shutdown aborted.")

    if __name__ == "__main__":
        init()

        resetProcess = Process(target = resetButton)
        resetProcess.start()
        resetProcess.join()

        shutdownProcess = Process(target = shutDownButton)
        shutdownProcess.start()
        shutdownProcess.join()

        shutdownProcess2 = Process(target = shutDownButton2)
        shutdownProcess2.start()
        shutdownProcess2.join()
        GPIO.cleanup()

except RuntimeError:
    print("Error importing RPi.GPIO! \n This is probably because you need superuser privileges. \n You can achieve this by using 'sudo' to run your script")