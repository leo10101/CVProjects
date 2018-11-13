package com.logicuniversity.mystationerystore.model;

import com.logicuniversity.mystationerystore.system.JSONParser;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ECategory extends HashMap<String, String> {

    //Written by Yangyang Gao
    //API
    final static String host="http://172.17.32.171/LogicUniversityAPI/api/request/";

    //Constructor
    public ECategory(){}

    public ECategory(String description, String itemcode){
        put("Description",description);
        put("ItemCode",itemcode);
    }


    //for Category Spinner
    public static List<String> listCategory(){
        List<String> category=new ArrayList<String>();
        JSONArray a = JSONParser.getJSONArrayFromUrl(host+"categorylist/");
        try{
            for(int i =0;i<a.length();i++){
                String c=a.getString(i);
                category.add(c);
            }
        }catch(Exception e){
        }
        return category;
    }

    //for Item Spinner
    public static List<String> listItem(String category){
        List<String> item=new ArrayList<String>();
        JSONArray a = JSONParser.getJSONArrayFromUrl(host+"desclist/"+category);
        try{
            for(int i =0;i<a.length();i++){
                String c=a.getString(i);
                item.add(c);
            }
        }catch(Exception e){
        }
        return item;
    }

    //for ItemCode
    public static List<ECategory> itemCodeWithDescription(String category){
        ECategory ecategory=null;
        List<ECategory> listCodeAndDescp=new ArrayList<ECategory>();
        try{
            JSONArray a= JSONParser.getJSONArrayFromUrl(host+"changedescription/"+category);
            for(int i=0;i<a.length();i++){
                JSONObject r=(JSONObject) a.get(i);
                ecategory=new ECategory(r.getString("Description"),r.getString("ItemCode"));
                listCodeAndDescp.add(ecategory);
            }
        }catch(JSONException e){
            e.printStackTrace();;
        }
        return listCodeAndDescp;
    }

}
