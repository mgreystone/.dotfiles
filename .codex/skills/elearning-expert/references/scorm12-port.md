---
name: SCORM 1.2 Port Architecture
description: Rise is porting legacy SCORM 1.2 EJS templates into three-repo split; distributor already has imsmanifest, metadata.xml, Rustici indexAPI wrapper
type: project
---

Legacy code has five EJS templates (lms-proxy, functions, scorm12, driverOptions, preloadIntegrity) that get rendered into a single HTML page. The port needs to split these across rise-lms-driver, rise-frontend, and rise-distributor.

Key architectural observations from the current codebase:

- rise-distributor already has SCORM 1.2 packaging (imsmanifest.xml.liquid, metadata.xml.liquid, schema XSDs)
- rise-distributor has a Rustici-derived indexAPI.html.liquid entry template that loads scormdriver.js and manages iframe-based content loading
- The `lms` preset configures scormcontent/ and scormdriver/ directory split
- rise-distributor references rise-lms-driver assets by version from S3 (scormdriver.js, browsersniff.js, blank.html, AICCComm.html, auto-scripts/\*)
- LMS target is currently only 'scorm12' (see LMSTargetEntitySchema)
- The entry template already has `verifySuspendDataVersion(3)` and bookmark/AICC detection logic inline

**Why:** Need to determine which legacy concerns (LMS proxy hooks, LZW compression, completeOut reporting modes, interaction recording) belong in which repo based on SCORM 1.2 spec boundaries.

**How to apply:** Use this context when advising on the architectural split. The distributor should remain a minimal glue layer.
