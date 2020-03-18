import java.io.BufferedReader;
import java.io.FileReader;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

public class countShake {
    public static void main(String[] args) throws Exception {
        System.out.println("Hello World Shake");
        Path path = Paths.get   (System.getProperty("user.dir"))
                .resolve("Shakespeare.txt");

        BufferedReader reader = new BufferedReader(new FileReader(path.toFile()));

        Map<String,Integer> frequency = new HashMap<>();
        String pattern = "[\\W\\d]";


        String line =reader.readLine();
        while(line!=null){
            //System.out.println("Processing line: "+line);

            if(!line.trim().equals("")){
                String [] words =line.split(" ");

                for(String word:words){
                    if(word==null||word.trim().equals("")){
                        continue;
                    }
                    String processed = word.toLowerCase().replaceAll(pattern," ");

                    if(frequency.containsKey(processed)){
                        frequency.put(processed,frequency.get(processed)+1);
                    }else{frequency.put(processed,1);}
                }
            }

            line =reader.readLine();
        }

        System.out.println(frequency);

    }

}

