// import Mill dependency
import mill._
import mill.scalalib._
import mill.scalalib.scalafmt.ScalafmtModule
import mill.scalalib.TestModule.Utest
// support BSP
import mill.bsp._
// os path 
import os.Path

object zio extends ScalaModule with ScalafmtModule { m =>
  override def millSourcePath = os.pwd
  override def scalaVersion = "2.13.12"
  override def scalacOptions = Seq(
    "-language:reflectiveCalls",
    "-deprecation",
    "-feature",
    "-Xcheckinit",
  )
  override def ivyDeps = Agg(
    ivy"org.chipsalliance::chisel:5.1.0",
  )
  override def scalacPluginIvyDeps = Agg(
    ivy"org.chipsalliance:::chisel-plugin:5.1.0",
  )
 object test extends ScalaTests with Utest{
   override def ivyDeps = m.ivyDeps() ++ Agg(
      //ivy"org.scalatest::scalatest:3.0.0",
      ivy"edu.berkeley.cs::chiseltest:5.0.1",
   )
 } 
}

