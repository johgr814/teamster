using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class TeamsterApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();        
    	
    	//var arraysTest = new Tests.ArraysTest();
    	//arraysTest.prepare();
    	//Test.run();
    }

    //! onStart() is called on application start up
    function onStart() {
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new TeamsterView(), new TeamsterDelegate() ];
    }

}
