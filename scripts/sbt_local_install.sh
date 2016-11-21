#!/bin/bash

# exit on error
set -e

SBT_BIN=~/local/bin
mkdir -p ${SBT_BIN}

cd ${SBT_BIN}
VER=0.13.11
#curl -LO https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/${VER}/sbt-launch.jar

echo "#!/bin/bash
SBT_OPTS=\"-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M\"
java \$SBT_OPTS -jar ${SBT_BIN}/sbt-launch.jar \"\$@\"" > ${SBT_BIN}/sbt

chmod a+x ${SBT_BIN}/sbt
