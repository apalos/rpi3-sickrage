#!/bin/sh

install $STAGING_DIR/lib/libgcc_s.so.1 $TARGET_DIR/lib/
#(TARGET_STRIP) $(TARGET_DIR)/lib/libgcc_s.so.1
install $STAGING_DIR/usr/lib/libstdc++.so.6 $TARGET_DIR/lib/
#(TARGET_STRIP) $(TARGET_DIR)/lib/libstdc++.so.6
