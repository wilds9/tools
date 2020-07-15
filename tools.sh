TOOLS_RELATIVE='.local/opt/tools/'
if [[ ${HOME} == */ ]]; then
    TOOLS_ABSOLUTE=${HOME}${TOOLS_RELATIVE}
else
    TOOLS_ABSOLUTE=${HOME}'/'${TOOLS_RELATIVE}
fi
EXEC=${TOOLS_ABSOLUTE}'exec/'
COMMAND="find "${EXEC}" -type d"
for SUBDIR in `${COMMAND}`
do
    PATH=${PATH}:${SUBDIR}
done
source ${TOOLS_ABSOLUTE}'vars.sh'
