#THIS WILL BE THE STRUCTURE OF THE COMMAND LINE INPUT
ruby copy.rb    file1.txt     file2.txt

# =>  ^^^^        ^^^^          ^^^^
#   leg-work     braille      new file w/
# =>                        decrypted message

#Step 1: Build a file that takes the command line inputs of two files, takes the contents of a file1, and creates a new file (filename = file2) containing the contents of file1.
contents = File.read(ARGV[0])

File.write(ARGV[1], contents)

#Step 2: Structure this file in a way take the contents of file1, manipulate the data within file1, and can output those results into a new file (filename = file2).
    #Step 2 Example: copy.rb file1.txt file2.txt
                  # if cat file1.txt = "this is a string"
                  # copy.rb takes [(cat file1.txt)*2] and outputs to file2.txt
                  # cat file2.txt = "this is a stringthis is a string"


#Step 3: Now that your file can manipulate data of one file, and return output to another...
  #...build a hash in this file that can take a braille character, and translate that to a roman output of a new file.



#Step 4: Now, find a way (in this file) to take the input of multiple braille characters, and break them down into single letter format.

#Step 5: Now that we found a way to take a string of multiple letters and put them into a readable format,
          # => 1) we must find out how the braille will look in a file, and when output to another string
                  # => 1 letter = "0.\n..\n..\n"
            # => 1a) How will multiple letters read?



          # => Since we can already slice an array into even elements, once we can see what the
          # => braille will look like after being passed into another file, we must come up with

          # => 2) a way to sub out new lines, so parser can set up decryptor for single letter
                  # => contents = "0.\n..\n..\n"
                  # => raw_contents = contents.gsub("\n","")

          # => 3) find a way to sub out new lines, so parser can set up decryptor with MULTIPLE LETTERS
                # => multiple_letters = "0.0.\n..0.\n....\n"
                # => file_read_parse = File.read("english.txt")
            #=> "[[\"0.\", \"0.\", \"..\"], [\"0.\", \"..\", \"..\"]]"
              # => file_read_parse.gsub("\"","") = "[[0., 0., ..], [0., .., ..]]"

          # => 3) a way to iterate through with multiple block variables


          # => 4) a way to combine the elements in the variables that share the same indices.



    #Step5 Hint - Iterate through your ARGV file and split each string into array with (string.split(string.length/2))
              # - Iterate through split arrays with three block variables
              # - Find a way to join the elements of the three block variables [(line1,line2,line3) that share the same indices!!!
              #                                                                                  [line1[0] + line2[0] + line3[0]]
              #                                                                                           ^^^^^^^^^^^^^
              #                                                                                    .find_all_by_index method?!




#Step 6: Find a way to spot capitals or numbers and build their exception.

#Step 7: Reverse engineer an encryption!

#Step 8: Find a way to echo number of characters and filename of file that is just created.
