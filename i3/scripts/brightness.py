import subprocess
import sys


# simple python script to log scale brightness
def brightness(add):
    scales = [1, 2, 3, 5, 7, 10, 15, 20, 35, 50, 75]

    bashCommand = "brightnessctl g"
    process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    current, _ = process.communicate()
    bashCommand = "brightnessctl m"
    process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    max_val, error = process.communicate()

    current = int(current)
    max_val = int(max_val)
    p = current / max_val * 100

    s = p
    if add:
        scales.reverse()
        for sv in scales:
            if p < sv - 1:
                s = sv
    else:
        for sv in scales:
            if p > sv + 1:
                s = sv

    s = min(max(scales), max(min(scales), s))
    bashCommand = f"brightnessctl s {s}%"
    process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()


if __name__ == "__main__":
    if len(sys.argv) > 1:
        if sys.argv[1] == "add":
            brightness(True)
        else:
            brightness(False)
