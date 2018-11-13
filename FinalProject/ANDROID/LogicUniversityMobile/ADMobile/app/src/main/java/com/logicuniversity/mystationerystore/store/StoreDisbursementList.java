package com.logicuniversity.mystationerystore.store;

import android.app.Activity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.adapters.CollectDetailsAdapter;
import com.logicuniversity.mystationerystore.model.ERequest;
import com.logicuniversity.mystationerystore.model.RequestDetails;
import com.logicuniversity.mystationerystore.system.Login;

import java.util.ArrayList;
import java.util.List;

public class StoreDisbursementList extends Activity {
    ListView lv;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_store_disbursement_list);
        lv =  findViewById(R.id.listView2);
        new AsyncTask<Void,Void,List<RequestDetails>>(){
            @Override
            protected List<RequestDetails> doInBackground(Void... params){
                //return Collections.singletonList(new RequestDetails("rt","ert","ret"));
                return RequestDetails.ListCollectionDetails();
            }

            @Override
            protected void onPostExecute(List<RequestDetails> res){
                ArrayAdapter<RequestDetails> adapter = new CollectDetailsAdapter(getApplicationContext(),R.layout.collectrow,res);
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
        ListView listView = findViewById(R.id.listView2);

        View v;
        ArrayList<String> DisbursementQty = new ArrayList<String>();
        ArrayList<String> RequestID = new ArrayList<String>();
        ArrayList<String> ItemCode = new ArrayList<String>();
        ArrayList<String> Description = new ArrayList<String>();
        ArrayList<String> CollectionQty = new ArrayList<String>();

        TextView t1,t2,t3,t4;
        EditText et;
        String AVnumberS=ERequest.getLastAVnumberd();
        int AVnumberI=Integer.parseInt(AVnumberS)+1;
        String AVnumber=Integer.toString(AVnumberI);
        for (int i = 0; i < listView.getCount(); i++) {
            v = listView.getChildAt(i);
            t1=(TextView) v.findViewById(R.id.col0) ;
            t2=(TextView) v.findViewById(R.id.col1) ;
            t3=(TextView) v.findViewById(R.id.col2) ;

            t4=(TextView) v.findViewById(R.id.col4) ;
            et = (EditText) v.findViewById(R.id.col5);
            RequestID.add(t1.getText().toString());
            Description.add(t2.getText().toString());
            ItemCode.add(t3.getText().toString());
            CollectionQty.add(t4.getText().toString());
            DisbursementQty.add(et.getText().toString());
        }
        for (int i = 0; i < listView.getCount(); i++)
        {
            int differenceInt=Integer.parseInt(CollectionQty.get(i))-Integer.parseInt(DisbursementQty.get(i));
            String differenceS=Integer.toString(differenceInt);
            String urlDesc=Description.get(i).replace(" ", "").replace("\"", "").replace("/", "").replace("\"", "").replace("(", "").replace(")", "");

            RequestDetails.disburse(RequestID.get(i), ItemCode.get(i), DisbursementQty.get(i));

        }
    }
}
