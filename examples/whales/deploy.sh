#!/bin/sh

set -x

# Deploy functions
fission env create --name binary --image fission/binary-env:0.3.0
fission fn create --name whalesay --env binary --code ./whalesay.sh
fission fn create --name fortune --env binary --code ./fortune.sh

# Deploy workflows
fission fn create --name fortunewhale --env workflow --code ./fortunewhale.wf.json
fission fn create --name echowhale --env workflow --code ./echowhale.wf.json
fission fn create --name maybewhale --env workflow --code ./maybewhale.wf.json
fission fn create --name nestedwhale --env workflow --code ./nestedwhale.wf.json
