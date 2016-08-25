#define DZM_ELEVATED
#define DZM_DEVEL

#include "dzm/src/dzm.hpp"

#include <stdio.h>
#include <stdlib.h>

/*
  App needs to load bingo.scm automatically, that would be much better than relying on command-line args or REPL.

  ^^ TODO
 */

int
main()
{
    
    GlobalArena = (MEMORY_ARENA *)malloc(sizeof(MEMORY_ARENA));
    
    if(!GlobalArena)
    {
         printf("Memory initialization error!\n");
         exit(-1);
    }
    
    initialize_arena(GlobalArena, MAX_VM_SIZE, malloc(MAX_VM_SIZE));
    
    init_mem();
    
    init_logging();
    FILE *Log = fopen("dzm_log.txt", "w");
    set_log_output(Log);
    set_log_verbose(1);
    
    init_defs();
    test_load_file("std/stdlib.scm");
    
    test_load_file("bingo.scm");

    // TODO(zaklaus): Get rid of it as soon as we implement the cli.
    test_repl();
    
    fclose(Log);
    return(0);
}
