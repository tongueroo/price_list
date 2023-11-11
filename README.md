# Price List

The script uses a programming language called Ruby to process the data into a normalized CSV file.

Your computer needs Ruby installed. Macbooks have it installed by default, so it should work. If it does not or does not have the correct version of ruby, you'll need to let me know, and I can help install it.

## How It Works

The script reads an `input.txt` file line by line to extract the pricing data. It then prints out the data line by line into a CSV format.

If you're interested, the script's source code is here: [convert.rb](convert.rb)

## Usage

1. Copy data from pdf to a file called `input.txt`. Unfortunately, copying and pasting often does not smartly separate the fields into columns. IE: The pasted data is all in one column.
2. Run this script. Details below to produce an `output.csv.`
3. Import the `output.csv` file to Excel or Google Spreadsheets.
4. Manually clean up data. The script is not perfect.

## Script Usage Details

To run the script and see the output

    ruby convert.rb

To run the script and save the output

    ruby convert.rb > output.csv

The output is saved to the `output.csv` with the second way of running the script.
