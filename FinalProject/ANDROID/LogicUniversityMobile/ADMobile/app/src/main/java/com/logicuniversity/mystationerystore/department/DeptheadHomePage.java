package com.logicuniversity.mystationerystore.department;

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

public class DeptheadHomePage extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_depthead);
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
        TextView edpt =(TextView) findViewById(R.id.DepartmentT);
        edpt.setText(department) ;
        TextView erole =(TextView) findViewById(R.id.RoleT);
        erole.setText(role) ;
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
