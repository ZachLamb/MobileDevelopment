package zach.lab7;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.RatingBar;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void lorelaiGilmore(View view){

        double percent = 0.0;

        EditText name = (EditText) findViewById(R.id.nameEditText);
        String nameValue = name.getText().toString();

        RatingBar paulAnka = (RatingBar) findViewById(R.id.ratingBar);
        double ratingValue = paulAnka.getRating();
        percent = percent + (2.858*ratingValue);

        TextView feeling = (TextView) findViewById(R.id.feelingTextView);

        Spinner breakfastSpinner = (Spinner) findViewById(R.id.spinner);
        String breakfastValue = String.valueOf(breakfastSpinner.getSelectedItem());
        if(breakfastValue.equals("Poptart")){

            percent = percent + 14.29;
        }

        ToggleButton toggle = (ToggleButton)findViewById(R.id.spouseToggleButton);
        boolean spouse = toggle.isChecked();
        String spouseString;
        if(!spouse){
             percent = percent + 14.29;
        }

        Switch ex_switch=(Switch)findViewById(R.id.ex_switch);
        boolean meditate = ex_switch.isChecked();
        if (meditate){
            percent = percent + 14.29;
        }
        RadioGroup coffee =(RadioGroup)findViewById(R.id.coffeeRadioGroup);
        int coffee_id=coffee.getCheckedRadioButtonId();
        switch(coffee_id){
            case -1:
                break;
            case R.id.radioButton:
                break;
            case R.id.radioButton2:
                percent = percent + 43.00;
                break;
        }
        double percentPrinted = Math.round(percent);
        feeling.setText(nameValue + " is " + percentPrinted + " % Lorelai Gilmore");
    }

}
