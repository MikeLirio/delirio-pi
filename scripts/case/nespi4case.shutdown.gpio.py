try:
    import RPi.GPIO as GPIO
    import os

    # Pins of the Raspberry Pi
    shutdownPin = 5

    def button_shutdown(channel):
        print("Shutting down")
        os.system("bash /opt/delirio/case/safe.close.sh")
        #os.system("sudo shutdown -h now")

    # Use physical pin numbering
    GPIO.setmode(GPIO.BOARD) 
    # Set pin 5 to be an input pin and set initial value to be pulled low (off)
    GPIO.setup(shutdownPin, GPIO.IN, pull_up_down=GPIO.PUD_UP) 
    # Setup event on pin 5 rising edge
    GPIO.wait_for_edge(shutdownPin,GPIO.FALLING) 
    
    GPIO.cleanup() # Clean up

    print("Shutting down")
    os.system("bash /opt/delirio/case/safe.close.sh")
    #os.system("sudo shutdown -h now")

except RuntimeError as error:
    print("Error importing RPi.GPIO! \n This is probably because you need superuser privileges. \n You can achieve this by using 'sudo' to run your script")
    print(error)