package com.logicuniversity.mystationerystore.department;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;

import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.system.Login;

public class RepHomePage extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_rep_home_page);
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

        Intent changecoll = new Intent(RepHomePage.this,ChangeCollectionPoint.class);
      //  changecoll.putExtra("DeptCode",deptcodes);
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
