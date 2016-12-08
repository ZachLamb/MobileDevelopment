package zach.icecream;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void chooseIceCream(View view){
        EditText mealType = (EditText) findViewById(R.id.myMeal);
        String mealValue = mealType.getText().toString();

        Spinner flavorSpinner = (Spinner) findViewById(R.id.spinner);
        String flavorValue = String.valueOf(flavorSpinner.getSelectedItem());

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

        output.setText("My favorite\n" + mealValue + " is\n" + flavorValue);
    }
}
