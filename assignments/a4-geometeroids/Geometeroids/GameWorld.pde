import java.awt.*;
import java.util.Random;
import java.util.function.IntConsumer;
import java.util.ArrayList;
import java.util.Iterator;

public class GameWorld {
    private final IntConsumer gameOverNotifier;
    private final GameState gameState = GameState.INSTANCE;

    private final List<Geometeroid> geometeroids = new ArrayList<>();

    private final List<Explosion> explosions = new ArrayList<>();

    private final HeadsUpDisplay hud;

    private Explosion playerExplosion = null;
    private List<Bullet> bullets = new ArrayList<>();
    private int bulletsCooldown = 0;
    private boolean firing = false;

    private Player player;

    public GameWorld(IntConsumer gameOverNotifier) {
        this.gameOverNotifier = gameOverNotifier;

        // HUD
        hud = new HeadsUpDisplay();

        // Player
        player = new Player();

        // Geometeroids
        for (int i = 0; i < 10; i++) {
            geometeroids.add(new Geometeroid());
        }
    }

    public void update() {
        // Let everything update
        if (firing && bulletsCooldown == 0) {
            bullets.add(player.fire());
            bulletsCooldown = 5;
        }
        bullets.forEach(Bullet::update);
        bullets.removeIf(Bullet::isOffScreen);

        geometeroids.forEach(Geometeroid::update);

        explosions.forEach(Explosion::update);
        explosions.removeIf(Explosion::isDone);

        if (playerExplosion != null) {
            playerExplosion.update();
            if (playerExplosion.isDone()) {
                gameOverNotifier.accept(gameState.score());
            }
        } else {
            player.update();
        }

        handleCollisions();

        bulletsCooldown--;
        bulletsCooldown = Math.max(bulletsCooldown, 0);

        // Draw everything to the screen
        background(Colors.BACKGROUND);

        if (playerExplosion != null) {
            playerExplosion.draw();
        } else {
            player.draw();
        }

        bullets.forEach(b -> b.draw());
        geometeroids.forEach(Geometeroid::draw);

        // Explosions!!
        explosions.forEach(Explosion::draw);

        hud.draw();
    }

    public void handleKeyPressed(int keyCode) {
        switch(keyCode) {
            case KeyEvent.VK_LEFT:
                player.turnLeft();
                break;
            case KeyEvent.VK_RIGHT:
                player.turnRight();
                break;
            case KeyEvent.VK_UP:
                player.accelerate();
                break;
            case KeyEvent.VK_SPACE:
                firing = true;
                break;
        }
    }

    public void handleKeyReleased(int keyCode) {
        switch(keyCode) {
            case KeyEvent.VK_LEFT: case KeyEvent.VK_RIGHT:
                player.stopTurning();
                break;
            case KeyEvent.VK_UP:
                player.decelerate();
                break;
            case KeyEvent.VK_SPACE:
                firing = false;
                break;
        }
    }

    public void handleCollisions() {
        // Check for collisions between player and Geometeroids
        for (var g : geometeroids) {
            if (player.collidesWith(g)) {
                g.destroy();
                explosions.add(g.explode());
                gameState.loseALife();
                player.hit();

                break;
            }
        }

        if (gameState.playerDied() && playerExplosion == null) {
            playerExplosion = player.explode();
        }

        geometeroids.removeIf(Geometeroid::isDestroyed);

        // Check for collisions between player bullets and Geometeroids
        for (Iterator<Bullet> bulletIterator = bullets.iterator(); bulletIterator.hasNext(); ) {
            var bullet = bulletIterator.next();
            for (Iterator<Geometeroid> geomIterator = geometeroids.iterator(); geomIterator.hasNext(); ) {
                var geometeroid = geomIterator.next();

                if (geometeroid.contains(bullet.position())) {
                    bulletIterator.remove();
                    geometeroid.hit();

                    if (geometeroid.isDestroyed()) {
                        explosions.add(geometeroid.explode());
                        // geometeroids.split(geometeroid);
                        gameState.addPoints(geometeroid.scorePoints());
                        geomIterator.remove();
                    } else {
                        // show geometeroid was hit
                        explosions.add(geometeroid.impact());
                    }

                    break;
                }
            }
        }
    }
}
