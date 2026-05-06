---
name: User Role and Context
description: Markus is porting SCORM 1.2 integration from legacy monolith into three-repo architecture (rise-lms-driver, rise-frontend, rise-distributor)
type: user
---

Markus works on Rise (Articulate's product) and is an engineer who thinks architecturally about separation of concerns. Currently porting a SCORM 1.2 integration layer from a legacy monolithic codebase (EJS templates) into a clean three-repo split:

- **rise-lms-driver**: Fork of Rustici driver. LMS-specific functionality.
- **rise-frontend**: Rise frontend. Shared business logic across hosting environments.
- **rise-distributor**: Minimal glue layer that packages courses for distribution.

Has deep familiarity with the codebase and is asking SCORM-specification-level questions to inform architectural decisions, not basic implementation help.
