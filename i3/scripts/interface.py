import subprocess
import argparse
import re
import sys


# log scales
scales = [1, 2, 3, 5, 7, 10, 15, 20, 30, 40, 50, 60, 70, 80]


# simple python script to log scale brightness
def run(args):
    p = 50
    if args.interface == "brightness":
        try:
            current = int(
                subprocess.check_output(["brightnessctl", "g"], text=True).strip()
            )
            max_val = int(
                subprocess.check_output(["brightnessctl", "m"], text=True).strip()
            )
            p = current / max_val * 100
            p = round(p)
        except (subprocess.CalledProcessError, ValueError) as e:
            print(f"Error: Unable to retrieve brightness values: {e}")
            sys.exit(1)
    elif args.interface == "sound":
        try:
            output = subprocess.check_output(["amixer", "sget", "Master"], text=True)
            m = re.search(r"(?<=(\[))([0-9]+)(?=(%\]))", output)
            p = int(m.group(0)) if m else 50
        except (subprocess.CalledProcessError, ValueError) as e:
            print(f"Error: Unable to retrieve sound levels: {e}")
            sys.exit(1)
    else:
        print("Unknown interface")
        sys.exit(1)

    # find the index of closest scale
    idx = 0
    for i, s in enumerate(scales):
        if p >= s:
            idx = i

    # add or subtract
    def clamp(n, minn, maxn):
        return max(min(maxn, n), minn)

    if args.add:
        idx += 1
    elif args.sub:
        idx -= 1
    idx = clamp(idx, 0, len(scales) - 1)

    s = scales[idx]

    bashCommand = (
        f"brightnessctl s {s}%"
        if args.interface == "brightness"
        else f"pactl set-sink-volume @DEFAULT_SINK@ {s}%"
    )
    subprocess.run(bashCommand.split())


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process some integers.")
    parser.add_argument(
        "--interface",
        type=str,
        help="Either 'brightness' or 'sound'",
    )
    parser.add_argument(
        "--add",
        action="store_true",
        help="Whether add or subtract",
    )
    parser.add_argument(
        "--sub",
        action="store_true",
        help="Whether add or subtract",
    )
    args = parser.parse_args()
    run(args)
