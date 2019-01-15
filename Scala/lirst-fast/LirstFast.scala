import scala.io.StdIn.readLine

object Main extends App {

  def pig(first: String, last: String): String = 
    (last.head +: first.tail).mkString

  sealed trait Input
  case class Good(first: String, last: String) extends Input
  case class Wrong(badName: List[String]) extends Input
  case object Quit extends Input

  def prompt: Input = {
    val words = readLine("What is your full name? ").split(" ").toList
    words match {
      case first :: last :: Nil =>
        Good(first, last)
      case ":q" :: Nil | ":quit" :: Nil =>
        Quit
      case badName@_ => 
        Wrong(badName)
    }
  }

  var wrong: Int = 0
  while (true) {
    prompt match {
      case Good(first, last) =>
        val lirst = pig(first, last)
        val fast = pig(last, first)
        println(s"$lirst $fast")
      case Wrong(badName) =>
        val name = badName.mkString
        val wordCount = badName.size
        wrong += 1
        println(s"$name has $wordCount words instead of only 2: attempt ${wrong}")
      case Quit => 
        sys.exit(0)
    }
  }

}
