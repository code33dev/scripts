from PIL import Image
import sys
import random

def ascii_to_image(text_file, output_image):
    # Set the image dimensions (4096x4096)
    width, height = 4096, 4096
    # Create a new image with RGBA (Red, Green, Blue, Alpha) channels
    img = Image.new('RGBA', (width, height), (0, 0, 0, 0))
    pixels = img.load()

    # Read the ASCII text file
    with open(text_file, 'r') as file:
        lines = file.readlines()

    # Ensure the data fits into the 4096x4096 image
    max_rows = height
    if len(lines) > max_rows:
        print(f"Error: Text file has too many lines to fit in a {height}-row image.")
        return

    # Encode each line of text into the corresponding row of pixels
    for y, line in enumerate(lines):
        line = line.rstrip()  # Remove any trailing newline characters
        for x, char in enumerate(line):
            ascii_value = ord(char)
            pixels[x, y] = (ascii_value, 0, 0, 255)  # Red channel, full opacity

        # Fill the remaining pixels in the row with random colors
        for x in range(len(line), width):
            random_red = random.randint(1, 255)
            random_green = random.randint(1, 255)
            random_blue = random.randint(1, 255)
            pixels[x, y] = (random_red, random_green, random_blue, 255)  # Full opacity

    # Fill remaining rows with random pixels
    for y in range(len(lines), height):
        for x in range(width):
            random_red = random.randint(1, 255)
            random_green = random.randint(1, 255)
            random_blue = random.randint(1, 255)
            pixels[x, y] = (random_red, random_green, random_blue, 255)  # Full opacity

    # Save the image
    img.save(output_image)
    print(f"Image saved as {output_image}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_text_file> <output_image_file>")
    else:
        ascii_to_image(sys.argv[1], sys.argv[2])
