# IoT Data-Acquisition-and-LCD-Display-with-Hall-Effect-Sensor


Firmware Project to manage the funcionality of a LCD Display with a Hall-Effect-Sensor, In this project It will design a circuit that allows the visualization on a LCD screen of the distance a magnet is from a Hall effect Sensor.

To do this  It will condition the sensor output  through an Instrumentation Amplifier in order to get an output with a voltage range between 0 and 3.3V.
This voltage will go to the input of the AD converter in order to obtain its digital value which, since it is a 12-bit, it will be between 0 and 4095. 

* **Device:**		Xilinx Nexys2 FPGA Board
* **Sys Info:**		500K-gate Xilinx Spartan 3E FPGA

                 



# Functional managment

_Proyecto de firmware para Sensor de Presencia llevado a cabo por BlackDevice._
Parameteric register system of the device Master Board inside the presence detection system tested with Hall Effect Sensor.

* **Device:**		Xilinx Nexys2 FPGA Board
* **Sys Info:**		500K-gate Xilinx Spartan 3E FPGA




## :computer: Firmware Version

* **Firmware ver:**		1.0 


* **MicroBlaze Firm ver:**		v1.0.0 




## 🚀 Starting 

_With the following steps regarding to the installation tools and libraries will allow us after the debugging and ejecution the code in a local machine in order to develop and test the source.


### 📋 Requirements 


**1. Git** 
```
sudo apt-get install git 
```


**2.  JSON C++ Library Installation** 
```
#Descarga del código jsoncpp (Compatibilidad con Compilador C++11) 
wget -O 'jsoncpp-0.10.7.tar.gz' 'https://github.com/open-source-parsers/jsoncpp/archive/0.10.7.tar.gz'
#Descompresión del código
tar zxvf 'jsoncpp-0.10.7.tar.gz'
#Acoplamiento
python amalgamate.py
#copia del proyecto en el directorio deseado
cp -R 'dist/' 'path/to/your/project'
#A modo de chequeo revisar si la librería "json.h" ha sido incluida
#include <json/json.h>
```

**3. GCC -compiled static library. Tested on GNU/Linux(Ubuntu 18.04). Compiled using version 5.4.0** 
```
sudo apt update
sudo apt install build-essential
sudo apt-get install manpages-dev
gcc --version
```
**4. Instalar C++ Extension en Visual Studio Code**


### 🔧 Firmware Installation 

_Clone the repository in the device user folder: (/home/service for production)_

```

```
_Debugging and Ejecution of the project in de Command Window:_

```
#Compilation
sudo g++ main.cpp Register.cpp jsoncpp.cpp -o out
#Execution
./out
```
_Ahora el firmware puede ejecutarse desde la ruta : /home/service/BD-IOT-GTW_Firmware/_
```
sudo chmod +x gateway.qt
sudo ./gateway_qt
```




## ⚙ Configurationn

_By default, the file where the device parameters are stored Nexys 2 to parse are stored inside the Xilinx’s MicroBlaze embedded Firmware , where we can access through the following root: /home/pi/gateway-service/gateway/cfg_gateway.txt_
```
cd /home/pi/gateway-service/gateway/cfg_gateway.txt
```
_Para editar la configuraci�n:_
```
sudo nano cfg_gateway.txt
``` 


### 🧮 Configuration variables by default stored in the file "existing_data_new_master.json"  that corresponds to MicroBlaze device.
```
{
    "AUTO_REFRESH": true,
    "AVAHI_ENABLED": true,
    "BANNER_BLINK_DELAY": 300,
    "BANNER_BLINK_TIMES": 50,
    "BANNER_GREEN_PWM_ENGAGED": 0,
    "BANNER_GREEN_PWM_FREE": 1023,
    "BANNER_RED_PWM_ENGAGED": 1023,
    "BANNER_RED_PWM_FREE": 0,
    "DEBUG_ENABLED": true,
    "DEVICE_MODEL":"BD-IOT-GTW",
    "FW_VERSION": "RPI-1.3",
    "KEEP_LOG_DAYS": 30,
    "LOG_ENABLED": true,
    "LOG_PERIOD": "DAY",
    "MAX_CFG_SENSORS_RETRIES": 10,
    "DEVICE_MODEL": "BD-IOT-GTW",
    "MQTT_SERVER_CON_RETRIES": 50,
    "MQTT_SERVER_DOMAIN": "local",
    "MQTT_SERVER_IP_MANUAL": "192.168.6.15",
    "MQTT_SERVER_IP_MDNS": "192.168.6.205",
    "MQTT_SERVER_MDNS": "_ftrserver._tcp",
    "MQTT_SERVER_PASS": "interaction",
    "MQTT_SERVER_PORT_MANUAL": 8883,
    "MQTT_SERVER_PORT_MDNS": 8883,
    "MQTT_SERVER_USER": "interaction",
    "PUBLISH_T_ALIVE": 50,
    "PUBLISH_T_STATS": 600,
    "SENSOR_LIST":"[7]",
    "SENSOR_T_OFF": 10000,
    "SENSOR_T_ON": 2000,
    "STATS_ENABLED": true,
    "STORE_ID": "123456",
    "STORE_SECTION": "WOMAN",
    "SUBSCRIBE_ALL_STORES": true,
    "TIME_CHECK_MQTT_CONN": 10,
    "TOUT_CFG_SENSORS": 10,
    "TOUT_GET_MDNS": 10
}
```
## 🧮 Corresponding Variables to the device MD-101.
```
{
    "AUTO_REFRESH": true,
    "AVAHI_ENABLED": true,
    "BANNER_BLINK_DELAY": 300,
    "BANNER_BLINK_TIMES": 50,
    "BANNER_GREEN_PWM_ENGAGED": 0,
    "BANNER_GREEN_PWM_FREE": 1023,
    "BANNER_RED_PWM_ENGAGED": 1023,
    "BANNER_RED_PWM_FREE": 0,
    "DEBUG_ENABLED": true,
    "DEVICE_MODEL":"MD-101",
    "FW_VERSION":"5.2.0",
    "KEEP_LOG_DAYS": 30,
    "LOG_ENABLED": true,
    "LOG_PERIOD": "DAY",
    "MAX_CFG_SENSORS_RETRIES": 10,
    "DEVICE_MODEL": "BD-IOT-GTW",
    "MQTT_SERVER_CON_RETRIES": 50,
    "MQTT_SERVER_DOMAIN": "local",
    "MQTT_SERVER_IP_MANUAL": "192.168.6.15",
    "MQTT_SERVER_IP_MDNS": "192.168.6.205",
    "MQTT_SERVER_MDNS": "_ftrserver._tcp",
    "MQTT_SERVER_PASS": "interaction",
    "MQTT_SERVER_PORT_MANUAL": 8883,
    "MQTT_SERVER_PORT_MDNS": 8883,
    "MQTT_SERVER_USER": "interaction",
    "PUBLISH_T_ALIVE": 50,
    "PUBLISH_T_STATS": 600,
    "SENSOR_LIST":"[7]",
    "SENSOR_T_OFF": 10000,
    "SENSOR_T_ON": 2000,
    "STATS_ENABLED": true,
    "STORE_ID":"444",
    "STORE_SECTION":"MAN",
    "SUBSCRIBE_ALL_STORES": true,
    "TIME_CHECK_MQTT_CONN": 10,
    "TOUT_CFG_SENSORS": 10,
    "TOUT_GET_MDNS": 10
}
```
_Following take place a briew descripption of the configuration parameters listed above:_
* [AUTO_REFRESH:] When true, forces the resending of sensor states (Mensaje Pir) with every alive message.
* [AVAHI_ENABLED:] Determines if avahi will be used to discover the MQTT server. If not, parameters of the config file will be used.
* [BANNER_BLINK_DELAY:] Blinking me from 100 to 2000 ms of each blink (from ON to OFF). Value must be sent divided by 2.
* [BANNER_BLINK_TIMES:] Times between 1 and 500 that the sign will blink each me the BLINK command is sent. Value has to be sent mulplied by 2.
* [BANNER_GREEN_PWM_ENGAGED:] Intensity of green light when the dressing room is engaged. Numeric value between 0 and 1023.
* [BANNER_GREEN_PWM_FREE:] Intensity of green light when the dressing room is free. Numeric value between 0 and 1023.
* [BANNER_RED_PWM_ENGAGED:] Intensity of red light when the dressing room is engaged. Numeric value between 0 and 1023.
* [BANNER_RED_PWM_FREE:] Intensity of red light when the dressing room is free. Numeric value between 0 and 1023.
* [BANNER_BLUE_PWM_ENGAGED:] Intensity of blue light when the dressing room is engaged. Numeric value between 0 and 1023.
* [BANNER_BLUE_PWM_FREE:] Intensity of blue light when the dressing room is free. Numeric value between 0 and 1023.
* [DEBUG_ENABLED:] When true, forces the logging of debugging messages.
* [FW_VERSION:] Show us the current working Firmware version that is already implemented
* [KEEP_LOG_DAYS:] Period from 1 to 90 days that a log file will be kept in the file system.
* [LOG_ENABLE:] Allow logging of messages.
* [LOG_PERIOD:] Period in which new log file is created. Values accepted are DAY, WEEK or MONTH.
* [MAX_CFG_SENSORS_RETRIES:] Number of retries to configure sensors. Number from 1 to 10000.
* [MAX_CFG_SENSORS_RETRIES:] Number of retries to connect MQTT server. Number from 1 to 10000.
* [MQTT_SERVER_DOMAIN:] Name of the host domain. Normally "local".
* [MQTT_SERVER_IP_MANUAL:] IP of the MQTT server set manually.
* [MQTT_SERVER_IP_MDNS:] IP of the MQTT server saved by mdns.
* [MQTT_SERVER_MDNS:] Name of mdns service.
* [MQTT_SERVER_PASS:] MQTT server log password. If not used leave to "".
* [MQTT_SERVER_PORT_MANUAL:] Port of the MQTT server set manually.
* [MQTT_SERVER_PORT_MDNS:] Port of the MQTT server saved by mdns.
* [MQTT_SERVER_USER:] MQTT server log user. If not used leave to "".
* [PUBLISH_T_ALIVE:] Period from 30 to 600s in which alive and loc messages are published.
* [PUBLISH_T_STATS:] Period from 60 to 86400s in which stascs messages are published, except Stats_sensor.
* [SENSOR_LIST:] Active's Sensor view, showing on real time the list of sensors that are working on the master board.
* [SENSOR_T_OFF:] Delay between 0 and 20000ms in the deacvaon of the presence signal.
* [SENSOR_T_ON:] Delay between 0 and 5000ms in the acvaon of presence signal.
* [STATS_ENABLED:] Enables the publicaon of stascs messages.
* [STORE_ID:] Code that idenfies the shop. Up to 10 alphanumeric characters.
* [STORE_SECTION:] WOMAN, MAN� Up to 10 alphanumeric characters.
* [SUBSCRIBE_ALL_STORES:] In all topics MQTT when subscribing, substute the shop code by the wildcard �+�.
* [TIME_CHECK_MQTT_CONN:] Period of 5 to 300s to check if mq connecon is sll alive.
* [TIME_RETRY_GET_MDNS:] Time between retries of server discovery. Numeric from 1 to 60s.
* [TOUT_CFG_SENSORS:] Timeout to wait for sensor to configure. Numeric from 1 to 30s.
* [TOUT_GET_MDNS:] Timeout to wait for the discovery of a valid server. Numeric from 1 to 60s.
When the program starts, if there is no configuraon file in the correspondent folder,a default file will be automacally created.
_

## 📖 Firmware File Description  

_Descripction of each file from the code:_


**main.cpp**
Main file where the sensor's functional modes in relation with the pulses of the button on the board are stored  único donde se gestionan los modos de funcionamiento del sensor en relación a las pulsaciones del botón de la placa.

**Register.h**
We are using the header file in order to manage certain declarations as functions and parameters that will be valuable in order to call the read, store and write data.


**Register.cpp**
File in where take place the read and write process from an existing file to a new file with JSON format.

Going deep inside the code, the main part where we can specify how we managed the requested info is:
_First of all in order to save the readed parameters we created a List/vector of objects from JSON:_
```
void Entity_Register::JsonSave(const char* filename) {
	ofstream out(filename, ofstream::out);// Output stream class to operate on files(WRITE)
	Json::Value Register_json(Json::objectValue), sections_json(Json::arrayValue);      //store the values of different parameters: store_ID, SECTION, IP.....
	for (vector<Application>::iterator it = list_with_Applications_.begin(); it != list_with_Applications_.end(); ++it) {
		sections_json.append((*it).ToJson());
	}
	Register_json["PARAMETERS LIST"] = sections_json;
	out << Register_json;
	out.close();
}
```
The above code is also a JSON C++ array example.
In our project we managed a vector for a dynamically-sized array, and we were using the JSON C++ arrayValue to extract a list from the JSON.

Diving on the code, the next step is loading this list/vector object into a JSON value object, we figured out this solution: 
```
void Entity_Register::JsonLoad(const char* filename) { 
	ifstream in(filename); //Input stream to operate on files(READ)
	Json::Value Register_json; //variable that will store the parsed JSON value
	in >> Register_json;

	string store_ID = Register_json.get("STORE_ID", " UTF-8").asString();
	string section = Register_json.get("STORE_SECTION", " UTF-8").asString();
    string Mac = Register_json.get("DEVICE_MAC", " UTF-8").asString();
	string IP = Register_json.get("DEVICE_IP", " UTF-8").asString();
	string Fw_Version = Register_json.get("FW_VERSION", " UTF-8").asString();
    string Num_sensor = Register_json.get("SENSOR_LIST", "[ ]").asString();
    string device_model = Register_json.get("DEVICE_MODEL", " UTF-8").asString();
    string IP_mdns = Register_json.get("MQTT_SERVER_IP_MDNS", " UTF-8").asString();

	AddApplication(device_model, store_ID, section, Mac, IP, Fw_Version, Num_sensor, IP_mdns);
	in.close();
}
```
In summary the above code it is the result of creating an input stream using "ifstream" also create a variable that store the parsed JSON value and pipe this input into the JSON object value.



## 🛠 Build with 

TIt's samed the elements that allow us the development of the following project:



* C++ - Programming Language; **Version:** C++11; **IDE:**Visual Studio Code 
 
  

## 🤝 Contributing 

Please any doubt or issue that you can see throw the implementacion process, let me know, I'm glad to answer your questions and merge the needed pull requests.

## ✒ Author

_Developer_

* *Samuel Rojo Alvarez* 



## 🎁 Expresiones de Gratitud 

* 📢 Comment others about this project 

* 🍺 Invite to drink beer.

* 🍫 Give thanks with chocolate. 


