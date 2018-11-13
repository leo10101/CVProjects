package com.logicuniversity.mystationerystore.model;

import android.os.StrictMode;

import com.logicuniversity.mystationerystore.system.JSONParser;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ERequest extends HashMap<String, String> {
    //API
    final static String host="http://172.17.32.171/LogicUniversityAPI/api/request/";

    //Constructor
    public ERequest(){ }

    public ERequest(String itemcode, String binno, String category, String description, String reorderlevel, String currentqty,
                    String reorderedqty, String orderedqty, String uom, String firstsupp, String secondsupp, String thirdsupp){
        put("ItmeCode",itemcode);
        put("BinNo",binno);
        put("Category",category);
        put("Description",description);
        put("ReorderLevel",reorderlevel);
        put("CurrentQty",currentqty);
        put("ReorderedQty",reorderedqty);
        put("OrderedQty",orderedqty);
        put("UnitOfMeasure",uom);
        put("FirstSupp",firstsupp);
        put("SecondSupp",secondsupp);
        put("ThirdSupp",thirdsupp);
    }

    //Get list for add request
    public static List<ERequest> listNewRequest(String category, String itemcode){

        ERequest newrequest=null;
        List<ERequest> listnewrequest=new ArrayList<ERequest>();
        try{
            JSONArray a = JSONParser.getJSONArrayFromUrl(host+"makerequest/"+ category + "/"+ itemcode);
            for (int i=0;i<a.length();i++){
                JSONObject r = (JSONObject) a.get(i);
                newrequest=new ERequest(r.getString("ItemCode"),r.getString("BinNo"),r.getString("Category"),
                        r.getString("Description"),r.getString("ReorderLevel"),r.getString("CurrentQty"),r.getString("ReorderedQty"),
                        r.getString("OrderedQty"),r.getString("UnitOfMeasure"),r.getString("FirstSupp"),r.getString("SecondSupp"),
                        r.getString("ThirdSupp"));
                listnewrequest.add(newrequest);
            }
        }catch(JSONException e){
            e.printStackTrace();
        }
        return listnewrequest;
    }

    public static void submitRequest(String requestid, String deptcode, String deptname, String userid, String username, String date,
                                     String approvalstatus, String approvalby, String abname, String comment, String collectionstatus, String collectionpoint){
        JSONParser.getJSONArrayFromUrl(host+"createrequest"+"/"+requestid+"/"+deptcode+"/"+deptname+"/"+userid+"/"+username+
                "/"+date+"/"+approvalstatus+"/"+approvalby+"/"+abname+"/"+comment+"/"+collectionstatus+"/"+collectionpoint);
    }

    public static void submitRequestDetail(String requestid, String itemcode, String description, String requestqty, String collectionqty, String disbursementqty){
        JSONParser.getJSONArrayFromUrl(host+"createrequestdet/"+requestid+"/"+itemcode+"/"+description+"/"+requestqty+"/"+collectionqty+"/"+disbursementqty);
    }
    public static String getLastRequestId()
    {
        StrictMode.setThreadPolicy(StrictMode.ThreadPolicy.LAX);
            String a = JSONParser.getStream(host+"getavidlast");
        return a;
    }
    public static String getLastAVnumberd()
    {
        StrictMode.setThreadPolicy(StrictMode.ThreadPolicy.LAX);
        String a = JSONParser.getStream(host+"getreqidlast");
        return a;
    }
    public static List<String> getHeadInfo(String deptCode)
    {
        StrictMode.setThreadPolicy(StrictMode.ThreadPolicy.LAX);
        ArrayList<String> headinfo=new ArrayList<>();

        try{
            JSONObject r = JSONParser.getJSONFromUrl(host+"getdepthead/"+deptCode);
            headinfo.add(r.getString("UserName"));
            headinfo.add(r.getString("UserID"));

        }
        catch (Exception e)
        {

        }
        return headinfo;
    }

    public static void creatAdjustmentDetail(String AVnumber, String ItemCode, String Description, String Qty, String Price,String Reason)
        {
        JSONParser.getJSONArrayFromUrl(host+"addadjustmentvoucherdetails/"+AVnumber+"/"+ItemCode+"/"+Description+"/"+Qty+"/"+Price+"/"+Reason);
    }
}
