package com.logicuniversity.mystationerystore.adapters;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.model.HRequestDetail;

import java.util.List;

public class HRequestDetailAdpater extends ArrayAdapter<HRequestDetail> {
    //Written by Yangyang Gao

    private List<HRequestDetail> requestDetails;
    int resource;

    public HRequestDetailAdpater(Context context, int resource, List<HRequestDetail> requestDetails){
        super(context, resource,requestDetails);
        this.resource=resource;
        this.requestDetails=requestDetails;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent){
        LayoutInflater inflater=(LayoutInflater) getContext().getSystemService(Activity.LAYOUT_INFLATER_SERVICE);



        View v=inflater.inflate(resource, null);
        HRequestDetail requestObj=requestDetails.get(position);
        if(requestObj!=null){
            TextView txtitemname = (TextView) v.findViewById(R.id.tvitemname);
            txtitemname.setText(requestObj.get("Description"));
            TextView txtqty = (TextView) v.findViewById(R.id.tvqty);
            txtqty.setText(requestObj.get("RequestQty"));
            TextView txtuom = (TextView) v.findViewById(R.id.tvuom);
            txtuom.setText(requestObj.get("UnitOfMeasure"));
        }
        return v;
    }
}
