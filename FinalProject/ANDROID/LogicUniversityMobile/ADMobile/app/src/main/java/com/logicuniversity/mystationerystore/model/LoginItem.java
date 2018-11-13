package com.logicuniversity.mystationerystore.model;
import com.logicuniversity.mystationerystore.system.JSONParser;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

public class LoginItem extends HashMap<String,String> {
    final static String baseURL = "http://172.17.32.171/LogicUniversityAPI/api/user/";

    public LoginItem(String UserID,String UserName,String Role,String DeptCode,String DeptName)
    {
        put("UserID",UserID);
        put("UserName",UserName);
        put("Role",Role);
        put("DeptCode",DeptCode);
        put("DeptName",DeptName);
    }

    public LoginItem(String UserID, String UserName, String Role, String Password,String Phone,String Email,String DeptName,String DeptCode,String EmailNum)
    {
        put("UserID", UserID);
        put("UserName", UserName);
        put("Role", Role);
        put("Password", Password);
        put("Phone",Phone);
        put("Email",Email);
        put("DeptName",DeptName);
        put("DeptCode",DeptCode);
        put("EmailNum",EmailNum);
    }
    public static LoginItem getLoginItem(String UserName,String Password)
    {
        LoginItem loginItem = null;

        String url = baseURL +"getusernamepassword/"+UserName + "/"+Password;

        try {
            JSONArray a= JSONParser.getJSONArrayFromUrl(url);
            for(int i=0;i<a.length();i++)
            {
                JSONObject b = a.getJSONObject(i);
                loginItem = new LoginItem(b.getString("UserID"),b.getString("UserName"),b.getString("Role"),b.getString("DeptCode"),b.getString("DeptName"));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return loginItem;
    }

    public static String checkAuthority(String UserName)
    {
        LoginItem loginItem = null;
        String result = null;
        String url = baseURL +"getuserbyname/"+ UserName;
        try
        {
         //   JSONObject b = JSONParser.getJSONFromUrl(url);
         //   result = b.getString("UserID");
//         result.put("authority",b.getString("Result"));
//          Log.i("result",result.get("authority"));
            JSONArray a=JSONParser.getJSONArrayFromUrl(url);
            for(int i=0;i<a.length();i++)
            {
                JSONObject b = a.getJSONObject(i);
                loginItem = new LoginItem(b.getString("UserID"),b.getString("UserName"),b.getString("Role"),b.getString("DeptCode"),b.getString("DeptName"));
                result = loginItem.get("UserName");
            }
        }
        catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }











}
