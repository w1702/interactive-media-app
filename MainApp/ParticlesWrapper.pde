import processing.core.PApplet;

import java.util.ArrayList;
import java.util.List;

/**
 * This class represents a collection of all the particles in the application
 * Done by: William, Liam
 */
public class Particles {
    /* Constant String representations of all the particle types */
    public static final String PARTICLE_TYPE_RED = "red";
    public static final String PARTICLE_TYPE_GREEN = "green";
    public static final String PARTICLE_TYPE_BLUE = "blue";

    private final PApplet mainApp;

    private final Sounds sounds;
    private final List<Particle> particles = new ArrayList<Particle>();
    private final Reactions reactions = new Reactions(this);
    private final List<Particle> particlesToDelete = new ArrayList<Particle>();

    Particles(PApplet mainApp, Sounds sounds){
        this.mainApp = mainApp;
        this.sounds = sounds;
    }

    public void render(){
        for(Particle particle : particles) {
            // render each particle
            particle.render();

            // Make particles react with their neighbours
            List<Particle> neighbourParticles = getNeighbourParticles(particle);
            reactions.render(particle, neighbourParticles);
            
            // todo: Saskia's sound logic - needs to be revised 
//            if(!particle.getFalling()){
//              sounds.playMarbleSound();
//            }
        }
    }

    public void addNewParticle(String particleType){
        Particle newParticle = new Particle(mainApp, particleType, mainApp.mouseX, mainApp.mouseY);
        particles.add(newParticle);
    }

    public void removeParticles(List<Particle> particlesToDelete){
        particles.removeAll(particlesToDelete);
    }

    /**
     * Get the neighbour particles in contact with the given particle
     * @param primaryParticle the Particle to get the neighbours of
     */
    public List<Particle> getNeighbourParticles(Particle primaryParticle){
        List<Particle> neighbourParticles = new ArrayList<Particle>();
        // because this loops over all the particles, it will also include the primary particle

        for (Particle particle : particles) {
            if(particle.equals(primaryParticle)){
                continue;
            }
            if(particlesAreInContact(particle, primaryParticle)) {
                neighbourParticles.add(particle);
            }
        }
        return neighbourParticles;
    }

    // todo: revise logic in this method(particle1.getXPosition(), particle1.getYPosition(), particle2.getXPos
    /**
     * Returns true if two particles are in contact with each other, otherwise returns false
     * @param particle1 the first Particle
     * @param particle2 the second Particle
     * @return a boolean value
     */
    private boolean particlesAreInContact(Particle particle1, Particle particle2){
        return MainApp.dist(particle1.getXPosition(), particle1.getYPosition(), particle2.getXPosition(), particle2.getYPosition())
                <= particle1.getRadius() + particle2.getRadius();
    }

    /**
     * Sets the limit of the amount of particles, for performance purposes
     * If amount of particles goes over the set limit, remove particles from the particles list in a first in first out queue like order
     * @param maxNumberOfParticles the maximum number of particles before the system starts deleting them
     */
    public void setParticleLimit(int maxNumberOfParticles){
        if(particles.size() > maxNumberOfParticles){
            particles.remove(particles.get(0));
        }
    }

    public List<Particle> getParticlesToDelete(){
        return particlesToDelete;
    }

    public List<Particle> getParticles(){
        return particles;
    }
}
