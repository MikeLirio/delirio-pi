try:
    import RPi.GPIO as GPIO
    from multiprocessing import Process
    import time
    import os

    time_to_restart = float(3)

    # Pins of the Raspberry Pi
    resetPin = 2 #pin 13
    ledPin = 14 #TXD

    def init():
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(resetPin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
        GPIO.setup(ledPin, GPIO.OUT)
        GPIO.output(ledPin, GPIO.HIGH)

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
                os.system("bash /safe.close.sh")
                os.system("sudo reboot")
            else:
                print("Restarting aborted.")

    if __name__ == "__main__":
        init()

        resetProcess = Process(target = resetButton)
        resetProcess.start()
        resetProcess.join()

        GPIO.cleanup()

except RuntimeError:
    print("Error importing RPi.GPIO! \n This is probably because you need superuser privileges. \n You can achieve this by using 'sudo' to run your script")