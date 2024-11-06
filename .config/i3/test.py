import subprocess

# acpi -a

result = subprocess.run(["acpi", "-a"], capture_output=True)
result = result.stdout.decode("utf-8")
print("on-line" in result)
