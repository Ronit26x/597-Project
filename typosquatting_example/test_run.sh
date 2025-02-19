PACKAGE_NAME="requsete"
TEST_SCRIPT="test.py"

echo "Installing/upgrading $PACKAGE_NAME..."
pip install -U $PACKAGE_NAME

if [ ! -f "$TEST_SCRIPT" ]; then
    echo "Creating $TEST_SCRIPT..."
    cat <<EOL > $TEST_SCRIPT
import requsete

requsete.get('https://httpbin.org/basic-auth/user/pass', auth=('user', 'pass'))
EOL
fi

echo "Running $TEST_SCRIPT..."
python3 $TEST_SCRIPT
