package zach.milestonetwo;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void pickImage(View view){

       //grab ID of image and store it in variable "imagePicked"
        ImageButton imagePicked = (ImageButton) findViewById(R.id.imageButton);
        //check if that ball is activated and store it in variable "ballIsUnder"
        ImageView ballIsUnder = (ImageView) findViewById(R.id.imageView);
        //use ValueAnimator to make animation of cup moving up.

        //check if ball under that cup is activated
        //if( imagePicked == ballIsUnder){ printAlert("you win!")
        //else {pick again!}
        //call function to display alert with results
        //call function resetCups()
    }
    public void resetCups(View view){
        //put cups back into place
        //hide all balls
        // call random function to pick number 1, 2, or 3
        //activate/show ball number based on random number from above
    }
}
