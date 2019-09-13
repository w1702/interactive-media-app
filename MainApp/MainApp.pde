private List<Particle> particles;
    private String selectedParticleType;
    private int particleOutputController;

    public boolean sketchFullScreen(){
        return false;
    }

    public void setup () {
        size(displayWidth, displayHeight);

        particles = new LinkedList<Particle>();
        selectedParticleType = Particle.PARTICLE_TYPE_GREEN;
        particleOutputController = 0;
    }

    public void draw() {
        background(1);

        //new SaskiasClass().playSounds(particles.size(); //todo: Class to be implemented by Sas'kia
        //String selectedParticleType = new MatthewsClass().getParticleType()); // todo: Class to be implemented by Matthew

        renderSelectedParticleTypeOnMousePress(selectedParticleType);
    }

    // todo: Liam maybe this can be done in a better way?
    private void setParticleOutputRate(int counter){
        if(counter == 3){
            this.particleOutputController = 0;
        }
    }

    private void renderSelectedParticleTypeOnMousePress(String selectedParticleType){
        if(mousePressed){
            particleOutputController++;
            setParticleOutputRate(particleOutputController);

            particles.add(new Particle(this, selectedParticleType, mouseX, mouseY));
        }

        for(Particle particle : particles) {
            particle.render(selectedParticleType);
            particle.collision();
        }
    }

    public void keyPressed(){
        if(key == '1'){
            selectedParticleType = Particle.PARTICLE_TYPE_RED;
        }
        if(key == '2'){
            selectedParticleType = Particle.PARTICLE_TYPE_GREEN;
        }
        if(key == '3'){
            selectedParticleType = Particle.PARTICLE_TYPE_BLUE;
        }
    }

    /**
     * Remove obsolete particles from the particles list but does not remove them visually //todo: method needs to be tested
     * @param obsoleteParticles a list of obsolete particles to be deleted from the particles list
     */
    public void removeParticles(List<Particle> obsoleteParticles){
        for (Particle particle : particles) {
            for (Particle obsoleteParticle : obsoleteParticles) {
                if(particle.hashCode() == obsoleteParticle.hashCode()){
                    particles.remove(obsoleteParticle);
                }
            }
        }
    }
