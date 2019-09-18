import processing.core.PApplet;

import java.util.*;

public class Particles {
    private final PApplet mainApp;

    private List<Particle> particles;
    private Reaction reaction;

    Particles(PApplet mainApp){
        this.mainApp = mainApp;
        particles = new LinkedList<Particle>();
        reaction = new Reaction(mainApp);
    }

    public void render(){
        for(Particle particle : particles) {
            particle.render();
        }
    }

    public void addNewParticle(String particleType, int mouseX, int mouseY){
        Particle newParticle = new Particle(mainApp, particleType, mainApp.mouseX, mouseY);
        particles.add(newParticle);

        List<String> particleTypesTheNewParticleFellOn = particleTypesTheNewParticleFellOn(newParticle);
        if(particleTypesTheNewParticleFellOn != null && particleTypesTheNewParticleFellOn.size() > 0) {
            reaction.react(particleType, particleTypesTheNewParticleFellOn); // todo: how to get the particle type on the floor?
        }
    }

    // todo: work in progress
    private List<String> particleTypesTheNewParticleFellOn(Particle newParticle) {
        ArrayList<String> particleTypesTheNewParticleFellOn = new ArrayList<String>();

//        for (Particle particle : particles) {
//            if (particle.getXPosition() == newParticle.getXPosition() && particle.getYPosition() == newParticle.getYPosition()) {
//                if(getParticlesByXAndYPosition(particle.getXPosition(), particle.getXPosition()).size() > 0){
//                    particleTypesTheNewParticleFellOn.add(particle.getParticleType());
//                }
//            }
//        }
        return particleTypesTheNewParticleFellOn;


    }

    private List<String> getParticleTypesByXandYposition(float xPosition, float yPosition){
        List<String> particleTypes = new ArrayList<String>();
        for(Particle particle : getParticlesByXAndYPosition(xPosition, yPosition)){
            particleTypes.add(particle.getParticleType());
        }
        return particleTypes;
    }

    /**
     * Get a List of Particles at the given x and y Positions
     * @param xPosition the x axis position
     * @param yPosition the y axis position
     * @return a List of Particles
     */
    private List<Particle> getParticlesByXAndYPosition(float xPosition, float yPosition){
        List<Particle> particlesOnGivenPosition = new ArrayList<Particle>();
        for (Particle particle : particles) {
            if (particle.getXPosition() == xPosition && particle.getYPosition() == yPosition){
                particlesOnGivenPosition.add(particle);
            }
        }
        return particlesOnGivenPosition;
    }

    /**
     * Remove obsolete particles from the particles list
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

    public List<Particle> getParticles(){
        return particles;
    }
}
