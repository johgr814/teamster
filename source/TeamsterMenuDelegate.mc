using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class TeamsterMenuDelegate extends Ui.MenuInputDelegate {

	var activitySession;
    
    function initialize() {
    	activitySession = new ActivitySession();
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
        if (item == :item_test_server) {
        	Server.reportAndFetchDistances(17, method(:onJsonResponse));
        } else if (item == :item_start_recording) {
            activitySession.start();
			Ui.pushView(new Ui.Confirmation("started"), new InfoPopup(), Ui.SLIDE_DOWN);
        } else if (item == :item_stop_recording) {
            activitySession.stop();
			Ui.pushView(new Ui.Confirmation("stopped"), new InfoPopup(), Ui.SLIDE_DOWN);
        }
    }

}