object Main extends App {

  val fizz: String = "fizz"

  val buzz: String = "buzz"

  def fizzBuzz(n: Int): String = 
    (n % 3, n % 5) match {
      case (0, 0) => fizz + buzz
      case (0, _) => fizz
      case (_, 0) => buzz
      case (_, _) => n.toString
    }

  for (n <- (1 to 100)) {
    println(fizzBuzz(n))
  }
}
