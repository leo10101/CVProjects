package com.logicuniversity.mystationerystore.model;


import com.logicuniversity.mystationerystore.system.JSONParser;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ClerkPhoneNumber extends HashMap<String,String> {


    final static String baseURL = "http://172.17.32.171/LogicUniversityAPI/api/user/getuserlistcontact";

    public ClerkPhoneNumber(String UserName, String Phone)
    {
        put("UserName", UserName);
        put("Phone", Phone);
    }
    public static List<String> listUserName()
    {
        List<String> UserNames=new ArrayList<String>();
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(baseURL);
            for (int i = 0; i < a.length(); i++) {
                JSONObject r = (JSONObject) a.get(i);
                String c = r.getString("UserName");
                UserNames.add(c);
            }
        }
        catch (Exception e)
        {
        }
        return UserNames;
    }
    public static String populateNumbers(String UserName)
    {
       String PhoneNumber="88888888";
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(baseURL);
            for (int i = 0; i < a.length(); i++) {
                JSONObject r = (JSONObject) a.get(i);
                if(r.getString("UserName").replace(" ","%20")==UserName.replace(" ","%20"))
                PhoneNumber=r.getString("Phone");
            }
        }
        catch (Exception e)
        {
        }
        return PhoneNumber;
    }
}



