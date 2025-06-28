output=/home/user/projects/MicroPythonOS/apps/
outputjson="$output"/app_index.json
output=$(readlink -f "$output")
outputjson=$(readlink -f "$outputjson")

#mpks="$output"/mpks/
#icons="$output"/icons/

mkdir -p "$output"
#mkdir -p "$mpks"
#mkdir -p "$icons"

#rm "$output"/*.mpk
#rm "$output"/*.png
rm "$outputjson"

echo "[" | tee -a "$outputjson"

# currently, this script doesn't purge unnecessary information from the manifests, such as activities

for apprepo in internal_filesystem/apps internal_filesystem/builtin/apps; do
    echo "Listing apps in $apprepo"
    ls -1 "$apprepo" | while read appdir; do
        echo "Bundling $apprepo/$appdir"
        pushd "$apprepo"/"$appdir"
        manifest=META-INF/MANIFEST.JSON
        version=$( jq -r '.version' "$manifest" )
        cat "$manifest" | tee -a "$outputjson"
        echo -n "," | tee -a "$outputjson"
        thisappdir="$output"/apps/"$appdir"
        mkdir -p "$thisappdir"
        mkdir -p "$thisappdir"/mpks
        mkdir -p "$thisappdir"/icons
        mpkname="$thisappdir"/mpks/"$appdir"_"$version".mpk
        echo "Setting file modification times to a fixed value..."
        find . -type f -exec touch -t 202501010000.00 {} \;
        echo "Creating $mpkname with deterministic file order..."
        find . -type f | sort | TZ=CET zip -X "$mpkname" -@
        cp res/mipmap-mdpi/icon_64x64.png "$thisappdir"/icons/"$appdir"_"$version"_64x64.png
        popd
    done
done

# remove the last , to have valid json:

truncate -s -1 "$outputjson"

echo "]" | tee -a "$outputjson"
