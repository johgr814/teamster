using Toybox.ActivityRecording as AR;

class ActivitySession  {
	
	var mSession;

    function start() {

		mSession = AR.createSession({
			:sport => AR.SPORT_CYCLING,
			:name => "johan"
		});

		mSession.start();
    }

    function stop() {
		mSession.stop();
    }
}