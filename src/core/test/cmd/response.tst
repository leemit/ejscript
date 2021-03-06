/*
    response.tst
 */

let ejs = Cmd.locate('ejs')

if (!Path("/bin").exists) {
    test.skip("Only run on unix systems")
} else {

    //  Read response as a string
    cmd = Cmd("echo Hello World")
    assert(cmd.readString().trim() == "Hello World")

    //  Can also read via the response property (multiple times)
    cmd = Cmd("echo Hello World")
    assert(cmd.response.trim() == "Hello World")
    assert(cmd.response.trim() == "Hello World")

    //  read() into a byte array
    cmd = Cmd("echo Hello World")
    ba = new ByteArray
    assert(cmd.read(ba) >= 11)
    assert(ba.toString().trim() == "Hello World")

    //  readLines()
    cmd = Cmd("ls -1 ..")
    assert(cmd.readLines().length > 30)

}
