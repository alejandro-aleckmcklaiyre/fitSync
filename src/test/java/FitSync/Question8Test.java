package test.java.FitSync;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Question8Test extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception {
        // Load the FXML file
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/fxml/fitSyncQuestion8.fxml"));
        Parent root = loader.load();
        
        // Create the scene
        Scene scene = new Scene(root);
        
        // Set up the stage
        primaryStage.setTitle("FitSync Question 8");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
} 