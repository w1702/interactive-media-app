import processing.core.PApplet;

public class Particle {
    /* Constant String representations of all the particle types */
    public static final String PARTICLE_TYPE_RED = "red";
    public static final String PARTICLE_TYPE_GREEN = "green";
    public static final String PARTICLE_TYPE_BLUE = "blue";

    private final PApplet mainApp;

    private String particleType;
    private float xPosition;
    private float yPosition;
    private float radius;
    private float yVelocity;

    Particle(PApplet mainApp, String particleType, float xPosition, float yPosition) {
        this.mainApp = mainApp;
        this.particleType = particleType;
        this.xPosition = xPosition;
        this.yPosition = yPosition;

        // Different particleTypes may have different properties
        if(particleType.equalsIgnoreCase(PARTICLE_TYPE_RED)){
            this.radius = 5;
            this.yVelocity = (float) 1;
        }
        if(particleType.equalsIgnoreCase(PARTICLE_TYPE_GREEN)){
            this.radius = 5;
            this.yVelocity = (float) 1;
        }
        if(particleType.equalsIgnoreCase(PARTICLE_TYPE_BLUE)){
            this.radius = 5;
            this.yVelocity = (float) 1;
        }
    }

    public void render() {
        final float particleDiameter = radius * 2;

        // Set the selected particleType to it's appropriate color
        if (particleType.equalsIgnoreCase(PARTICLE_TYPE_RED)) {
            mainApp.fill(255, 0, 0);
        }
        if (particleType.equalsIgnoreCase(PARTICLE_TYPE_GREEN)) {
            mainApp.fill(0, 255, 0);
        }
        if (particleType.equalsIgnoreCase(PARTICLE_TYPE_BLUE)) {
            mainApp.fill(0, 0, 255);
        }

        // Draw the selected particleType
        mainApp.ellipse(xPosition, yPosition, particleDiameter, particleDiameter);

        simulateFalling();
    }

    private void simulateFalling() {
        if(yVelocity > 0) {
            // Increment fall velocity every second
            yVelocity += .1;
            // Make the particle fall
            yPosition = yPosition + yVelocity;

            // todo: investigate why we need to - 50 from displayHeight this to work
            if (yPosition > mainApp.displayHeight - 50) {
                yPosition = mainApp.displayHeight - 50;
                yVelocity = 0;
            }
        }
    }

    public void collapse(){
        this.radius = radius * 4;
    }

    public String getParticleType(){
        return particleType;
    }

    public float getXPosition(){
        return xPosition;
    }

    public float getYPosition(){
        return yPosition;
    }

    public float getRadius(){
        return radius;
    }

    public float getYVelocity(){
        return yVelocity;
    }

    public void setYVelocity(float yVelocity){
        this.yVelocity = yVelocity;
    }
}