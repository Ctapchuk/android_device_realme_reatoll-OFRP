# dynamic partition stuff
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Reserve 64MB in dynamic partitions
#BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 67108864
#BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 67108864

# fastbootd stuff
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery
#
