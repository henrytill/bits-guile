#include <libguile.h>

#include "config.h"

static SCM guile_bits_version(void) {
  const char *s = PACKAGE_VERSION;
  if (s == NULL) {
    return SCM_BOOL_F;
  } else {
    return scm_from_locale_string(s);
  }
}

static void inner_main(__attribute__((unused)) void *closure, int argc, char *argv[]) {
  scm_c_define_gsubr("guile-bits-version", 0, 0, 0, guile_bits_version);
  scm_shell(argc, argv);
}

int main(int argc, char *argv[]) {
  scm_boot_guile(argc, argv, inner_main, 0);
  return 0;
}
