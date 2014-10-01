For android, the following function in PushReceiver.java must be modified.

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