using Toybox.WatchUi as Ui;

class teamsterDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new teamsterMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }

}