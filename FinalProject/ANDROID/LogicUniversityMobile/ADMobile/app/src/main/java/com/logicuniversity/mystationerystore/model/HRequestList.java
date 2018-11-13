package com.logicuniversity.mystationerystore.model;

import com.logicuniversity.mystationerystore.system.JSONParser;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class HRequestList extends HashMap<String, String> {

    //Written by Yangyang Gao
    //API
    final static String host="http://172.17.32.171/LogicUniversityAPI/api/request/";

    //constructor
    public HRequestList(){}

    public HRequestList(String requestid, String deptcode, String deptname, String userid, String username, String date,
                        String approvalstatus, String approvalby, String abname, String comment, String collectionstatus,
                        String collectionpoint){
        put("RequestID",requestid);
        put("DeptCode",deptcode);
        put("DeptName",deptname);
        put("UserID",userid);
        put("UserName",username);
        put("Date",date);
        put("ApprovalStatus",approvalstatus);
        put("ApprovalBy",approvalby);
        put("ABName",abname);
        put("Comment",comment);
        put("CollectionStatus",collectionstatus);
        put("CollectionPoint",collectionpoint);
    }

    //get a list of request
    public static List<HRequestList> listRequest(String deptcode){
        HRequestList res=null;
        List<String> list=new ArrayList<String>();
        List<HRequestList> listrequest = new ArrayList<HRequestList>();
        try{
            JSONArray a = JSONParser.getJSONArrayFromUrl(host+"getrequestlist/"+deptcode);
            for (int i=0;i<a.length();i++){
                JSONObject r=(JSONObject) a.get(i);
                res=new HRequestList(r.getString("RequestID"),r.getString("DeptCode"),r.getString("DeptName"),
                        r.getString("UserID"),r.getString("UserName"),r.getString("Date"),r.getString("ApprovalStatus"),
                        r.getString("ApprovalBy"),r.getString("ABName"),r.getString("Comment"),r.getString("CollectionStatus"),
                        r.getString("CollectionPoint"));
                //Only show the pending requests for department head 需要加上这一段才合理
//                    String approvalstatus = res.get("ApprovalStatus");
//                    if(approvalstatus==null){
//                        listrequest.add(res);
//                    }
                listrequest.add(res);
            }
        }catch(JSONException e){
            e.printStackTrace();
        }
        return listrequest;
    }
}
