from PIL import Image
import sys

def image_to_ascii(input_image, output_text_file):
    # Open the image
    img = Image.open(input_image)
    pixels = img.load()

    width, height = img.size

    # Prepare to write the decoded text to a file
    with open(output_text_file, 'w') as file:
        for y in range(height):
            line = []
            for x in range(width):
                r, g, b, a = pixels[x, y]
                # Decode only pixels that match the encoded ASCII values (R, 0, 0, 255)
                if a == 255 and g == 0 and b == 0 and r > 0:
                    line.append(chr(r))
                elif len(line) > 0:
                    # If we've started a line and hit a non-(R, 0, 0, 255) pixel, assume end of line
                    break

            # Write the line to the output file, including empty lines
            file.write(''.join(line) + '\n')

    print(f"ASCII text restored and saved to {output_text_file}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_image_file> <output_text_file>")
    else:
        image_to_ascii(sys.argv[1], sys.argv[2])
