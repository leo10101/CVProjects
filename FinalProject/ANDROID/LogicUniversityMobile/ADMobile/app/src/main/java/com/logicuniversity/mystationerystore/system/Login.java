package com.logicuniversity.mystationerystore.system;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.logicuniversity.mystationerystore.model.LoginItem;
import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.department.RepHomePage;
import com.logicuniversity.mystationerystore.department.DeptemployeeHomePage;
import com.logicuniversity.mystationerystore.department.DeptheadHomePage;
import com.logicuniversity.mystationerystore.store.ClerkHomePage;

public class Login extends Activity
{
    //Declaration of Controls
    EditText UserName;
    EditText PassWord;
    SharedPreferences pref;
    Button btnLogin;


    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        //creation of Shared preference to store ID and password
        pref = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());

        //Instantiation of controls
        UserName = (EditText) findViewById(R.id.UserName);

        PassWord = (EditText) findViewById(R.id.Password);
        btnLogin = (Button) findViewById(R.id.Login);

        //assignment of onclick listener to sign in button
        btnLogin.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v)
            {
                //Authentication that decide which screen to be redirected to
                Authenticate();
            }
        });
    }

    public void Authenticate(){
        if(UserName.getText().toString().equals("") && PassWord.getText().toString().equals("")){
            Toast t = Toast.makeText(Login.this, "Please enter username and password", Toast.LENGTH_SHORT);
            t.show();

        } else if (UserName.getText().toString().equals("")){
            Toast t = Toast.makeText(Login.this, "Please enter username", Toast.LENGTH_SHORT);
            t.show();

        } else if (PassWord.getText().toString().equals("")){
            Toast t = Toast.makeText(Login.this, "Please enter password", Toast.LENGTH_SHORT);
            t.show();
        } else
            {
             new AsyncTask<String,Void,LoginItem>()
             {
                @Override
                protected LoginItem doInBackground(String... params)
                {
                    LoginItem loginItem = LoginItem.getLoginItem(params[0],params[1]);
                    String authority = LoginItem.checkAuthority(params[0]);
                    loginItem.put("authority",authority);
                    return loginItem;
                }
                @Override
                protected void onPostExecute(LoginItem result)
                {
                    String UserID = result.get("UserID");
                    String Role = result.get("Role");
                    String authority = result.get("authority");
                    String UserName=result.get("UserName");
                    String DeptName=result.get("DeptName");
                    String DeptCode=result.get("DeptCode");

                    if(Role.equals("StoreClerk") && authority.equals(UserName))
                    {
                        setPreference(UserID,Role,authority,UserName,DeptName,DeptCode);
                        Intent i = new Intent(Login.this,ClerkHomePage.class);

                        startActivity(i);
                    }
                    else if (Role.equals("DeptHead")&& authority.equals(UserName))
                    {
                        setPreference(UserID,Role,authority,UserName,DeptName,DeptCode);
                        Intent i = new Intent(Login.this,DeptheadHomePage.class);
                        startActivity(i);

                    } else if (Role.equals("DeptEmp")&& authority.equals(UserName) ){
                        setPreference(UserID,Role,authority,UserName,DeptName,DeptCode);
                        Intent i = new Intent(Login.this,DeptemployeeHomePage.class);

                        startActivity(i);

                    }

                    else if (Role.equals("DeptRepre")&& authority.equals(UserName)){
                        setPreference(UserID,Role,authority,UserName,DeptName,DeptCode);
                        Intent i = new Intent(Login.this,RepHomePage.class);

                        startActivity(i);
                    }else {
                        Toast t = Toast.makeText(Login.this, "Invalid Login", Toast.LENGTH_SHORT);
                        t.show();
                    }
                }

            }.execute(UserName.getText().toString().replace(" ","%20"), PassWord.getText().toString());

        }
    }
    public void setPreference(String UserID,String Role,String authority,String UserName,String DeptName,String DeptCode)
    {
        SharedPreferences.Editor editor = pref.edit();
        editor.putString("UserID", UserID);
        editor.putString("Role", Role);
        editor.putString("authority", authority);
        //String UserName=UserName1.replace(" ","%20");
        editor.putString("UserName", UserName);
        editor.putString("DeptName", DeptName);
        editor.putString("DeptCode", DeptCode);
        editor.commit();
        finish();
    }
}
