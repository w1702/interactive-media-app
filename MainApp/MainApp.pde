import processing.core.PApplet;


    //private final Sounds sounds = new Sounds(this);
    private final Menu menu = new Menu(this);
    private final Particles particles = new Particles(this);

    private String currentParticleSelection;
    private int particleOutputController;

    public static void main(String[] args){
        PApplet.main("MainApp", args);
    }

//    public boolean sketchFullScreen(){
//        return false;
//    }

    public void setup () {
        size(displayWidth, displayHeight);

        // Default selection
        currentParticleSelection = Particle.PARTICLE_TYPE_RED;
        particleOutputController = 0;
    }

    public void draw() {
        background(1);
        particles.setParticleLimit(4000);
//        sounds.playBackgroundMusic();

        menu.render();
        if(menu.listenForSelection() != null){
            currentParticleSelection = menu.listenForSelection();
        }

        drawNewParticleOnMousePress(currentParticleSelection);
        particles.render();
    }

    public void keyPressed(){
        if(key == '1'){
            currentParticleSelection = Particle.PARTICLE_TYPE_RED;
        }
        if(key == '2'){
            currentParticleSelection = Particle.PARTICLE_TYPE_GREEN;
        }
        if(key == '3'){
            currentParticleSelection = Particle.PARTICLE_TYPE_BLUE;
        }

        // todo: remove this after testing
        // for testing purposes, creates ONE particle
        if(key == '4'){
            particles.addNewParticle(Particle.PARTICLE_TYPE_RED);
        }
    }

    // todo: can this can be done in a better way?
    private void setParticleOutputRate(int counter){
        if(counter == 3){
            this.particleOutputController = 0;
        }
    }

    private void drawNewParticleOnMousePress(String particleType){
        if(mousePressed){
            particleOutputController++;
            setParticleOutputRate(particleOutputController);

            particles.addNewParticle(particleType);
        }
    }

