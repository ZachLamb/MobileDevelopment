package zach.milestonetwo;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Random;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void pickImage(View view){


        //grab ID of image and store it in variable "imagePicked"
        ImageButton imagePickedOne = (ImageButton) findViewById(R.id.one);
        ImageButton imagePickedTwo = (ImageButton) findViewById(R.id.two);
        ImageButton imagePickedThree = (ImageButton) findViewById(R.id.three);
        switch (view.getId())
        {
            case R.id.one:
                //use ValueAnimator to make animation of cup moving up.
                ObjectAnimator anim0 = ObjectAnimator.ofFloat(imagePickedOne, "translationY", 0,-400);
                anim0.setDuration(300);
                anim0.start();
                resetCups("one",imagePickedOne);
                break;
            case R.id.two:

                ObjectAnimator anim1 = ObjectAnimator.ofFloat(imagePickedTwo, "translationY", 0,-400);
                anim1.setDuration(300);
                anim1.start();
                resetCups("two",imagePickedTwo);
                break;
            case R.id.three:

                ObjectAnimator anim2 = ObjectAnimator.ofFloat(imagePickedThree, "translationY", 0,-400);
                anim2.setDuration(300);
                anim2.start();
                resetCups("three",imagePickedThree);
                break;
        }

    }
    public void resetCups(String number,ImageButton imagePick){
        ImageView cupOne = (ImageView)findViewById(R.id.imageView);
        ImageView cupTwo = (ImageView)findViewById(R.id.imageView2);
        ImageView cupThree = (ImageView)findViewById(R.id.imageView3);
        if(number.equals("one")){
            if(cupOne.getVisibility() == View.VISIBLE){
                Context context = getApplicationContext();
                CharSequence text = "You Win!";
                int duration = Toast.LENGTH_SHORT;

                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
                scored(true);
                ObjectAnimator animTemp1 = ObjectAnimator.ofFloat(imagePick, "translationY", 0,0);
                animTemp1.setDuration(300);
                animTemp1.setStartDelay(1000);
                animTemp1.start();
            }
            else{
                Context context = getApplicationContext();
                CharSequence text = "You lost :(";
                int duration = Toast.LENGTH_SHORT;

                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
                scored(false);
                ObjectAnimator animTemp1 = ObjectAnimator.ofFloat(imagePick, "translationY", 0,0);
                animTemp1.setDuration(300);
                animTemp1.setStartDelay(1000);
                animTemp1.start();

            }
        }
        else if(number.equals("two")){
            if(cupTwo.getVisibility() == View.VISIBLE){
                Context context = getApplicationContext();
                CharSequence text = "You Win!";
                int duration = Toast.LENGTH_SHORT;

                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
                scored(true);
                ObjectAnimator animTemp2 = ObjectAnimator.ofFloat(imagePick, "translationY", 0,0);
                animTemp2.setDuration(300);
                animTemp2.setStartDelay(1000);
                animTemp2.start();
            }
            else{
                Context context = getApplicationContext();
                CharSequence text = "You lost :(";
                int duration = Toast.LENGTH_SHORT;

                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
                scored(false);
                ObjectAnimator animTemp2 = ObjectAnimator.ofFloat(imagePick, "translationY", 0,0);
                animTemp2.setDuration(300);
                animTemp2.setStartDelay(1000);
                animTemp2.start();

            }
        }
        else{
            if(cupThree.getVisibility() == View.VISIBLE){
                Context context = getApplicationContext();
                CharSequence text = "You Win!";
                int duration = Toast.LENGTH_SHORT;

                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
                scored(true);
                ObjectAnimator animTem3 = ObjectAnimator.ofFloat(imagePick, "translationY", 0,0);
                animTem3.setDuration(300);
                animTem3.setStartDelay(1000);
                animTem3.start();
            }
            else{
                Context context = getApplicationContext();
                CharSequence text = "You lost :(";
                int duration = Toast.LENGTH_SHORT;

                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
                scored(false);
                ObjectAnimator animTem3 = ObjectAnimator.ofFloat(imagePick, "translationY", 0,0);
                animTem3.setDuration(300);
                animTem3.setStartDelay(1000);
                animTem3.start();

            }
        }

        cupOne.setVisibility(View.INVISIBLE);
        cupTwo.setVisibility(View.INVISIBLE);
        cupThree.setVisibility(View.INVISIBLE);

        Random rand = new Random();
        int  cup = rand.nextInt(3) + 1;

        switch (cup){
            case 1:
                cupOne.setVisibility(View.VISIBLE);
                break;
            case 2:
                cupTwo.setVisibility(View.VISIBLE);
                break;
            case 3:
                cupThree.setVisibility(View.VISIBLE);
                break;
        }


    }
    public void scored(boolean update){
        TextView currentScore = (TextView)findViewById(R.id.currentScore);
        int currScore = Integer.parseInt(currentScore.getText().toString());

        if(update){
            currScore = currScore + 1;
            currentScore.setText(Integer.toString(currScore));
        }
    }
}
