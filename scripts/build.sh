(dart run build_runner build --delete-conflicting-outputs) &

(cd modules/data && dart run build_runner build --delete-conflicting-outputs) &

(cd modules/domain && dart run build_runner build --delete-conflicting-outputs) &

wait