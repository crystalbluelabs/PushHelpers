package com.crystalbluelabs.plugins.pushHelpers;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import android.util.Log;

import com.urbanairship.Logger;

public class PushHelpers extends CordovaPlugin {
	@Override
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException
	{
		
		if ("checkPushData".equals(action)) {
			NewsPaperPrefs prefs = new NewsPaperPrefs(cordova.getActivity());
			Logger.info("DJ_TEST" + prefs.getJsonValue());
			Log.d("DJ_TEST","DJ_TEST" + prefs.getJsonValue());
			callbackContext.success(prefs.getJsonValue());
			prefs.clearData();
			return true;
		}
		return false;
	}
}