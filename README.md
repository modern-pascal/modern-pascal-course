# Examples for the BSC course about modern Object Pascal

Course information: https://www.bsc.com.pl/szkolenie-nowoczesny-obiektowy-pascal/

The course was done online on 2025-04-09 and 2025-04-10. If you're interested in attending the next edition or similar courses, let BSC know: https://www.bsc.com.pl/about/kontakt/ .

## Examples

This repository contains the examples from the course.

**Compatibility**: Almost all the examples should compile with

- either Delphi or FPC (we tested Delphi 12 and FPC 3.2.2),

- any operating system (we tested Windows and Linux).

The exceptions are examples in `140_forms_etc` and `150_data_module_using_components`, which will compile only with Delphi, as they depend on FMX / VCL.

TODO: Some of the examples contain Polish comments or identifiers. We should translate them to English.

Note: We chose to use FPC "Delphi mode" for these examples, to have the simplest code that compiles with both Delphi and FPC. An alternative would be to use FPC "ObjFpc mode", which in our opinion brings some benefits over "Delphi mode" (e.g. `@` for callbacks has more sane behavior), but also more incompatibilities with Delphi (which would need to be addressed by adding `{$ifdef FPC}` or `{$ifdef FPC_OBJFPC}` around the code).

## Slides

Slides from the course:

- Day 1: https://castle-engine.io/bsc_pascal_1
- Day 2: https://castle-engine.io/bsc_pascal_2

The slides will stay in Polish, though in the future we may prepare translated English version as well.