//
//import ddf.minim.AudioPlayer;
//import ddf.minim.AudioSample;
//import ddf.minim.Minim;
//import processing.core.PApplet;
//
///**
// * This class contains the sounds used in the application
// * Done by: Saskia
// *
// * External Library used: Minim
// * http://code.compartmental.net/tools/minim/
// * by Damien Di Fede and Anderson Mills
// */
//public class Sounds {
//    private final PApplet mainApp;
//
//    // todo: add minim library to project
//    private final Minim minim;
//    private final AudioPlayer backgroundMusic; // Use AudioPlayer for longer/larger files
//    private final AudioSample marbleDrop; // AudioSample should only be used for short wav files cause large files messes up the memory
//
//
//    /**
//     * Constructor method, sets class fields and loads sounds used by the app
//     * @param mainApp
//     */
//    Sounds(PApplet mainApp){
//        this.mainApp = mainApp;
//        minim = new Minim(mainApp);
//
//        /* Load sound files */
//        // background music
//        backgroundMusic = minim.loadFile(mainApp.sketchPath("sounds/backgroundsound.wav"), 2048);
//        // loading particle drop sound
//        marbleDrop = minim.loadSample(mainApp.sketchPath("sounds/marbledrop.wav"), 2048);
//    }
//
//    public void playBackgroundMusic() {
//        backgroundMusic.play();
//    }
//
//    public void playMarbleSound(){
////        marbleDrop.trigger();
//    }
//
//    public void increaseVolumePerParticle(int particleCount){
//        if(particleCount > 31 && particleCount < 60){
//            backgroundMusic.shiftGain(backgroundMusic.getGain(),50,30);
//        }
//        else if (particleCount >= 60){
//            backgroundMusic.shiftGain(backgroundMusic.getGain(),90,30);
//        }
//        else{
//            backgroundMusic.shiftGain(backgroundMusic.getGain(),-80,30);
//
//        }
//    }
//}