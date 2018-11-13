package com.logicuniversity.mystationerystore.model;

import com.logicuniversity.mystationerystore.system.JSONParser;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class RequestDetails extends java.util.HashMap<String,String> {


    final static String host = "http://172.17.32.171/LogicUniversityAPI/api";

    public RequestDetails(String RequestID, String Description, String ItemCode, String RequestQty, String CollectionQty) {
        put("RequestID",RequestID);

        put("Description", Description);
        put("ItemCode",ItemCode);
        put("RequestQty", RequestQty);
        put("CollectionQty", CollectionQty);

    }
    public RequestDetails(String RequestID, String ItemCode, String Description, String RequestQty, String CollectionQty, String DisbursementQty) {
        put("RequestID",RequestID);
        put("ItemCode",ItemCode);
        put("Description", Description);
        put("RequestQty", RequestQty);
        put("CollectionQty", CollectionQty);
        put("DisbursementQty", DisbursementQty);

    }



    public RequestDetails(){}

    public static List< RequestDetails > ListRequestDetails() {

        RequestDetails res=null;

        List<RequestDetails> listrequest = new ArrayList<RequestDetails>();
        try{
            JSONArray a = JSONParser.getJSONArrayFromUrl(host+"/retrieval/retrievalList");
            for (int i=0;i<a.length();i++){
                JSONObject r=(JSONObject) a.get(i);
                res=new RequestDetails(r.getString("RequestID"),r.getString("ItemCode"),r.getString("Description"),r.getString("RequestQty"),r.getString("CollectionQty"));
                listrequest.add(res);
            }
        }catch(JSONException e){
            e.printStackTrace();
        }
        return listrequest;

    }
    public static List< RequestDetails > ListCollectionDetails() {

        RequestDetails res=null;

        List<RequestDetails> listrequest = new ArrayList<RequestDetails>();
        try{
            JSONArray a = JSONParser.getJSONArrayFromUrl(host+"/disbursement/disbursementList");
            for (int i=0;i<a.length();i++){
                JSONObject r=(JSONObject) a.get(i);
                res=new RequestDetails(r.getString("RequestID"),r.getString("ItemCode"),r.getString("Description"),r.getString("RequestQty"),r.getString("CollectionQty"),r.getString("DisbursementQty"));
                listrequest.add(res);
            }
        }catch(JSONException e){
            e.printStackTrace();
        }
        return listrequest;

    }

    public static void collect(String RequestID,String ItemCode,String CollectionQty)
    {


        String result=JSONParser.getStream(host +"/retrieval/collect/"+RequestID+"/"+ItemCode+"/"+CollectionQty);

    }
    public static void disburse(String RequestID, String ItemCode, String DisbursementQty)
    {



        String result=JSONParser.getStream(host +"/disbursement/disburse/"+RequestID+"/"+ItemCode+"/"+DisbursementQty);

    }




}



