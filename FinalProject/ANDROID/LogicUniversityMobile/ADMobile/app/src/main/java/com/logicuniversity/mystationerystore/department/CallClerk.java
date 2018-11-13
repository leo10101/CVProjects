package com.logicuniversity.mystationerystore.department;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioGroup;

import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.system.Login;

public class CallClerk extends Activity {
    String ChosenName;
    String PhoneNumber;
    @SuppressLint("StaticFieldLeak")

    @Override

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_call_clerk);
        final RadioGroup radio = (RadioGroup) findViewById(R.id.radioGroup);
        final EditText e1=(EditText) findViewById(R.id.editView);
        radio.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {

            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {

                View radioButton = radio.findViewById(checkedId);
                int index = radio.indexOfChild(radioButton);


                // Add logic here

                switch (index) {
                    case 0: // first button


                        e1.setText("91202636");
                        break;
                    case 1: // secondbutton


                        e1.setText("86527342");
                        break;
                    case 2: // secondbutton


                        e1.setText("86527343");
                        break;
                }
            }
        });

        final String number=e1.getText().toString();
        Button dial =(Button) findViewById(R.id.button);
        dial.setOnClickListener(new View.OnClickListener()
        {
            public void onClick(View v)
            {
                Intent intent=new Intent();
                intent.setAction(Intent.ACTION_DIAL);
                intent.setData(Uri.parse("tel:"+"86527341"));
                startActivity(intent);
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

