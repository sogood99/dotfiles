import subprocess
import sys
import argparse
import re


scales = [1, 2, 3, 5, 7, 10, 15, 20, 35, 50, 75]


# simple python script to log scale brightness
def run(args):
    p = 50
    if args.interface == "brightness":
        bashCommand = "brightnessctl g"
        process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
        current, _ = process.communicate()
        bashCommand = "brightnessctl m"
        process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
        max_val, _ = process.communicate()

        current = int(current)
        max_val = int(max_val)
        p = current / max_val * 100
    elif args.interface == "sound":
        bashCommand = "amixer sget Master"
        process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
        p, _ = process.communicate()
        p = p.decode("ascii")
        print(p)
        m = re.search(r"(?<=(\[))([0-9]+)(?=(%\]))", p)
        p = int(m.group(0)) if m is not None else 50
    else:
        print("Unknown interface")

    s = p
    if args.add:
        scales.reverse()
        for sv in scales:
            if p < sv - 1:
                s = sv
    elif args.sub:
        for sv in scales:
            if p > sv + 1:
                s = sv

    s = min(max(scales), max(min(scales), s))
    bashCommand = "echo hello"
    if args.interface == "brightness":
        bashCommand = f"brightnessctl s {s}%"
    elif args.interface == "sound":
        bashCommand = f"amixer --quiet set Master {s}%"
    process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    process.communicate()


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
