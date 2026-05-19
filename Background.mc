using Toybox.Sensor;
using Toybox.Application.Storage;

class Background {

    function onUpdate() {
        var temp = getTemperature();
        if (temp == null) return;

        Storage.saveSample(temp);
    }

    function getTemperature() {

        try {
            var skin = Sensor.getSensorData(Sensor.SENSOR_BODY_TEMPERATURE);
            if (skin != null && skin.temperature != null) return skin.temperature;
        } catch(e) {}

        try {
            var amb = Sensor.getSensorData(Sensor.SENSOR_TEMPERATURE);
            if (amb != null && amb.temperature != null) return amb.temperature;
        } catch(e) {}

        return null;
    }
}
