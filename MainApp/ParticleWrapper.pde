import processing.core.PApplet;

public class Particle {
    private PApplet mainApp;
    private float radius;
    private float xPosition;
    private float yPosition;
    private float xVelocity;
    private float yVelocity;

    Particle(PApplet mainApp, float xPosition, float yPosition, int choiceColor) {
        this.mainApp = mainApp;
        this.radius = radius = 5;
        this.xPosition = xPosition;
        this.yPosition = yPosition;
        this.xVelocity = (float) 0.98;
        this.yVelocity = 0;
        mainApp.fill(255, choiceColor, 30);
    }

    void render(int choice) {
        float particleDiameter = radius * 2;

        if (choice == 0) {
            mainApp.fill(choice, 255, 28);
        }
        if (choice == 1) {
            mainApp.fill(0, 100, 10);
        }

        mainApp.ellipse(xPosition, yPosition, particleDiameter, particleDiameter);
        yVelocity += .098;

        yPosition = yPosition + yVelocity;
        //x=x+velocityX;

    }

    void collision() {
        if (yPosition > 550) {
            yPosition = 550;
            yVelocity = 0;
            yVelocity *= -1;
        }

        if (xPosition < 50) {
            xPosition = 50;
            xVelocity = (float) .5;
            xVelocity *= -1;
        }

        if (xPosition > 650) {
            xPosition = 650;
            xVelocity -= .5;
            xVelocity *= -1;
        }

    }
}
