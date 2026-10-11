# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022 The Android Open Source Project

"""
This module contains a full list of kernel modules
 compiled by GKI.
"""

_COMMON_GKI_MODULES_LIST = [
    # keep sorted
    "drivers/block/zram/zram.ko",
    "drivers/bluetooth/btbcm.ko",
    "drivers/bluetooth/btqca.ko",
    "drivers/bluetooth/btsdio.ko",
    "drivers/bluetooth/hci_uart.ko",
    "drivers/net/ppp/bsd_comp.ko",
    "drivers/net/ppp/ppp_deflate.ko",
    "drivers/net/ppp/ppp_generic.ko",
    "drivers/net/ppp/ppp_mppe.ko",
    "drivers/net/ppp/pppox.ko",
    "drivers/net/ppp/pptp.ko",
    "drivers/net/slip/slhc.ko",
    "drivers/usb/class/cdc-acm.ko",
    "drivers/usb/serial/ftdi_sio.ko",
    "drivers/usb/serial/usbserial.ko",
    "kernel/kheaders.ko",
    "lib/crypto/libarc4.ko",
    "mm/zsmalloc.ko",
    "net/8021q/8021q.ko",
    "net/bluetooth/bluetooth.ko",
    "net/bluetooth/hidp/hidp.ko",
    "net/bluetooth/rfcomm/rfcomm.ko",
    "net/l2tp/l2tp_core.ko",
    "net/l2tp/l2tp_ppp.ko",
    "net/nfc/nfc.ko",
    "net/rfkill/rfkill.ko",
]

# Deprecated - Use `get_gki_modules_list` function instead.
COMMON_GKI_MODULES_LIST = _COMMON_GKI_MODULES_LIST

_ARM_GKI_MODULES_LIST = [
    # keep sorted
]

_ARM64_GKI_MODULES_LIST = [
    # keep sorted
]

_RISCV64_GKI_MODULES_LIST = [
    # keep sorted
]

_X86_GKI_MODULES_LIST = [
    # keep sorted
]

_X86_64_GKI_MODULES_LIST = [
    # keep sorted
]

# buildifier: disable=unnamed-macro
def get_gki_modules_list(arch = None):
    """ Provides the list of GKI modules.

    Args:
      arch: One of [arm, arm64, i386, x86_64, riscv64].

    Returns:
      The list of GKI modules for the given |arch|.
    """
    gki_modules_list = [] + _COMMON_GKI_MODULES_LIST
    if arch == "arm":
        gki_modules_list += _ARM_GKI_MODULES_LIST
    elif arch == "arm64":
        gki_modules_list += _ARM64_GKI_MODULES_LIST
    elif arch == "i386":
        gki_modules_list += _X86_GKI_MODULES_LIST
    elif arch == "x86_64":
        gki_modules_list += _X86_64_GKI_MODULES_LIST
    elif arch == "riscv64":
        gki_modules_list += _RISCV64_GKI_MODULES_LIST
    else:
        fail("{}: arch {} not supported. Use one of [arm, arm64, i386, x86_64, riscv64]".format(
            str(native.package_relative_label(":x")).removesuffix(":x"),
            arch,
        ))

    return gki_modules_list
