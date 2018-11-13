package com.logicuniversity.mystationerystore.model;

import com.logicuniversity.mystationerystore.system.JSONParser;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class makerequest extends HashMap<String,String> {
    final static String baseURL = "http://172.17.32.171/LogicUniversityAPI/api/request";
    public makerequest(String Description,String Category)
    {
        put("Description",Description);
        put("Category",Category);
    }

    public static makerequest getmakerequest(String Category)
    {
        makerequest getmakerequest = null;

        String url = baseURL +"desclist/"+Category;

        try {
            JSONArray a= JSONParser.getJSONArrayFromUrl(url);
            for(int i=0;i<a.length();i++)
            {
                JSONObject b = a.getJSONObject(i);
                getmakerequest = new makerequest(b.getString("Description"),b.getString("Category"));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return getmakerequest;
    }

    public static String getcategory() {
        makerequest getmakerequest = null;
        String result = null;
        ArrayList<String> arrayList=new ArrayList<String>();
        String url = baseURL + "/categorylist/";
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(url);
                 for (int i = 0; i < a.length(); i++) {
                JSONObject b = a.getJSONObject(i);
          //      ArrayList<String> arrayList=new ArrayList<String>();
                for(int j=0;j<arrayList.size();j++)
                {
                    arrayList.add(arrayList.get(j));
                }
                result=arrayList.toString();
              //  getmakerequest = new makerequest(b.getString("Description"), b.getString("Category"));
             //   result = getmakerequest.get("Category");
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
        }

}
