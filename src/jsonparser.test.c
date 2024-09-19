#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h> // Add this header
#include <cmocka.h>
#include "jsonparser.h"

static void test_jsonparser(void **state)
{
    (void)state; // unused variable

    // Call the function and verify the output
    assert_string_equal(jsonparser(), "Hello, World!");
}

int main(void)
{
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_jsonparser),
    };

    return cmocka_run_group_tests(tests, NULL, NULL);
}
