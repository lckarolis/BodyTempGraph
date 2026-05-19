using Toybox.WatchUi;

class View extends WatchUi.View {

    function onUpdate(dc) {
        dc.clear();
        var g = new GraphView();
        g.draw(dc);
    }
}
