package com.logicuniversity.mystationerystore.adapters;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import com.logicuniversity.mystationerystore.R;
import com.logicuniversity.mystationerystore.department.RequestStationery;
import com.logicuniversity.mystationerystore.model.CodePrice;
import com.logicuniversity.mystationerystore.model.ECategory;
import com.logicuniversity.mystationerystore.model.RequestDetails;
import com.logicuniversity.mystationerystore.store.AutoAdjustmentDisbursement;

import java.util.ArrayList;
import java.util.List;

public class AutoCollectDetailsAdapter extends ArrayAdapter<RequestDetails> {
    private List<RequestDetails> requestLists;
    int resource;

    public AutoCollectDetailsAdapter(Context context, int resource, List<RequestDetails> requestLists){
        super(context, resource,requestLists);
        this.resource=resource;
        this.requestLists=requestLists;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent){
        LayoutInflater inflater=(LayoutInflater) getContext().getSystemService(Activity.LAYOUT_INFLATER_SERVICE);

        View v=inflater.inflate(resource, null);
        RequestDetails requestObj=requestLists.get(position);
        if(requestObj!=null){
            TextView txtrequestID = (TextView) v.findViewById(R.id.col0);
            txtrequestID.setText(requestObj.get("RequestID"));
            TextView txtrequestDes = (TextView) v.findViewById(R.id.col1);
            txtrequestDes.setText(requestObj.get("Description"));
            TextView txtrequestItemc = (TextView) v.findViewById(R.id.col2);
            txtrequestItemc.setText(requestObj.get("ItemCode"));
            TextView txtRequestQty  = (TextView) v.findViewById(R.id.col3);
            txtRequestQty .setText(requestObj.get("RequestQty"));
            TextView txtCollectionQty  = (TextView) v.findViewById(R.id.col4);
            txtCollectionQty .setText(requestObj.get("CollectionQty"));
            EditText txtDisbursementQty = (EditText) v.findViewById(R.id.col5);
            txtDisbursementQty.setText(requestObj.get("DisbursementQty"));
            final Spinner supplierSpinner=(Spinner) v.findViewById(R.id.spinner);
            final String ItemCode=txtrequestItemc.getText().toString();
           //final String ItemCode="C001";
            new AsyncTask<Void, Void, List<String>>() {
                @Override
                protected List<String> doInBackground(Void... params) {
                    List<CodePrice> itemlist=CodePrice.SupplierCodesAndPrice(ItemCode);
                    List<String> result=new ArrayList<>();
                    for (int i=0;i<itemlist.size();i++)
                    {
                        result.add(itemlist.get(i).get("SuppCode"));
                    }
                    return result;
                }
                @Override
                protected void onPostExecute(List<String> result) {
                    ArrayAdapter<String> adapter = new ArrayAdapter<String>(getContext(),
                            android.R.layout.simple_list_item_1, result);
                    supplierSpinner.setAdapter(adapter);
                }
            }.execute();
        }
        return v;
    }
}
