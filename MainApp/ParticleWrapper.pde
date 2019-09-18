import processing.core.PApplet;

public class Particle {
    /* Constant String representations of all the particle types */
    public static final String PARTICLE_TYPE_RED = "particleTypeRed";
    public static final String PARTICLE_TYPE_GREEN = "particleTypeGreen";
    public static final String PARTICLE_TYPE_BLUE = "particleTypeBlue";

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

        simulateGravity();
    }

    private void simulateGravity() {
        // Increment fall velocity every second
        yVelocity += .098;
        // Make the particle fall
        yPosition = yPosition + yVelocity;

        // todo: investigate why 850 works but not displayHeight of 900
        if (yPosition > mainApp.displayHeight - 50) {
            yPosition = mainApp.displayHeight - 50 ;
            yVelocity = 0;
        }
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
}