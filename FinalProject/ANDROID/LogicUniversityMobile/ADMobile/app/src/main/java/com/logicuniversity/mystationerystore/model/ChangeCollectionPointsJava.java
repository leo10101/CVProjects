package com.logicuniversity.mystationerystore.model;

import android.os.StrictMode;

import com.logicuniversity.mystationerystore.system.JSONParser;

import org.json.JSONArray;

import java.util.HashMap;

public class ChangeCollectionPointsJava extends HashMap<String,String> {
    final static String baseURL = "http://172.17.32.171/LogicUniversityAPI/api/collection/";

    public ChangeCollectionPointsJava(String DeptCode, String DeptName, String HeadName, String CollectionPoint, String RepName) {
        put("DeptCode", DeptCode);
        put("DeptName", DeptName);
        put("HeadName", HeadName);
        put("CollectionPoint", CollectionPoint);
        put("RepName", RepName);
    }
  /*  public static List<String> getcurrent(String DeptCode) {
        List<String> collpoint = new ArrayList<String>();
        JSONArray a = JSONParser.getJSONArrayFromUrl(host + "getcollectionpoint/");
        try {
            for (int i = 0; i < a.length(); i++) {
                String c = a.getString(i);
                collpoint.add(c);
            }
        } catch (JSONException e){}
       return collpoint;
    }*/

    public static String getcurrent(String DeptCode)
    {
        StrictMode.setThreadPolicy(StrictMode.ThreadPolicy.LAX);
        String c=null;
        String c1=null;

        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl("http://172.17.32.171/LogicUniversityAPI/api/collection/getcollectionpoint/"+DeptCode);

           // JSONObject r=(JSONObject) a.get(0);
           c1 = a.toString();
           c=c1.replace("[", "").replace("]","").replace(" ","").replace("\"","");

            }
     catch(Exception e) { e.printStackTrace();}
     return c;
    }

    public static void changecollectponit(String DeptCode,String CollectionPoint)
    {
        String result=JSONParser.getStream(baseURL +"changecolpt/"+DeptCode+"/"+CollectionPoint);
    }

}









