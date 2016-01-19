using Toybox.WatchUi as Ui;

class TeamsterDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new TeamsterMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }

}