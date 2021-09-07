#!/bin/bash

if [ -z ${SYSDBA_PASSWORD} ]; then
  SYSDBA_PASSWORD="masterkey"
fi

CURRENT_IBASE_PASSWORD=`grep -Po '(?<=ISC_PASSWD=)[^\s]*' ${PREFIX}/SYSDBA.password`

${PREFIX}/bin/gsec -user SYSDBA -password "${CURRENT_IBASE_PASSWORD}" -modify SYSDBA -pw "${SYSDBA_PASSWORD}"

cat > ${PREFIX}/SYSDBA.password <<EOL
# Firebird generated password for user SYSDBA is:
ISC_USER=SYSDBA
ISC_PASSWD=${SYSDBA_PASSWORD}
EOL

$@
