import java.util.*;

    private List<Particle> particles;
    private int counter;
    private int choice;

    public void setup () {
        particles = new ArrayList<Particle>();
        counter = 0;
        choice = 0;
        size(800,600);
    }

    public void keyPressed(){
        if(keyCode == UP){
            choice++;
        }
        if(keyCode == DOWN){
            choice--;
        }
    }

    public void draw() {
        background(1);

        if(mousePressed){
            counter++;

            if(choice == 0){
                fill(5,40,233);
            }
            if(choice == 1){
                fill(3,200,133);
            }
            if(counter == 2){
                particles.add(new Particle(mouseX, mouseY, choice));
            }
        }

        if(counter == 3){
            counter = 0;
        }

        for(Particle particle :particles) {
            particle.render(choice);
            particle.collision();
        }
    }

    private class Particle {
        private float radius;
        private float xPosition;
        private float yPosition;
        private float xVelocity;
        private float yVelocity;

        Particle(float xPosition, float yPosition, int choiceColor) {
            this.radius = radius = 5;
            this.xPosition = xPosition;
            this.yPosition = yPosition;
            this.xVelocity = (float) 0.98;
            this.yVelocity = 0;
            fill(255, choiceColor, 30);
        }

        void render(int choice) {
            float particleDiameter = radius * 2;

            if (choice == 0) {
                fill(choice, 255, 28);
            }
            if (choice == 1) {
                fill(0, 100, 10);
            }

            ellipse(xPosition, yPosition, particleDiameter, particleDiameter);
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
