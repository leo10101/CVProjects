package com.logicuniversity.mystationerystore.department;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.adapters.HRequestListAdpater;
import com.logicuniversity.mystationerystore.model.HRequestList;
import com.logicuniversity.mystationerystore.system.Login;

import java.util.List;

public class RequestList extends Activity {
    //Written by Yangyang Gao

    //Declaration
    SharedPreferences pref;
    ListView lv;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_request_list);
        lv = (ListView) findViewById(R.id.hrequestlist_list);


        SharedPreferences pref =
                PreferenceManager.getDefaultSharedPreferences
                        (getApplicationContext());
        String deptcode = pref.getString("DeptCode", "Null");


        //Show request list from the same department for department head to approve or reject
        new AsyncTask<String,Void,List<HRequestList>>(){
            @Override
            protected List<HRequestList> doInBackground(String... params){
                return HRequestList.listRequest(params[0]);
            }

            @Override
            protected void onPostExecute(List<HRequestList> res){
                lv.setAdapter(new HRequestListAdpater(RequestList.this,R.layout.row_hrequestlist,res));//CHANGED HERE!!
                lv.setOnItemClickListener(new AdapterView.OnItemClickListener(){
                    @Override
                    public void onItemClick(AdapterView<?> a, View v, int position, long id){
                        Object requestObject=lv.getItemAtPosition(position);
                        HRequestList requestitem=(HRequestList) requestObject;

                        //Click on the specific item, and go into the next activity named HRRequestDetailActivity
                        String rid= ((HRequestList) requestObject).get("RequestID");
                        String requestby=((HRequestList) requestObject).get("UserName");

                        Intent intent=new Intent(getApplicationContext(),RequestDetailActivity.class);
                        intent.putExtra("RequestID",rid);
                        intent.putExtra("UserName",requestby);
                        startActivity(intent);
                    }
                });
            }
        }.execute(deptcode);
    }
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
