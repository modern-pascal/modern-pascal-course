# Examples for the BSC course about modern Object Pascal

Course information: https://www.bsc.com.pl/szkolenie-nowoczesny-obiektowy-pascal/

The course was done online on 2025-04-09 and 2025-04-10. If you're interested in attending the next edition or similar courses, let BSC know: https://www.bsc.com.pl/about/kontakt/ .

## Examples

This repository contains the examples from the course.

**Compatibility**: Almost all the examples should compile with:

- either Delphi or FPC compilers (we tested Delphi 12, FPC 3.2.2, FPC 3.3.1 from 2025-03-02),

- any operating system (we tested Windows and Linux).

The exceptions are

- Examples in `140_forms_etc` and `150_data_module_using_components`, which will compile only with Delphi, as they depend on FMX / VCL.

- Examples in `310_anonymous`, `305_callbacks_assigning`, `300_callbacks_events` which show anonymous functions and function references. They will compile only in Delphi or FPC >= 3.3.1. Older FPC 3.2.2 didn't have anonymous functions and function references implemented.

TODO: Some of the examples contain Polish comments or identifiers. We should translate them to English.

Note: Most of the examples show the correct, recommended way of doing something. They should work correctly and exhibit no memory leaks. The exceptions are examples marked with `DELIBERATELY_INCORRECT` in the directory name -- these are knowingly incorrect for some reason, to illustate something.

Note: We chose to use FPC "Delphi mode" for these examples, to have the simplest code that compiles with both Delphi and FPC. An alternative would be to use FPC "ObjFpc mode", which in our opinion brings some benefits over "Delphi mode" (e.g. `@` for callbacks has more sane behavior), but also more incompatibilities with Delphi (which would need to be addressed by adding `{$ifdef FPC}` or `{$ifdef FPC_OBJFPC}` around the code).

## Slides

Slides from the course:

- Day 1: https://castle-engine.io/bsc_pascal_1
- Day 2: https://castle-engine.io/bsc_pascal_2

The slides are in Polish. In the future we may prepare translated English version as well.