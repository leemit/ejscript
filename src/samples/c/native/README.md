Native Sample
===

The native sample demonstrates how to create a fully native class. The class itself is
created in C code and its properties are represented as C language types.  A native 
class can be the most compact representation for some data types and is useful for 
creating virtual storage for properties. The native module is called Sample and the 
native class is called Shape.

## Files:

    Shape.es        - Class file for the Shape class
    Shape.c         - Native methods for the Shape class. Also contains the modules 
                      initialization entry point.
    Sample.slots.h  - Generated slot offsets for the Shape class. Generated by ejsmod.
    main.es         - Main test program

## To build:

    make

## To build and show commands:

    make TRACE=1

## To run:

    ejs main.es

## Requirements:

    This samples requires that Ejscript be configured and built with configure --shared. 
    However, the sample could be adapted for use in static programs if you manually
    invoke the ejsControlModuleInit() function from your main program. See the
    embed sample for how to embed Ejscript in an application.

## See Also:

    The composite sample for how to create a composite native class in which the class is
    created by the runtime and the properties are real JavaScript objects.