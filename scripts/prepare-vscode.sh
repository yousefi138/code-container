#!/bin/bash

NAME=$1

BASE=/opt/ide

cd $NAME

## install any config files or packages needed by the container
apptainer exec -B $(pwd)/out:$BASE out/$NAME.sif bash prepare.sh

## create script for running VS Code tunnel in the container
SCRIPT=out/run-vscode.sh
cat <<EOF > $SCRIPT
#!/bin/bash

EXT_BASE=\$(dirname \$(realpath \$0))

WD=\$(realpath \$(pwd))

BINDS="-B \$WD"
for ARG in "\$@"; do
    ABS_PATH=\$(realpath "\$ARG" 2>/dev/null)
    if [ \$? -eq 0 ]; then
        BINDS="\${BINDS} -B \${ABS_PATH}"
    else
        echo "Warning: could not resolve '\${ARG}'"
    fi
done

echo "apptainer run --cwd \$WD -B \$EXT_BASE:/opt/ide \$BINDS \$EXT_BASE/$NAME.sif \$WD"

apptainer run --cwd \$WD -B \$EXT_BASE:$BASE \$BINDS \$EXT_BASE/$NAME.sif \$WD

EOF

chmod +x $SCRIPT
