#!/bin/bash

#This script is provided by Chiunownow https://github.com/Chiunownow
#Thank you very much for providing this script
#This script is 

#use e.g with that script: MySensor.sh 
#!/bin/bash
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#$DIR/LYWSD03MMC.py -d <device> -b 1000 -r --debounce --skipidentical 50 --name MySensor --callback sendTo$mqtt_HA

mqtt_host=$MQTT_HOST
mqtt_username=$MQTT_USERNAME
mqtt_passwd=$MQTT_PASSWD
mqtt_topic=$MQTT_TOPIC
sensor_id=${2//:/}
echo "publishing to $mqtt_host" 
mosquitto_pub -h $mqtt_host  -p 1883 -t "$mqtt_topic/sensor/${sensor_id}_temp/config" -u $mqtt_username -P $mqtt_passwd -i "mibridge" -m '{"device_class": "temperature", "name": "'${sensor_id}'_temp", "unique_id": "lywsd03mmc_'${sensor_id}'_temp", "device": { "name":"lywsd03mmc_'${sensor_id}'", "identifiers": "lywsd03mmc_'${sensor_id}'", "model": "LYWSD03MMC", "manufacturer": "Xiaomi"}, "state_topic": "'${mqtt_topic}'/sensor/'${sensor_id}'/state", "unit_of_measurement": "°C", "value_template": "{{ value_json.temperature}}","platform": "mqtt" }'
mosquitto_pub -h $mqtt_host  -p 1883 -t "$mqtt_topic/sensor/${sensor_id}_humi/config" -u $mqtt_username -P $mqtt_passwd -i "mibridge" -m '{"device_class": "humidity", "name": "'${sensor_id}'_humi", "unique_id": "lywsd03mmc_'${sensor_id}'_humi", "device": { "name":"lywsd03mmc_'${sensor_id}'", "identifiers": "lywsd03mmc_'${sensor_id}'", "model": "LYWSD03MMC", "manufacturer": "Xiaomi"}, "state_topic": "'${mqtt_topic}'/sensor/'${sensor_id}'/state", "unit_of_measurement": "%", "value_template": "{{ value_json.humidity}}","platform": "mqtt" }'
mosquitto_pub -h $mqtt_host  -p 1883 -t "$mqtt_topic/sensor/${sensor_id}_battlevel/config" -u $mqtt_username -P $mqtt_passwd -i "mibridge" -m '{"device_class": "battery", "name": "'${sensor_id}'_batt", "unique_id": "lywsd03mmc_'${sensor_id}'_batt", "device": { "name":"lywsd03mmc_'${sensor_id}'", "identifiers": "lywsd03mmc_'${sensor_id}'", "model": "LYWSD03MMC", "manufacturer": "Xiaomi"}, "state_topic": "'${mqtt_topic}'/sensor/'${sensor_id}'/state", "unit_of_measurement": "%", "value_template": "{{ value_json.batterylevel}}","platform": "mqtt" }'
mosquitto_pub -h $mqtt_host  -p 1883 -t "$mqtt_topic/sensor/${sensor_id}_battvolt/config" -u $mqtt_username -P $mqtt_passwd -i "mibridge" -m '{"device_class": "voltage", "name": "'${sensor_id}'_volt", "unique_id": "lywsd03mmc_'${sensor_id}'_volt", "device": { "name":"lywsd03mmc_'${sensor_id}'", "identifiers": "lywsd03mmc_'${sensor_id}'", "model": "LYWSD03MMC", "manufacturer": "Xiaomi"}, "state_topic": "'${mqtt_topic}'/sensor/'${sensor_id}'/state", "unit_of_measurement": "v", "value_template": "{{ value_json.batteryvoltage}}","platform": "mqtt" }'
mosquitto_pub -h $mqtt_host  -p 1883 -t "$mqtt_topic/sensor/${sensor_id}/state" -u $mqtt_username -P $mqtt_passwd -i "mibridge" -m '{ "temperature": '$3', "humidity": '$4', "batteryvoltage" : '$5', "batterylevel": '$6' }'

