using Toybox.Application;

class App extends Application.AppBase {
    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new View() ];
    }
}
