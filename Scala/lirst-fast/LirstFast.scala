import scala.annotation.tailrec
import scala.io.StdIn.readLine

object Main extends App {

  def pig(first: String, last: String): String = 
    (last.head +: first.tail).mkString

  def prompt: List[String] = 
    readLine("What is your full name? ").split(" ").toList

  final case class State(quit: Boolean, wrong: Int)

  def handle(state: State): State = 
    prompt match {
      case first :: last :: Nil =>
        val lirst = pig(first, last)
        val fast = pig(last, first)
        println(s"$lirst $fast")
        State(false, 0)
      case ":q" :: Nil | ":quit" :: Nil =>
        State(true, state.wrong)
      case badName@_ => 
        val name = badName.mkString(" ")
        val wordCount = badName.size
        val wrongInc = state.wrong + 1
        println(s"$name has $wordCount words instead of only 2: attempt ${wrongInc}")
        State(false, wrongInc)
    }

  @tailrec
  def run(prev: State, stream: Stream[State => State]): State =
    stream match {
      case h #:: hs =>
        val next = h(prev)
        if (!next.quit) run(next, hs)
        else next
      case Stream.Empty => prev
    }

  run(State(false, 0), Stream.continually(handle(_)))
}
