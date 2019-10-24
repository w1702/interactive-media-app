import processing.core.PApplet;

import java.util.List;


    /**
     * This class runs the application
     * Done by: William, Liam
     */

//    private final Sounds sounds = new Sounds(this);
    private final Menu menu = new Menu(this);
    private final Particles particles = new Particles(this);

    private String currentParticleSelection;
    private int particleOutputController;

    public static void main(String[] args){
        PApplet.main("MainApp", args);
    }

//    public boolean sketchFullScreen(){
//        return true;
//    }

    public void setup () {
        size(displayWidth, displayHeight);

        // Default selection
        currentParticleSelection = Particles.PARTICLE_TYPE_RED;
        particleOutputController = 0;
    }

    /**
     * Runs multiple times per second, will:
     * - set the background color
     * - play background sounds
     * - render the menu and listen for the user's selection
     * - draw new particles on mouse press
     * - render all particles, afterwards remove obsolete particles
     */
    public void draw() {
        background(1);

//        sounds.playBackgroundMusic();

        // Matthew's menu
        menu.render();
        if(menu.listenForSelection() != null){
            currentParticleSelection = menu.listenForSelection();
        }

        addNewParticleOnMousePress(currentParticleSelection);

        particles.setParticleLimit(4000);
        particles.render();
        removeObsoleteParticles(particles.getParticlesToDelete()); // Delete obsolete particles after each render loop
    }

    public void keyPressed(){
        if(key == '1'){
            currentParticleSelection = Particles.PARTICLE_TYPE_RED;
        }
        if(key == '2'){
            currentParticleSelection = Particles.PARTICLE_TYPE_GREEN;
        }
        if(key == '3'){
            currentParticleSelection = Particles.PARTICLE_TYPE_BLUE;
        }

        // deletes all particles
        if(key == '4'){
            removeObsoleteParticles(particles.getParticles());
        }
        // todo: remove this after testing
        // for testing purposes, creates ONE particle
        if(key == '5'){
            particles.addNewParticle(currentParticleSelection);
        }
    }

    // todo: can this can be done in a better way?
    /**
     * Sets the rate at which particles get created
     * @param counter counter to delay particle creation
     */
    private void setParticleOutputRate(int counter){
        if(counter == 3){
            this.particleOutputController = 0;
        }
    }

    private void addNewParticleOnMousePress(String particleType){
        if(mousePressed){
            particleOutputController++;
            setParticleOutputRate(particleOutputController);

            particles.addNewParticle(particleType);
        }
    }

    private void removeObsoleteParticles(List<Particle> obsoleteParticles){
        particles.getParticles().removeAll(obsoleteParticles);
    }

