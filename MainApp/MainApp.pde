import processing.core.PApplet;


    public static void main(String[] args){
        PApplet.main("MainApp", args);
    }

    private Particles particles;
    private String currentParticleTypeSelection;
    private int particleOutputController;

    public boolean sketchFullScreen(){
        return false;
    }

    public void setup () {
        size(displayWidth, displayHeight);

        particles = new Particles(this);
        currentParticleTypeSelection = Particle.PARTICLE_TYPE_GREEN;
        particleOutputController = 0;
    }

    public void draw() {
        background(1);

        //new SaskiasClass().playSounds(particles.size(); //todo: Class to be implemented by Sas'kia
        //String selectedParticleType = new MatthewsClass().getParticleType()); // todo: Class to be implemented by Matthew

        drawNewParticleOnMousePress(currentParticleTypeSelection);
        particles.render();
    }

    // todo: Liam maybe this can be done in a better way?
    private void setParticleOutputRate(int counter){
        if(counter == 3){
            this.particleOutputController = 0;
        }
    }

    private void drawNewParticleOnMousePress(String particleType){
        if(mousePressed){
            particleOutputController++;
            setParticleOutputRate(particleOutputController);

            particles.addNewParticle(particleType, mouseX, mouseY);
        }
    }

    public void keyPressed(){
        if(key == '1'){
//            for (Particle particle : particles.getParticles()) {
//                if(!(particle.getParticleType().equalsIgnoreCase(Particle.PARTICLE_TYPE_RED))){
//                    particle.setParticleType(Particle.PARTICLE_TYPE_RED);
//                }
//            }
            currentParticleTypeSelection = Particle.PARTICLE_TYPE_RED;
        }
        if(key == '2'){
//            for (Particle particle : particles.getParticles()) {
//                if(!(particle.getParticleType().equalsIgnoreCase(Particle.PARTICLE_TYPE_GREEN))) {
//                    particle.setParticleType(Particle.PARTICLE_TYPE_GREEN);
//                }
//            }
            currentParticleTypeSelection = Particle.PARTICLE_TYPE_GREEN;
        }
        if(key == '3'){
//            for (Particle particle : particles.getParticles()) {
//                if(!(particle.getParticleType().equalsIgnoreCase(Particle.PARTICLE_TYPE_RED))) {
//                    particle.setParticleType(Particle.PARTICLE_TYPE_RED);
//                }
//            }
            currentParticleTypeSelection = Particle.PARTICLE_TYPE_BLUE;
        }
    }

