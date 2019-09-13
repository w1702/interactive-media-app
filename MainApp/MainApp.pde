    private List<Particle> particles;
    private int particleOutputController;
    private String particleType;

    public boolean sketchFullScreen(){
        return false;
    }

    public void setup () {
        size(displayWidth, displayHeight);
        particles = new ArrayList<Particle>();
        particleType = Particle.PARTICLE_TYPE_RED; // PLACEHOLDER UNTIL MENU IS WORKING

        particleOutputController = 0;
    }

    public void draw() {
        background(1);

        //new SaskiasClass().playSounds(particles.size(); //todo: Class to be implemented by Sas'kia

        //setParticleType(new MatthewsClass().getParticleType()); // todo: Class to be implemented by Matthew

        renderSelectedParticleTypeOnMousePress();
    }

    // todo: Liam maybe this can be done in a better way?
    private void setParticleOutputRate(int counter){
        if(counter == 3){
            this.particleOutputController = 0;
        }
    }

    private void renderSelectedParticleTypeOnMousePress(){
        if(mousePressed){
            particleOutputController++;
            setParticleOutputRate(particleOutputController);

            particles.add(new Particle(this, particleType, mouseX, mouseY));
        }

        for(Particle particle :particles) {
            particle.render(particleType);
            particle.collision();
        }
    }

    private void setParticleType(String particleType){
        this.particleType = particleType;
    }

    public void keyPressed(){
        if(key == '1'){
            setParticleType(Particle.PARTICLE_TYPE_RED);
        }
        if(key == '2'){
            setParticleType(Particle.PARTICLE_TYPE_GREEN);
        }
        if(key == '3'){
            setParticleType(Particle.PARTICLE_TYPE_BLUE);
        }
    }
