package com.logicuniversity.mystationerystore.adapters;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.model.HRequestList;

import java.util.List;

public class HRequestListAdpater extends ArrayAdapter<HRequestList> {
    //Written by Yangyang Gao

    private List<HRequestList> requestLists;
    int resource;

    public HRequestListAdpater(Context context, int resource, List<HRequestList> requestLists){
        super(context, resource,requestLists);
        this.resource=resource;
        this.requestLists=requestLists;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent){
        LayoutInflater inflater=(LayoutInflater) getContext().getSystemService(Activity.LAYOUT_INFLATER_SERVICE);



        View v=inflater.inflate(resource, null);
        HRequestList requestObj=requestLists.get(position);
        if(requestObj!=null){
            TextView txtrequestid = (TextView) v.findViewById(R.id.requestid_tv);
            txtrequestid.setText(requestObj.get("RequestID"));
            TextView txtusername = (TextView) v.findViewById(R.id.username_tv);
            txtusername.setText(requestObj.get("UserName"));
        }
        return v;
    }
}
