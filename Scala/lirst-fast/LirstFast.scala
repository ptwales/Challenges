import scala.io.StdIn.readLine

object Main extends App {

  def pig(first: String, last: String): String = 
    (last.head +: first.tail).mkString

  def prompt: String = 
    readLine("What is your full name? ").split(" ").toList

  var wrong: Int = 0
  while (true) {
    prompt match {
      case first :: last :: Nil =>
        val lirst = pig(first, last)
        val fast = pig(last, first)
        println(s"$lirst $fast")
      case ":q" :: Nil | ":quit" :: Nil =>
        sys.exit(0)
      case badName@_ => 
        val name = badName.mkString
        val wordCount = badName.size
        wrong += 1
        println(s"$name has $wordCount words instead of only 2: attempt ${wrong}")
    }
  }

}
