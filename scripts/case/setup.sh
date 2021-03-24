echo "Setting up the scripts for the Nespi 4 Case."

echo "Copying the scripts for the Restart button..."
echo "Stopping the nespi4case.restart.service service..."
systemctl stop nespi4case.restart.service
systemctl disable nespi4case.restart.service
echo "Copying service and script files..."
cp ./nespi4case.restart.service /etc/systemd/system/nespi4case.restart.service
cp ./nespi4case.restart.gpio.py /opt/delirio/case/nespi4case.restart.gpio.py

# echo "Copying the scripts for the Shutdown button..."
# echo "Stopping the nespi4case.shutdown.service service..."
# systemctl stop nespi4case.shutdown.service
# systemctl disable nespi4case.shutdown.service
# echo "Copying service and script files..."
# cp ./nespi4case.shutdown.service /etc/systemd/system/nespi4case.shutdown.service
# cp ./nespi4case.shutdown.gpio.py /opt/delirio/case/nespi4case.shutdown.gpio.py

echo "Copying the safe shutdown script"
cp ./safe.close.sh /opt/delirio/case/safe.close.sh 

echo "Loading the new daemons"
systemctl daemon-reload
systemctl reset-failed

echo "Setting up finnished."