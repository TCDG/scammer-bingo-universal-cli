#define DZM_ELEVATED
#define DZM_DEVEL

#include "src/dzm.hpp"

#include <stdio.h>
#include <stdlib.h>

/*
  App needs to load bingo.scm automatically, that would be much better than relying on command-line args or REPL.

  ^^ TODO
 */

int
main(int argc, char** argv)
{
    test_init(argc, argv);
    
    return(0);
}
