import processing.core.PApplet;
import processing.core.PFont;

import java.util.ArrayList;
import java.util.List;

public class Menu {
    private final PApplet mainApp;

    private final PFont font;
    private final List<Button> buttons = new ArrayList<Button>();

    public Menu(PApplet mainApp){
        this.mainApp = mainApp;

        font = mainApp.createFont("Times-Roman", 20);

        buttons.add(new Button(mainApp, 40, 40, Particle.PARTICLE_TYPE_RED));
        buttons.add(new Button(mainApp,100, 40, Particle.PARTICLE_TYPE_GREEN));
        buttons.add(new Button(mainApp,160, 40, Particle.PARTICLE_TYPE_BLUE));
    }

    public void render(){
        mainApp.textFont(font);

        for (Button button : buttons) {
            button.render();
        }
    }

    public String listenForSelection(){
        for (Button button : buttons) {
            if (button.mouseOver()) {
                return button.getParticleTypeSelection();
            }
        }
        return null;
    }

    public class Button {
        private PApplet mainApp;

        private int x, y;
        private String particleTypeSelection;

        Button(PApplet mainApp, int x, int y, String particleTypeSelection) {
            this.mainApp = mainApp;
            this.x = x;
            this.y = y;
            this.particleTypeSelection = particleTypeSelection;
        }

        public void render() {
            mainApp.fill(200);
            if (mouseOver()) {
                mainApp.fill(225);
            }
            mainApp.rect(x, y, mainApp.textWidth(particleTypeSelection), 25);
            mainApp.fill(0);
            mainApp.text(particleTypeSelection, x, y + 20);
        }

        public boolean mouseOver() {
            return mainApp.mouseX >= x
                    && mainApp.mouseY >= y
                    && mainApp.mouseX <= x + mainApp.textWidth(particleTypeSelection)
                    && mainApp.mouseY <= y + 22;
        }

        public String getParticleTypeSelection(){
            return particleTypeSelection;
        }
    }
}
