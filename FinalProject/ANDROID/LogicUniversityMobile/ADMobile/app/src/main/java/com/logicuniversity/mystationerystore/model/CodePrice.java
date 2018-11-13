package com.logicuniversity.mystationerystore.model;

import com.logicuniversity.mystationerystore.system.JSONParser;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class CodePrice extends java.util.HashMap<String,String> {

    final static String host = "http://172.17.32.171/LogicUniversityAPI/api";
    public CodePrice(String SuppCode, String Price)
    {
        put("SuppCode",SuppCode);
        put("Price",Price);
    }

    public static List<CodePrice> SupplierCodesAndPrice(String ItemCode){
        List<CodePrice> SupplierCodes=new ArrayList<CodePrice>();
       CodePrice res=null;
        try{
            JSONArray a = JSONParser.getJSONArrayFromUrl(host+"/request/getpricelist/"+ItemCode);
            for (int i=0;i<a.length();i++){
                JSONObject r=(JSONObject) a.get(i);
                res=new CodePrice(r.getString("SuppCode"),r.getString("Price"));
                SupplierCodes.add(res);
            }
        }catch(JSONException e){
            e.printStackTrace();
        }

        return SupplierCodes;


    }

}
