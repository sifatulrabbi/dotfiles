#!/bin/python3

import platform
import subprocess
import sys
import os


power_connected = "on-line" in subprocess.run(
    ["acpi", "-a"], capture_output=True
).stdout.decode("utf-8")

subprocess.run(
    [
        "system76-power",
        "profile",
        "performance" if power_connected else "battery",
    ]
)


def _get_xrandr_output_command(
    dpid: str,
    rate="60.00",
    turnoff=False,
    *,
    position: str | None = None,
    primary_display: str | None = None,
):
    cmd = f"xrandr --output {dpid}"
    if turnoff:
        cmd += " --off"
    else:
        cmd += f" --mode 1920x1080 --rate {rate} --scale 1x1"
    if position and primary_display:
        cmd += f" --{position}-of {primary_display}"
    return cmd.split(" ")


def _exec_command(cmd: list[str]):
    result = subprocess.run(cmd, capture_output=True)
    if result.returncode != 0:
        logfile.write(f"ERROR: {result.stderr.decode('utf-8')}\n")
    return result.stdout.decode("utf-8")


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
# builtin_display = "eDP-1-0" # with nvidia
# builtin_display = "eDP" # without nvidia
# ext_display = "DP-0"
builtin_display = list(filter(lambda x: x.startswith("e"), display_list))[0]
ext_display = list(filter(lambda x: not x.startswith("e"), display_list))
if ext_display:
    ext_display = ext_display[0]
ext_display_connected = ext_display in display_list

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

    for dp in display_list:
        _exec_command(_get_xrandr_output_command(dp, turnoff=True))

    xresources_contents += "Xft.dpi: " + ("96\n" if ext_display_connected else "108\n")
    with open(xresources_file, "w") as xfile:
        xfile.write(xresources_contents)
    _exec_command(["xrdb", "-merge", xresources_file])

    builtin_display_rate = "300.00" if power_connected else "60.00"
    if ext_display_connected:
        _exec_command(_get_xrandr_output_command(ext_display))
        if power_connected:
            _exec_command(
                _get_xrandr_output_command(
                    builtin_display,
                    position="left",
                    primary_display=ext_display,
                    rate=builtin_display_rate,
                )
            )
    else:
        _exec_command(
            _get_xrandr_output_command(builtin_display, rate=builtin_display_rate)
        )

    ## automated display detection
    # for dp in display_list:
    #     rate = "60.00" if dp.startswith("e") else "74.97"
    #     if ext_display_connected and dp.startswith("e") and not power_connected:
    #         continue
    #     if dp.startswith("e") and ext_display_connected:
    #         _exec_command(
    #             _get_xrandr_output_command(
    #                 dp, rate=rate, position="left", primary_display=ext_display
    #             )
    #         )
    #     else:
    #         _exec_command(_get_xrandr_output_command(dp, rate=rate))
    #
    # logfile.write(f"SUCCESS: {datetime.now(timezone.utc).isoformat()}\n")
