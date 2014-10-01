package com.crystalbluelabs.plugins.pushHelpers;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

public class NewsPaperPrefs {
	private static final String SHARED_PREFS_KEY = "my_key";
	
	private static final String SHARED_PREFS_NAME = "newspaper_prefs";
	
	private SharedPreferences prefs;
	public NewsPaperPrefs(Context context){
		this.prefs = context.getSharedPreferences(SHARED_PREFS_NAME, 0);
	}
	
	public void setJsonValue(String value){
		Editor edit = prefs.edit();
        edit.putString(SHARED_PREFS_KEY, value);
        edit.commit();
	}
	
	public String getJsonValue(){
		return prefs.getString(SHARED_PREFS_KEY, "default");
	}

	public void clearData() {
		Editor edit = prefs.edit();
		edit.clear();
		edit.commit();
		
	}
}