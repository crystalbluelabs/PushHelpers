For android, the following function in PushReceiver.java must be modified.
											// Added Context context to the parameters.
    private void handlePushReceived(Intent intent, Context context) {
        int id = intent.getIntExtra(PushManager.EXTRA_NOTIFICATION_ID, 0);
        String alert = intent.getStringExtra(PushManager.EXTRA_ALERT);
        Map<String, String> extras = getNotificationExtras(intent);

        Logger.info("Received push notification. Alert: " + alert +
                ". Payload: " + extras + ". NotificationID=" + id);
        
        //***** Insert these two lines ******
        NewsPaperPrefs prefs = new NewsPaperPrefs(context);
        prefs.setJsonValue("whatever");
		//***** End of additional code ******

        PushNotificationPlugin.raisePush(alert, extras);
    }

    public void onReceive(Context context, Intent intent) {
        Logger.info("Received intent: " + intent.toString());
        String action = intent.getAction();

        if (action.equals(PushManager.ACTION_PUSH_RECEIVED)) {
            handlePushReceived(intent, context);        // Added context as a parameter to pass to 
            											//	previous function
        } else if (action.equals(PushManager.ACTION_NOTIFICATION_OPENED)) {
            handleNotificationOpened(context, intent);
        } else if (action.equals(PushManager.ACTION_REGISTRATION_FINISHED)) {
            handleRegistrationFinished(intent);
        }
    }