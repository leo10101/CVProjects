package com.logicuniversity.mystationerystore.model;

import com.logicuniversity.mystationerystore.system.JSONParser;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class HRequestDetail extends HashMap<String,String> {

    //Written by Yangyang Gao
    //API
    final static String host="http://172.17.32.171/LogicUniversityAPI/api/request/";

    //Constructor
    public HRequestDetail(){}

    public HRequestDetail(String requestid, String itemcode, String description, String requestqty,
                          String collectionqty, String disburseqty, String uom){
        put("RequestID",requestid);
        put("ItemCode",itemcode);
        put("Description",description);
        put("RequestQty",requestqty);
        put("CollectionQty",collectionqty);
        put("DisbursementQty",disburseqty);
        put("UnitOfMeasure",uom);
    }

    //Get list of request details
    public static List<HRequestDetail> listRequestDetail(String requestid){
        HRequestDetail requestDetail=null;
        List<HRequestDetail> listRequestDetail=new ArrayList<HRequestDetail>();

        try{
            JSONArray a = JSONParser.getJSONArrayFromUrl(host+"getrequestdet/"+requestid);

            for(int i=0;i<a.length();i++){
                JSONObject r = (JSONObject) a.get(i);
                requestDetail=new HRequestDetail(r.getString("RequestID"),r.getString("ItemCode"),
                        r.getString("Description"),r.getString("RequestQty"),r.getString("CollectionQty"),
                        r.getString("DisbursementQty"),r.getString("UnitOfMeasure"));
                listRequestDetail.add(requestDetail);
            }
        }catch(JSONException e){
            e.printStackTrace();
        }
        return listRequestDetail;
    }

    public static void approveRequest(String requestid, String approvalstatus){
        JSONParser.getJSONArrayFromUrl(host+"approvereq/"+requestid+"/"+approvalstatus);
    }

    public static void rejectRequest(String requestid, String approvalstatus, String comment){
        JSONParser.getJSONArrayFromUrl(host+"rejectreq/"+requestid+"/"+approvalstatus+"/"+comment);
    }
}

