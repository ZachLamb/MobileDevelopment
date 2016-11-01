package zach.lab7;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
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
    public void findMood(View view){
        EditText name = (EditText) findViewById(R.id.nameEditText);
        String nameValue = name.getText().toString();
        TextView feeling = (TextView) findViewById(R.id.feelingTextView);
        Spinner moodSpinner = (Spinner) findViewById(R.id.spinner);
        String moodValue = String.valueOf(moodSpinner.getSelectedItem());
        ToggleButton toggle = (ToggleButton) findViewById(R.id.energyToggleButton); boolean energy = toggle.isChecked();
        String energyString;
        if(energy) {
            energyString = "positive";
        }
        else {
            energyString="negative";
        }
        String meditate_string = "";
        Switch meditate_switch = (Switch) findViewById(R.id.meditate_switch);
        boolean meditate = meditate_switch.isChecked();
        if(meditate){
            meditate_string = " that meditates";
        }
        feeling.setText(nameValue + " is a " + energyString + " person in a " + moodValue + " mood");
    }

}
