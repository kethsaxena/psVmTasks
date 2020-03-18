import scala.io.Source

object HelloWorldSC extends App {
  //println("Hello World Praketa")
  val filename = "home/kethsaxena/IdeaProjects/HelloWorldJava/Shakespeare.txt"

   def myMain(args:Array[String]) {

    println(Source.fromFile(filename)) // returns scala.io.BufferedSource non-empty iterator instance

    val s1 = Source.fromFile(filename).mkString; //returns the file data as String
    println(s1)

    //splitting String data with white space and calculating the number of occurrence of each word in the file
    val counts = s1.split("\\s+").groupBy(x=>x).mapValues(x=>x.length)

    println(counts)

    println("Count of JournalDev word:"+counts("JournalDev"))

  }

}
