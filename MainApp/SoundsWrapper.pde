//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;
//import processing.core.PApplet;
//
//public class Sounds {
//    private final PApplet mainApp;
//
//    // todo: add minim library to project
//    // Minim is a better library if we want more flexibility later & its allows audio files to be repeated before they've ended
//    private final Minim minim;
//    // Use AudioPlayer for longer/larger files
//    private final AudioPlayer backgroundSound;
//    // AudioSample should only be used for short wav files cause large files messes up the memory
//    private final AudioSample marbleDrop;
//
//    Sounds(PApplet mainApp){
//        this.mainApp = mainApp;
//        minim = new Minim(this);
//
//        // Load sound files needed
//        loadBackgroundMusic();
//        loadMarbleDropSound();
//    }
//
//    /**
//     * This method defines a sound configuration for the application's background music
//     */
//    public void playBackgroundMusic() {
//        backgroundSound.loop(3);
//    }
//
//    /**
//     * This method loads the background music for the application
//     */
//    private void loadBackgroundMusic() {
//        // todo: change to relative path
//        //loading background music
//        backgroundSound = minim.loadFile("/Users/sas/Documents/Sem2 2019/interactive-media-app-master/MainApp/backgroundsound.wav", 2048);
//        if ( backgroundSound == null ){
//            System.out.println("Relocate background audio file");
//        }
//    }
//
//    /**
//     * This method loads the drop sound used when each particle is dropped
//     */
//    private void loadMarbleDropSound(){
//        // todo: change to relative path
//        //loading dropping sound
//        marbleDrop = minim.loadSample("/Users/sas/Documents/Sem2 2019/interactive-media-app-master/MainApp/marbledrop.wav", 512);
//        if ( marbleDrop == null ){
//            System.out.println("Relocate marble audio file");
//        }
//    }
//}