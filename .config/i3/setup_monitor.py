#!/bin/python3

import platform
import subprocess
import sys
import os
from datetime import datetime, timezone


def _get_xrandr_output_command(dpid: str, rate="60.00", turnoff=False):
    cmd = f"xrandr --output {dpid} {'--off' if turnoff else f'--mode 1920x1080 --rate {rate} --scale 1x1'}"
    return cmd.split(" ")


def _exec_command(cmd: list[str]):
    result = subprocess.run(cmd, capture_output=True)
    if result.returncode != 0:
        logfile.write(f"ERROR: {result.stderr.decode('utf-8')}\n")
    return result.stdout.decode("utf-8")


xresources_contents = """Xft.autohint: 0
Xft.antialias: 1
Xft.hinting: true
Xft.hintstyle: hintslight
Xft.rgba: rgb
Xft.lcdfilter: lcddefault
"""

with open("./setup_monitor.logs", "a") as logfile:
    if "linux" not in platform.platform().lower():
        logfile.write("ERROR: the script is only supported in a linux environtment\n")
        exit(1)

    sys.path.append(os.path.abspath("/"))
    home_dir = os.getenv("HOME", None)
    if not home_dir:
        logfile.write(
            "ERROR: $HOME not found. please make sure to run the script from a shell env.\n"
        )
        exit(1)

    xresources_file = f"{home_dir}/.Xresources"

    display_list_str = _exec_command(["xrandr"])
    display_list = list(
        map(
            lambda x: x.split(" ", 1)[0],
            filter(
                lambda x: x and x.split(" ", 2)[1] == "connected",
                display_list_str.split("\n")[1:],
            ),
        )
    )
    external_display = any(not dp.startswith("e") for dp in display_list)

    for dp in display_list:
        _exec_command(_get_xrandr_output_command(dp, turnoff=True))

    xresources_contents += "Xft.dpi: " + ("93\n" if external_display else "111\n")
    with open(xresources_file, "w") as xfile:
        xfile.write(xresources_contents)
    _exec_command(["xrdb", "-merge", xresources_file])

    for dp in display_list:
        rate = "60.00" if dp.startswith("e") else "60.00"
        if external_display and dp.startswith("e"):
            continue
        _exec_command(_get_xrandr_output_command(dp, rate=rate))

    logfile.write(f"SUCCESS: {datetime.now(timezone.utc).isoformat()}\n")
