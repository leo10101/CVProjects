package com.logicuniversity.mystationerystore.department;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.adapters.HRequestDetailAdpater;
import com.logicuniversity.mystationerystore.model.HRequestDetail;
import com.logicuniversity.mystationerystore.system.Login;

import java.util.List;

public class RequestDetailActivity extends Activity {

    //Written by Yangyang Gao
    //Declaration
    SharedPreferences pref;
    Button btnApprove, btnReject;
    ListView lvReqDet;
    String requestid;
    String username;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_request_detail);

        //Retrieve userid and rolename

//        pref = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
//        userID = pref.getString("hostname","localhost");
//        roleName = pref.getString("roleName","roldName");

        //Retrieve data from the previous intent

//        SharedPreferences pref =
//                PreferenceManager.getDefaultSharedPreferences
//                        (getApplicationContext());
//        String requestid1 = pref.getString("RequestID", "Null");
//        final String requestid=requestid1;
//        String  username = pref.getString("UserName", "Null");

        requestid = getIntent().getExtras().getString("RequestID");
        username = getIntent().getExtras().getString("UserName");


        //Instatiation of controls
        btnApprove=(Button) findViewById(R.id.btn_approve);
        btnReject=(Button) findViewById(R.id.btn_reject);
        TextView tvRequestid = (TextView) findViewById(R.id.tvrequestid);
        TextView tvRequestby = (TextView) findViewById(R.id.tvrequestby);

        //Set text in TextView
        tvRequestid.setText("Request ID: "+ requestid);
        tvRequestby.setText("Request By: "+username);

        //Show request detail list
        showRequestDetailList();

        //Approve, update data

        btnApprove.setOnClickListener(new View.OnClickListener() {
            String approvalstatus="Approve";
            @Override
            public void onClick(View view) {
                new AsyncTask<String,Void,Void>(){
                    @Override
                    protected Void doInBackground(String... params){
                        //String rid=requestid;
                        //String approvalstatus="Approved";
                        HRequestDetail.approveRequest(params[0],params[1]);
                        return null;
                    }

                    @Override
                    protected void onPostExecute(Void result){
                        RequestDetailActivity.super.finish();
                    }
                }.execute(requestid,approvalstatus);
            }
        });

        //Reject, update data
        btnReject.setOnClickListener(new View.OnClickListener(){
            String approvalstatus="Reject";
            EditText etcomment = (EditText) findViewById(R.id.etcomment);
            String comment= etcomment.getText().toString(); //comment 不更新f
            @Override
            public void onClick(View view){
                new AsyncTask<String,Void,Void>(){
                    @Override
                    protected Void doInBackground(String... params){

                        //String rid=requestid;
                        //String approvalstatus="Rejected";
                        //String comment = etcomment.findViewById(R.id.etcomment).toString();
                        HRequestDetail.rejectRequest(params[0],params[1],params[2]);
                        return null;
                    }

                    @Override
                    protected void onPostExecute(Void result){
                        RequestDetailActivity.super.finish();
                    }
                }.execute(requestid,approvalstatus,comment);
            }
        });
    }

    public void showRequestDetailList(){
        lvReqDet=findViewById(R.id.lv_requestdetails);
        new AsyncTask<String,Void,List<HRequestDetail>>(){
            @Override
            protected List<HRequestDetail> doInBackground(String... params){
                return HRequestDetail.listRequestDetail(requestid);
//                List<HRequestDetail> list =new ArrayList<HRequestDetail>();
//                list.add((new HRequestDetail("sd","d","d","d","w","q","r","e")));
//                return list;
            }

            @Override
            protected void onPostExecute (List<HRequestDetail> result){

                lvReqDet.setAdapter(new HRequestDetailAdpater(RequestDetailActivity.this,R.layout.row_hrequest_detail,result));



//                lvReqDet.setAdapter(new SimpleAdapter(HRequestDetailActivity.this,result,R.layout.row_hrequest_detail,
//                        new String[]{"Description","RequestQty","UnitOfMeasure"},new int[]{R.id.tvitemname,R.id.tvqty,R.id.tvuom}));
            }
        }.execute(requestid);
    }



    //This is department head menu
    @Override
    public boolean onCreateOptionsMenu(Menu menu)
    {
        getMenuInflater().inflate(R.menu.headmenu,menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item){
        switch (item.getItemId()){
            case R.id.option13:
                startActivity(new Intent(this,DeptheadHomePage.class));
                return (true);
            case R.id.option14:
                startActivity(new Intent(this,RequestList.class));
                return (true);

            case R.id.option5:
                startActivity(new Intent(this,Login.class));
                return (true);
            default:
                return super.onOptionsItemSelected(item);
        }
    }


}
