using Toybox.ActivityRecording as AR;
using Toybox.Activity as Act;
using Toybox.Timer as Timer;

class ActivitySession  {
	
	var mSession,
		mTimer,
		mCounter,
		mMates;

	function onUpdate() {
		
		mCounter++;
		
		var info = Act.getActivityInfo();
		
		if (info.elapsedDistance != null) {
			System.println("Distance:" + info.elapsedDistance);
			if (mCounter % 5 == 0) {
				Server.reportAndFetchDistances(info.elapsedDistance, method(:onJsonResponse));
			}
		}				
	}
	
	function logRecord(record) {
		System.println(record.get("nickName")  + ": " + record.get("distance"));
	}
	
	function onJsonResponse(code, data) {	
		if (code == 200) {
			Arrays.forEach(data, method(:logRecord));
		} else {
			System.println("Error:" + code);		
		}
	}



    function start() {

		mSession = AR.createSession({
			:sport => AR.SPORT_CYCLING,
			:name => "johan"
		});

		mCounter = 0;
		mSession.start();
		
		mTimer = new Timer.Timer();
		mTimer.start(method(:onUpdate), 1000, true);
    }

    function stop() {
		mTimer.stop();
		mSession.stop();
    }
}