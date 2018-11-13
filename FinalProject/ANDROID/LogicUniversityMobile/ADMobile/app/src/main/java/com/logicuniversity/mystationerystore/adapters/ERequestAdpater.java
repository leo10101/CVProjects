package com.logicuniversity.mystationerystore.adapters;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.model.ERequest;

import java.util.List;

public class ERequestAdpater extends ArrayAdapter<ERequest> {
    private List<ERequest> newrequestlist;
    int resource;

    public ERequestAdpater (Context context, int resource, List<ERequest> newrequestlist){
        super(context,resource, newrequestlist);
        this.resource=resource;
        this.newrequestlist=newrequestlist;
    }

    @Override
    public View getView(int position, View converView, ViewGroup parent){
        LayoutInflater inflater=(LayoutInflater) getContext().getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
        View v=inflater.inflate(resource,null);
        ERequest eobj=newrequestlist.get(position);
        if(eobj!=null){

            TextView tveqty=(TextView) v.findViewById(R.id.eqty_et);
            tveqty.setText(eobj.get("CurrentQty"));
            TextView tveuom=(TextView) v.findViewById(R.id.euom_tv);
            tveuom.setText(eobj.get("UnitOfMeasure"));
        }
        return v;
    }
}
