import ddf.minim.AudioPlayer;
import ddf.minim.AudioSample;
import ddf.minim.Minim;
import processing.core.PApplet;

/**
 * This class contains the sounds used in the application
 * Done by: Saskia 
 *
 * External Library used: Minim
 * http://code.compartmental.net/tools/minim/
 * by Damien Di Fede and Anderson Mills
 */
public class Sounds {
    private final PApplet mainApp;

    // todo: add minim library to project
    // Minim is a better library if we want more flexibility later & its allows audio files to be repeated before they've ended
    private final Minim minim;
    // Use AudioPlayer for longer/larger files
    private final AudioPlayer backgroundSound;
    private final AudioSample marbleDrop;
    // AudioSample should only be used for short wav files cause large files messes up the memory
  

    /**
     * Constructor method, sets class fields and loads sounds used by the app
     * @param mainApp
     */
    Sounds(PApplet mainApp){
        this.mainApp = mainApp;
        minim = new Minim(mainApp);

        // Load sound files needed
        // todo: change to relative path
        //loading background music
        backgroundSound = minim.loadFile("/Users/12949018/Desktop/interactive-media-app/MainApp/sounds/backgroundsound.wav", 2048);
        if ( backgroundSound == null ){
            System.out.println("Unable to locate background audio file");
        }
        
        marbleDrop = minim.loadSample("/Users/12949018/Desktop/interactive-media-app/MainApp/sounds/marbledrop.wav", 2048);
        if ( marbleDrop == null ){
            System.out.println("Unable to locate background audio file");
        }
  
    }

    private void changeAudioVolume(int counter){
        if(counter > 31 && counter < 60){
           backgroundSound.shiftGain(backgroundSound.getGain(),50,30);
        }
        
        else if (counter >= 60){
          
           backgroundSound.shiftGain(backgroundSound.getGain(),90,30);
  
        }
        
        else if (counter <= 31){
          
           backgroundSound.shiftGain(backgroundSound.getGain(),-80,30);
  
        }
    }

    public void playMarbleSound(){
      marbleDrop.trigger();
    }
    /**
     * This method plays the application's background sound
     */
    public void playBackgroundMusic() {
        backgroundSound.play();
    }
}
