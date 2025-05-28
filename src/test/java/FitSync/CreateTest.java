package test.java.FitSync;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class CreateTest extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception {
        // Load the FXML file
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/fxml/fitSyncCreate.fxml"));
        Parent root = loader.load();
        
        // Create the scene
        Scene scene = new Scene(root);
        
        // Set up the stage
        primaryStage.setTitle("FitSync Create Account");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
} 