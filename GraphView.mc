using Toybox.Graphics;

class GraphView {

    function fmt(v) {
        var x = (v * 10).toNumber() / 10.0;
        return x;
    }

    function draw(dc) {

        var data = Storage.getData();

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        dc.drawText(10, 5, Graphics.FONT_SMALL, "Temp (hourly)");

        var x = 10;
        var y = 25;
        var w = 200;
        var h = 80;

        dc.drawRectangle(x, y, w, h);

        if (data == null || data.size() < 2) return;

        var min = 35.0;
        var max = 40.0;

        var step = w.toFloat() / 24.0;

        for (var i = 1; i < data.size(); i++) {

            var p1 = data[i-1];
            var p2 = data[i];

            var x1 = x + p1.i * step;
            var x2 = x + p2.i * step;

            var y1 = y + h - ((p1.t - min) / (max - min)) * h;
            var y2 = y + h - ((p2.t - min) / (max - min)) * h;

            dc.drawLine(x1, y1, x2, y2);
        }

        // LIST VIEW
        var ly = 110;
        dc.drawText(10, ly, Graphics.FONT_SMALL, "Log:");

        ly += 15;

        for (var j = data.size()-1; j >= 0 && j > data.size()-8; j--) {

            var e = data[j];
            var day = (e.i / 24).toNumber();
            var hour = e.i % 24;

            var line = "D" + day + " " + hour + ":00  " + e.t;

            dc.drawText(10, ly, Graphics.FONT_XTINY, line);
            ly += 12;
        }
    }
}
