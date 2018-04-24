#/bin/bash
xctool -workspace LiquidCoreiOS.xcodeproj/project.xcworkspace -scheme LiquidCoreiOS -sdk iphonesimulator run-tests -listTestsOnly | \
grep -o "testCcPassing[A-Za-z0-9_]*" | sed -e 's/^/LiquidCoreiOSTests:LiquidCoreiOSTests\//' | \
xargs -I % xctool -workspace LiquidCoreiOS.xcodeproj/project.xcworkspace -scheme LiquidCoreiOS -sdk iphonesimulator run-tests -only % | \
tee /var/tmp/run-passing-tests.log | \
grep 'LiquidCoreiOSTests'
