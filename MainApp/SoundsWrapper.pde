import ddf.minim.AudioPlayer;
import ddf.minim.AudioSample;
import ddf.minim.Minim;
import processing.core.PApplet;

public class Sounds {
    private final PApplet mainApp;

    // todo: add minim library to project
    // Minim is a better library if we want more flexibility later & its allows audio files to be repeated before they've ended
    private final Minim minim;
    // Use AudioPlayer for longer/larger files
    private final AudioPlayer backgroundSound;
    // AudioSample should only be used for short wav files cause large files messes up the memory
    private final AudioSample marbleDrop;

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
        backgroundSound = minim.loadFile("/Users/sas/Documents/Sem2 2019/interactive-media-app-master/MainApp/backgroundsound.wav", 2048);
        if ( backgroundSound == null ){
            System.out.println("Relocate background audio file");
        }

        // todo: change to relative path
        //loading dropping sound
        marbleDrop = minim.loadSample("/Users/sas/Documents/Sem2 2019/interactive-media-app-master/MainApp/marbledrop.wav", 512);
        if ( marbleDrop == null ){
            System.out.println("Relocate marble audio file");
        }
    }

    /**
     * This method plays the application's background sound
     */
    public void playBackgroundMusic() {
        backgroundSound.loop(3);
    }
}