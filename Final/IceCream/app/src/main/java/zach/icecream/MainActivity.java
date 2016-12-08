package zach.icecream;

import android.content.Intent;
import android.os.StrictMode;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    private IceCreamShop myIceCreamShop = new IceCreamShop();

    public void findIceCream(View view){
        Spinner myFlavor = (Spinner) findViewById(R.id.spinner);

        Integer flavorCrowd = myFlavor.getSelectedItemPosition();

        myIceCreamShop.setIceCreamShop(flavorCrowd);


        String suggestedIceCreamShop = myIceCreamShop.getIceCreamShop();
        String suggestedIceCreamShopURL = myIceCreamShop.getIceCreamShopURL();
//        System.out.println(suggestedIceCreamShop);
//        System.out.println(suggestedIceCreamShopURL);

        //create an intent
        Intent intent = new Intent(this, ReceiveIceCreamActivity.class);

        //pass data
        intent.putExtra("iceCreamShopName", suggestedIceCreamShop);
        intent.putExtra("iceCreamShopURL", suggestedIceCreamShopURL);

        //start the intent
        startActivity(intent);

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Button findTreatButton = (Button) findViewById(R.id.findTreatButton);

        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                findIceCream(view);
            }
        };
        findTreatButton.setOnClickListener(onclick);
    }
    public void chooseIceCream(View view){
        EditText mealType = (EditText) findViewById(R.id.myMeal);
        String mealValue = mealType.getText().toString();

        Spinner flavorSpinner = (Spinner) findViewById(R.id.spinner);
        String flavorValue = String.valueOf(flavorSpinner.getSelectedItem());


        Switch dairySwitch = (Switch) findViewById(R.id.switchDairy);
        boolean dairyFree = dairySwitch.isChecked();
        String dairyAllergy = "";
        if(dairyFree){
            dairyAllergy = " that is dairy-free";
        }
//        ToggleButton toggle = (ToggleButton)findViewById(R.id.toggleButton);
//        boolean isCup = toggle.isChecked();
//        String cupOrCone;
//        if(!isCup){
//            cupOrCone = "cone";
//        }
//        else{
//            cupOrCone = "cup";
//        }



        TextView output =(TextView) findViewById(R.id.textViewOutput);

        ImageView img= (ImageView) findViewById(R.id.imageView);

        if(flavorValue.equals("Pumpkin Pie")){
            img.setImageResource(R.drawable.caramel);
        }
        else if(flavorValue.equals("Cookie Dough")){
            img.setImageResource(R.drawable.chocolate);
        }
        else{
            img.setImageResource(R.drawable.cookiescream);
        }

        output.setText("My favorite\n" + mealValue + " is\n" +  flavorValue  + "\n" + dairyAllergy);
    }
}
