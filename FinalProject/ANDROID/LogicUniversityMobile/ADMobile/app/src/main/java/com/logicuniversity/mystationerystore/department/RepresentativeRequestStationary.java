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
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.model.ChangeCollectionPointsJava;
import com.logicuniversity.mystationerystore.model.ECategory;
import com.logicuniversity.mystationerystore.model.ERequest;
import com.logicuniversity.mystationerystore.system.Login;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class RepresentativeRequestStationary extends Activity {

    String chosenCategory;
    String chosenItem;
    String accItemCode;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_representative_request_stationary);
//        Spinner cSpinner=(Spinner) findViewById(R.id.category_spinner);
//        TextView spinnerText = (TextView) cSpinner.getChildAt(0);
//        spinnerText.setTextSize(20);
//        Spinner iSpinner=(Spinner) findViewById(R.id.item_spinner);
//        TextView spinnerText2 = (TextView) iSpinner.getChildAt(0);
//        spinnerText2.setTextSize(20);

        //Category Spinner
        final Spinner categorySpinner = (Spinner) findViewById(R.id.category_spinner);
        new AsyncTask<Void, Void, List<String>>() {
            @Override
            protected List<String> doInBackground(Void... params) {
                return ECategory.listCategory();
            }

            @Override
            protected void onPostExecute(List<String> result) {
                ArrayAdapter<String> adapter = new ArrayAdapter<String>(RepresentativeRequestStationary.this,
                        android.R.layout.simple_list_item_1, result);
                categorySpinner.setAdapter(adapter);
            }
        }.execute();

        //Set Listener for Category Spinner
        categorySpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                chosenCategory = categorySpinner.getSelectedItem().toString();
                Toast.makeText(RepresentativeRequestStationary.this, chosenCategory + " selected", Toast.LENGTH_SHORT).show();
                //Set Item Spinner according to the chosen category
                setItemSpinner(chosenCategory);
            }

            @Override
            public void onNothingSelected(AdapterView<?> arg0) {

            }
        });

    }

    //The End of onCreate() method


    void showNewRequest(final String chosenCategory, final String accItemCode) {

        final TextView uom = (TextView) findViewById(R.id.euom_tv);


        new AsyncTask<String, Void, List<ERequest>>() {
            @Override
            protected List<ERequest> doInBackground(String... params) {
                return ERequest.listNewRequest(chosenCategory, accItemCode);
            }

            @Override
            protected void onPostExecute(List<ERequest> result) {
                for (int i = 0; i < result.size(); i++) {

                    uom.setText(result.get(i).get("UnitOfMeasure").toString());

                }
            }
        }.execute(chosenCategory, accItemCode);
    }


    //Item Spinner
    void setItemSpinner(String chosenCategory) {
        final Spinner itemSpinner = (Spinner) findViewById(R.id.item_spinner);
        new AsyncTask<String, Void, List<String>>() {
            @Override
            protected List<String> doInBackground(String... params) {
                return ECategory.listItem(params[0]);
            }

            @Override
            protected void onPostExecute(List<String> result) {
                ArrayAdapter<String> adapter = new ArrayAdapter<String>(RepresentativeRequestStationary.this,
                        android.R.layout.simple_list_item_1, result);
                itemSpinner.setAdapter(adapter);
            }
        }.execute(chosenCategory);

        itemSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                chosenItem = itemSpinner.getSelectedItem().toString();
                Toast.makeText(RepresentativeRequestStationary.this, chosenItem + " selected", Toast.LENGTH_SHORT).show();
                findItemCode(chosenItem); //change chosenItem with ItemCode


            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });


        Button btnsubmit = (Button) findViewById(R.id.submit_btn);
        btnsubmit.setOnClickListener(new View.OnClickListener() {


            SharedPreferences pref = PreferenceManager.getDefaultSharedPreferences
                    (getApplicationContext());

            String userid = pref.getString("UserID", "Null");
            String username1 = pref.getString("UserName", "Null");
            String username = username1.replace(" ", "%20");
            String deptname1 = pref.getString("DeptName", "Null");
            String deptname = deptname1.replace(" ", "%20");

            String deptcode = pref.getString("DeptCode", "Null");

            String numbertransfer1 = ERequest.getLastRequestId();
            String numbertransfer2 = numbertransfer1.replace("\n", "").replace(" ", "").replace("\t", "").replace("\r", "");
            int number = Integer.parseInt(numbertransfer2) + 1;
            String requestid = Integer.toString(number);
//String requestid="999";

            Date c = Calendar.getInstance().getTime();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String date = df.format(c);


            String approvalstatus = "pending";
            String abname = ERequest.getHeadInfo(deptcode).get(0).replace(" ", "%20");
            String approvalby = ERequest.getHeadInfo(deptcode).get(1);

            //            String approvalby="3";
//            String abname="sss";
            String comment = "NULL";
            String collectionstatus = "Uncolltected";

            String collectionpoint = ChangeCollectionPointsJava.getcurrent(deptcode);


            //            TextView t1=(TextView) findViewById(R.id.transfer_tv) ;
//            String itemcode=t1.getText().toString();
            String itemcode = "C001";


            String description = getDesc();

//
//            EditText t2=(EditText) findViewById(R.id.eqty_et) ;
//            String requestqty=t2.getText().toString();

            String requestqty = "32";
            String collectionqty = "0";
            String disbursementqty = "0";

            @Override
            public void onClick(View view) {
                //Submit data to Request Table
                new AsyncTask<String, Void, Void>() {
                    @Override
                    protected Void doInBackground(String... params) {
                        ERequest.submitRequest(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9],
                                params[10], params[11]);
                        return null;
                    }

                    @Override
                    protected void onPostExecute(Void result) {
                        RepresentativeRequestStationary.super.finish();
                    }
                }.execute(requestid, deptcode, deptname, userid, username, date, approvalstatus,
                        approvalby, abname, comment, collectionstatus, collectionpoint);


                //Submit data to RequestDetail Table
                new AsyncTask<String, Void, Void>() {
                    @Override
                    protected Void doInBackground(String... params) {
                        ERequest.submitRequestDetail(params[0], params[1], params[2], params[3], params[4], params[5]);
                        return null;
                    }

                    @Override
                    protected void onPostExecute(Void result) {
                        RepresentativeRequestStationary.super.finish();
                    }
                }.execute(requestid, itemcode, description, requestqty, collectionqty, disbursementqty);
            }

        });
        showNewRequest(chosenCategory, accItemCode);

    }

    //Change ItemName(Description) with ItemCode
    void findItemCode(final String chosenItem) {
        new AsyncTask<String, Void, List<ECategory>>() {
            @Override
            protected List<ECategory> doInBackground(String... params) {
                return ECategory.itemCodeWithDescription(chosenCategory);
            }

            @Override
            protected void onPostExecute(List<ECategory> result) {
                for (int i = 0; i < result.size(); i++) {
                    String transfer = result.get(i).get("Description").toString();
                    boolean b = chosenItem.equals(transfer);
                    if (b == true) {
                        accItemCode = result.get(i).get("ItemCode").toString();


                        TextView tvItemCode = (TextView) findViewById(R.id.transfer_tv);
                        tvItemCode.setText(accItemCode);
                        showNewRequest(chosenCategory, accItemCode);

                    }
                }
            }
        }.execute(chosenCategory);

    }

    public String getDesc() {
        String description = null;
        try {
            Spinner mySpinner = (Spinner) findViewById(R.id.item_spinner);
            int index = mySpinner.getSelectedItemPosition();
            description = mySpinner.getItemAtPosition(index).toString().replace(" ", "+").replace("\"", "").replace("/", "").replace("\"", "").replace("(", "").replace(")", "");
        } catch (Exception e) {

        }

        return description;
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu)
    {
        getMenuInflater().inflate(R.menu.repmenu,menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item){
        switch (item.getItemId()){
            case R.id.option9:
                startActivity(new Intent(this,RepHomePage.class));
                return (true);
            case R.id.option10:
                startActivity(new Intent(this,RepresentativeRequestStationary.class));
                return (true);

            case R.id.option11:
                startActivity(new Intent(this,ChangeCollectionPoint.class));
                return (true);

            case R.id.option13:
                startActivity(new Intent(this,CallClerk.class));
                return(true);
            case R.id.option12:
                startActivity(new Intent(this,Login.class));
                return (true);
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
