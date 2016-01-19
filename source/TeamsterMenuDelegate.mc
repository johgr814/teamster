using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class TeamsterMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

	function onJsonResponse(responseCode, data) {
		Sys.println(responseCode);
		Sys.println(data);
		var message = responseCode == 200 ? "Distance:" + data[0].get("distance") : "Error:" + responseCode;
		var confirmation = new Ui.Confirmation(message);
		Ui.pushView(confirmation, new InfoPopup(), Ui.SLIDE_DOWN);
	}

    function onMenuItem(item) {
        if (item == :item_1) {
        	Server.reportAndFetchDistances(17, method(:onJsonResponse));
        } else if (item == :item_2) {
            Sys.println("item 2");
        }
    }

}