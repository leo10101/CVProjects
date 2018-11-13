package com.logicuniversity.mystationerystore.store;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;

import com.logicuniversity.mystationerystore.system.Login;
import com.logicuniversity.mystationerystore.R;

public class ClerkHomePage extends Activity
{
  //  final static int [] view = {R.id.EmployeeIDT, R.id.EmployeeNameT, R.id.DepartmentT, R.id.RoleT};
 //   final static String[] key ={"UserID", "UserName", "DeptName","Role"};
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_clerk_home_page);

        SharedPreferences pref =
                PreferenceManager.getDefaultSharedPreferences
                        (getApplicationContext());
        String employeeid = pref.getString("UserID", "Null");
        String employeename = pref.getString("UserName", "Null");
        String department = pref.getString("DeptName", "Null");
        String role = pref.getString("Role", "Null");


        TextView eid =(TextView) findViewById(R.id.employeeIDT);
        eid.setText(employeeid) ;
        TextView ename =(TextView) findViewById(R.id.EmployeeNameT);
        ename.setText(employeename) ;
//        TextView edpt =(TextView) findViewById(R.id.DepartmentT);
//        edpt.setText(department) ;
        TextView erole =(TextView) findViewById(R.id.RoleT);
        erole.setText(role) ;

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
}
