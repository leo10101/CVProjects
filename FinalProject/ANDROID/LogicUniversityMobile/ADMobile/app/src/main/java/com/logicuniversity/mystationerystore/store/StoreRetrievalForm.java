package com.logicuniversity.mystationerystore.store;

import android.app.Activity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.adapters.RequestDetailsAdapter;
import com.logicuniversity.mystationerystore.model.RequestDetails;
import com.logicuniversity.mystationerystore.system.Login;

import java.util.ArrayList;
import java.util.List;

public class StoreRetrievalForm extends Activity {

    ListView lv;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_store_retrieval_form);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        lv =  findViewById(R.id.listView);

        new AsyncTask<Void,Void,List<RequestDetails>>(){
            @Override
            protected List<RequestDetails> doInBackground(Void... params){
                //return Collections.singletonList(new RequestDetails("rt","ert","ret"));
                return RequestDetails.ListRequestDetails();
            }

            @Override
            protected void onPostExecute(List<RequestDetails> res) {
                ArrayAdapter<RequestDetails> adapter = new RequestDetailsAdapter(getApplicationContext(), R.layout.requestrow, res);
                lv.setAdapter(adapter);
            }
        }.execute();
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu)
    {
        getMenuInflater().inflate(R.menu.menu,menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item){
        switch (item.getItemId()){
            case R.id.option1:
                startActivity(new Intent(this,ClerkHomePage.class));
                return (true);
            case R.id.option2:
                startActivity(new Intent(this,StoreDisbursementList.class));
                return (true);
            case R.id.option3:
                startActivity(new Intent(this,StoreRetrievalForm.class));
                return (true);
            case R.id.option4:
                startActivity(new Intent(this,AutoAdjustmentDisbursement.class));
                return (true);

            case R.id.option5:
                startActivity(new Intent(this,Login.class));
                return (true);
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    public void click(View view) {
        StrictMode.setThreadPolicy(StrictMode.ThreadPolicy.LAX);
        ListView listView = findViewById(R.id.listView);
        View v;
        ArrayList<String> RequestID = new ArrayList<String>();
        ArrayList<String> ItemCode = new ArrayList<String>();
        ArrayList<String> CollectionQty = new ArrayList<String>();
        TextView t1,t2;
        EditText et;
        for (int i = 0; i < listView.getCount(); i++) {
            v = listView.getChildAt(i);
            t1=(TextView) v.findViewById(R.id.col0) ;
            t2=(TextView) v.findViewById(R.id.col1) ;
            et = (EditText) v.findViewById(R.id.col4);
            RequestID.add(t1.getText().toString());
            ItemCode.add(t2.getText().toString());
            CollectionQty.add(et.getText().toString());
        }
        for (int i = 0; i < listView.getCount(); i++)
        {
            RequestDetails.collect(RequestID.get(i),ItemCode.get(i),CollectionQty.get(i));
        }
    }

}
