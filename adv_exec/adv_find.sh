INFILE=$1

find . -type f -name "$INFILE" -exec ls -la {} \;
count=$(find . -type f -name "$INFILE" -exec ls -la {} \; | wc -l | sed 's/^[ \t]*//g')

echo "Found $count files"

if [ "$count" == "0" ]; then
    exit 1;
fi


# Read input.
echo "Please input d to delete all found files or exit"
read input_char

# Check input char.
if [ "$input_char" == "d" ]; then
    echo "Delete all $INFILE!"
    find . -type f -name "$INFILE" -exec rm {} \;
else
    echo "Don't delete anything"
    echo ""
    exit 1;
fi
