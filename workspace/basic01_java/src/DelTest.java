import java.io.File;
import java.io.FileWriter;

public class DelTest {
    public static void main(String[] args) {
        try {
            File file = new File(args[0]);
            if (file.exists()) {
                if (file.delete()) {
                    System.out.println("1 file deleted");
                } else {
                    System.out.println("deletion failure");
                }
            } else {
                System.out.println("File Not Found");
            }
        } catch (Exception e) {
            System.out.println("deletion failure" + e);
        }
    }
}
