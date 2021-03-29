try:
    import RPi.GPIO as GPIO
    from multiprocessing import Process
    import os

    # Pins of the Raspberry Pi
    shutdownPin = 5

    def init():
        # Use physical pin numbering
        GPIO.setmode(GPIO.BOARD) 
        # Set pin 5 to be an input pin and set initial value to be pulled low (off)
        GPIO.setup(shutdownPin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN) 

    def shutdownButton():
        GPIO.wait_for_edge(shutdownPin, GPIO.FALLING)
        print("Shutting down")
        os.system("bash /opt/delirio/case/safe.close.sh")
        os.system("sudo shutdown -P now")

    if __name__ == "__main__":
        init()

        shutdownProcess = Process(target = shutdownButton)
        shutdownProcess.start()
        shutdownProcess.join()

        GPIO.cleanup()

except RuntimeError as error:
    print("Error importing RPi.GPIO! \n This is probably because you need superuser privileges. \n You can achieve this by using 'sudo' to run your script")
    print(error)