import java.io.*;

public class CopyTest {
    public static void main(String[] args) {
        String path1 = args[0];
        String path2 = args[1];

        FileReader fr = null;
        FileWriter fw = null;
        PrintWriter out = null;
        try {

            fr = new FileReader(path1);
            fw = new FileWriter(path2, false);
            out = new PrintWriter(fw, true);


            while (true) {
                int data = fr.read();
                if(data == -1) {
                    break;
                } else {
                    out.printf("%c", data);
                }
            }

        } catch (Exception e) {
            System.out.println("copy failure");
            e.printStackTrace();
        } finally {
            try {
                if (fw != null) {out.close();}
            } catch (Exception e) {}
            try {
                if (out != null) {fr.close();}
            } catch (Exception e) {}
            try {
                if (fw != null) {fw.close();}
            } catch (Exception e) {}
        }

    }
}
