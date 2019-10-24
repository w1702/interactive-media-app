import processing.core.PApplet;
import processing.core.PFont;

import java.util.ArrayList;
import java.util.List;

/**
 * This class represents the menu and listens for the user's changes in particle type selection
 * Done by: Matthew
 */
public class Menu {
    private final PApplet mainApp;

    private final PFont font;
    private final List<Button> buttons = new ArrayList<Button>();
    private final float size = 20;

    public Menu(PApplet mainApp){
        this.mainApp = mainApp;

        font = mainApp.createFont("Times-Roman", size);
        //font = mainApp.loadFont("8BITWONDER.ttf");

        buttons.add(new Button(mainApp, 40, 40, Particles.PARTICLE_TYPE_RED));
        buttons.add(new Button(mainApp,120, 40, Particles.PARTICLE_TYPE_GREEN));
        buttons.add(new Button(mainApp,200, 40, Particles.PARTICLE_TYPE_BLUE));
    }

    public void render(){
        mainApp.textFont(font, size);

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

    /**
     * This inner class represents a single button in the menu
     */
    private class Button {
        private PApplet mainApp;

        private int x, y;
        private String particleTypeSelection;

        Button(PApplet mainApp, int x, int y, String particleTypeSelection) {
            this.mainApp = mainApp;
            this.x = x;
            this.y = y;
            this.particleTypeSelection = particleTypeSelection;
        }

        private void render() {
            mainApp.fill(255);
            if (mouseOver()) {
                mainApp.fill(160);
            }

            mainApp.fill(0);
            mainApp.text(particleTypeSelection, x, y + 30);

            if(particleTypeSelection.equalsIgnoreCase(Particles.PARTICLE_TYPE_RED)){
                mainApp.fill(255);
                mainApp.ellipse(x+25, y+25, mainApp.textWidth(particleTypeSelection)+35, mainApp.textWidth(particleTypeSelection) + 35);
                mainApp.fill(255, 0, 0);
                if (mouseOver()) {
                    mainApp.fill(247, 105, 131);
                }
                mainApp.ellipse(x+25, y+25, mainApp.textWidth(particleTypeSelection)+20, mainApp.textWidth(particleTypeSelection)+20);
                mainApp.fill(255);
                mainApp.text(particleTypeSelection, x + 10, y + 30);
            }
            if(particleTypeSelection.equalsIgnoreCase(Particles.PARTICLE_TYPE_GREEN)){
                mainApp.fill(255);
                mainApp.ellipse(x+25, y+25, mainApp.textWidth(particleTypeSelection)+15, mainApp.textWidth(particleTypeSelection) + 15);
                mainApp.fill(0, 255, 0);
                if (mouseOver()) {
                    mainApp.fill(146, 211, 137);
                }
                mainApp.ellipse(x+25, y+25, mainApp.textWidth(particleTypeSelection), mainApp.textWidth(particleTypeSelection));
                mainApp.fill(0);
                mainApp.text(particleTypeSelection, x, y + 30);
            }
            if(particleTypeSelection.equalsIgnoreCase(Particles.PARTICLE_TYPE_BLUE)){
                mainApp.fill(255);
                mainApp.ellipse(x+25, y+25, mainApp.textWidth(particleTypeSelection)+30, mainApp.textWidth(particleTypeSelection) + 30);
                mainApp.fill(0, 0, 255);
                if (mouseOver()) {
                    mainApp.fill(137, 147, 211);
                }
                mainApp.ellipse(x+25, y+25, mainApp.textWidth(particleTypeSelection) + 15, mainApp.textWidth(particleTypeSelection) + 15);
                mainApp.fill(255);
                mainApp.text(particleTypeSelection, x + 5, y + 30);
            }
        }

        private boolean mouseOver() {
            return mainApp.mouseX >= x
                    && mainApp.mouseY >= y
                    && mainApp.mouseX <= x + mainApp.textWidth(particleTypeSelection)
                    && mainApp.mouseY <= y + mainApp.textWidth(particleTypeSelection);
        }

        private String getParticleTypeSelection(){
            return particleTypeSelection;
        }
    }
}