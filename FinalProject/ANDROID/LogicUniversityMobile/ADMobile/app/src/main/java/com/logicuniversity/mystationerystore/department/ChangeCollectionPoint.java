package com.logicuniversity.mystationerystore.department;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.StrictMode;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import com.logicuniversity.mystationerystore.model.ChangeCollectionPointsJava;
import com.logicuniversity.mystationerystore.system.Login;
import com.logicuniversity.mystationerystore.R;

public class ChangeCollectionPoint extends Activity {

    SharedPreferences pref;
    String deptcode;
    Button button;
    String collectionPoint;
    RadioGroup collecpoint;
    String output;
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        StrictMode.setThreadPolicy(StrictMode.ThreadPolicy.LAX);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_change_collection_point);
        pref= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        deptcode=pref.getString("DeptCode","DeptCode");
        String depcode= ChangeCollectionPointsJava.getcurrent(deptcode.toString());
        TextView eid =(TextView) findViewById(R.id.tx_collpoint);
        eid.setText(depcode);

        collecpoint = (RadioGroup) findViewById(R.id.collecpoint);
        collecpoint.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override

            public void onCheckedChanged(RadioGroup group, int checkedId) {
                // 获取选中的RadioButton的id
                int id = group.getCheckedRadioButtonId();
                // 通过id实例化选中的这个RadioButton
                RadioButton choise = (RadioButton) findViewById(id);
                // 获取这个RadioButton的text内容
                output = choise.getText().toString();
            }
        });
        button = (Button)findViewById(R.id.bt_change);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
               // RequestDetails.collect(RequestID.get(i),ItemCode.get(i),CollectionQty.get(i));
                ChangeCollectionPointsJava.changecollectponit(deptcode,output);
            }
        });
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
