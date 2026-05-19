using Toybox.Application.Storage;

class Storage {

    const MAX = 240;

    function getCounter() {
        var c = Application.Storage.getValue("c");
        if (c == null) c = 0;
        return c;
    }

    function setCounter(c) {
        Application.Storage.setValue("c", c);
    }

    function saveSample(temp) {

        var data = Application.Storage.getValue("t");
        if (data == null) data = [];

        var c = getCounter();

        data.add({
            :t => temp,
            :i => c
        });

        c = c + 1;
        setCounter(c);

        while (data.size() > MAX) {
            data.remove(0);
        }

        Application.Storage.setValue("t", data);
    }

    function getData() {
        return Application.Storage.getValue("t");
    }
}
