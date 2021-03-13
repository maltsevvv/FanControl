![prototype scheme](https://raw.githubusercontent.com/maltsevvv/FanControl/master/fan.png)

1. Transistor 2N2222
2. Resistor 680 Om

GPIO 14
Fan ON = 65 temp
Fan Off = 55 temp

# Fan Control
Raspberry Pi FanControl Service

1. Download program and place it into /usr/local/bin folder
`sudo wget -P /usr/local/bin https://raw.githubusercontent.com/maltsevvv/FanControl/master/fancontrol.py`

`sudo chmod +x /usr/local/bin/fancontrol.py`
2. Update Python setuptools
`sudo apt-get install python-pip`

`sudo pip install --upgrade setuptools`

3. Create fancontrol.service file with following text below

`sudo nano /etc/systemd/system/fancontrol.service`

```
[Unit]
Description=run fan when hot
[Service]
Type=simple
ExecStart=/usr/bin/python /usr/local/bin/fancontrol.py
ExecStop=/usr/bin/pkill -f /usr/local/bin/fancontrol.py
Restart=always
[Install]
WantedBy=multi-user.target
```
5. Register and enable FanControl service
```
sudo systemctl enable fancontrol
sudo systemctl start fancontrol
sudo systemctl status fancontrol
```
